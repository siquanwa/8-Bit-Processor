`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2021 09:37:31 PM
// Design Name: 
// Module Name: Instruction_memory
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


module Instruction_memory(
    input [7:0] input_address,
    output [7:0] instruction
    );
    integer i;
    reg[7:0] memory[255:0];
    wire[7:0] memory_address;
    
    initial begin
    for(i = 0; i < 256; i = i + 1)begin
     memory[i] = 0;
    end
    memory[0] = 8'b10000010; //addi r0, r0, 2
    memory[1] = 8'b10000010; //addi r0, r0, 2
    memory[2] = 8'b10011010; //addi r1, r1, 2
    memory[3] = 8'b01110000; //add r1, r1, r0
    memory[4] = 8'b00101000; //sw r0, 0(r1)
    memory[5] = 8'b10000110; //addi r0, r0, -2
    memory[6] = 8'b00001000; //lw r0, 0(r1)
    memory[7] = 8'b10101000; //sub r0, r0, r1
    memory[8] = 8'b01010000; //jmp 0x10
    memory[16] = 8'b10011101;//addi r1, r1, -3
    memory[17] = 8'b00001011;//lw r0, 3(r1)
    end
    
    assign instruction = memory[input_address];
    
    
endmodule
