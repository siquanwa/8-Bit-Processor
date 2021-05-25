`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2021 12:13:14 PM
// Design Name: 
// Module Name: SignEx
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


module sign_extend(input [2:0] immediate,
              output reg[7:0] extended
    );
    //reg msb;//register to store the msb
    //initial begin
   //assign msb = immediate[2];
  // if (msb==1)
  always @(immediate)begin
  if(immediate[2]==1)
   begin 
    extended[7:3]=5'b11111;
    extended[2:0]=immediate;
   end
   //if(msb==0)
   if(immediate[2]==0)begin 
   extended[7:3]=5'b00000;
   extended[2:0]=immediate;
   end
   end
   
    
endmodule
