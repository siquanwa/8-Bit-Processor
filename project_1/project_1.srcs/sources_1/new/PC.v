`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2021 08:00:27 PM
// Design Name: 
// Module Name: PC
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


module PC(
    input clk,
    input [7:0] input_address,
    output [7:0] output_address
    );
reg [7:0] pc;

initial begin
    pc <= 8'd0;
end

always @(posedge clk) begin
  pc <= input_address;
end

assign output_address = pc;

endmodule
