`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 02:05:04 PM
// Design Name: 
// Module Name: ALU
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


module ALU( input [7:0] data1,
            input [7:0] data2,
            input opcode,
            output reg [7:0] ALUout
            );

   parameter
   opcode_sub = 3'd1,
   opcode_add = 3'd0;
   
   always @(*)
   begin 
   case(opcode)
                opcode_add : ALUout = data1 + data2;
                opcode_sub : ALUout = data1 - data2;
   endcase
   end
   
   
   
endmodule
