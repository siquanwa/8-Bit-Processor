`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2021 08:23:49 PM
// Design Name: 
// Module Name: testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench(
    
    );
    
    reg clk;
    wire [7:0] current_address;
    wire [7:0] next_address;
    wire [7:0] incremented_address;
    wire [7:0] instruction;
    
    wire [7:0]immediate;
    wire [7:0]rs;
    wire [7:0]rdt;
    wire [7:0]aluMux;
    
    wire [7:0]aluData;
    wire [7:0]memData;
    wire [7:0]writeData;
    
    wire jump;
    wire regWrite;
    wire aluSource;
    wire aluOp;
    wire writeMem;
    wire readMem;
    wire memToReg;
    
    integer i;
    
    PC p(.clk(clk), .input_address(next_address), .output_address(current_address));
    pc_adder pa(.input_address(current_address), .output_address(incremented_address));
    mux mux_address(.address_a(incremented_address), .address_b({incremented_address[7:5], instruction[4:0]}), .select_bit(jump), .output_address(next_address));
    Instruction_memory im(.input_address(current_address), .instruction(instruction));
    
    control c(.opcode(instruction[7:5]), .jump(jump), .regWrite(regWrite), .aluSource(aluSource), .aluOp(aluOp), .writeMem(writeMem), .readMem(readMem), .memToReg(memToReg));
    
    Reg_file regMem(.clk(clk), .write_en(regWrite), .reg_rs_addr(instruction[3]), .reg_rtd_addr(instruction[4]), .reg_rtd_data(writeData), .reg_read_rs_data(rs), .reg_read_rtd_data(rdt));
    sign_extend se(.immediate(instruction[2:0]), .extended(immediate));
    mux mux_alu(.address_a(rdt), .address_b(immediate), .select_bit(aluSource), .output_address(aluMux));
    ALU alu(.data1(rs), .data2(aluMux), .opcode(aluOp), .ALUout(aluData));
    DataMem memory(.data_address(aluData), .write_data(rdt), .read_ins(readMem), .write_ins(writeMem), .clk(clk), .read_data(memData));
    mux mux_writeData(.address_a(memData), .address_b(aluData), .select_bit(memToReg), .output_address(writeData));
    
    initial begin
     clk = 1;
    end
    
    initial
        $monitor("input_address(%b) = output_address(%b) instruction(%b)", current_address, next_address, instruction);
    
    always
        begin
        for (i = 0; i<21; i=i+1) begin 
            #1 clk = !clk;
        end
            
        #1 $stop;
        end
    
endmodule
