`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2021 08:45:08 PM
// Design Name: 
// Module Name: control
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


module control(
    input [2:0] opcode,
    output jump,
    output regWrite,
    output aluSource,
    output aluOp,
    output writeMem,
    output readMem,
    output memToReg
    );
    reg [7:0]temp;
    
   parameter
   lw = 3'd0,
   sw = 3'd1,
   jmp = 3'd2,
   add = 3'd3,
   addi = 3'd4,
   sub = 3'd5;
   
   always @(*)
   begin 
   case(opcode)
                lw : temp = 8'b00110010;
                sw : temp = 8'b00010100;
                jmp : temp = 8'b01000000;
                add : temp = 8'b00100001;
                addi : temp = 8'b00110001;
                sub : temp = 8'b00101001;
   endcase
   end
   
   assign jump = temp[6];
   assign regWrite = temp[5];
   assign aluSource = temp[4];
   assign aluOp = temp[3];
   assign writeMem = temp[2];
   assign readMem = temp[1];
   assign memToReg = temp[0];
   
   
endmodule
