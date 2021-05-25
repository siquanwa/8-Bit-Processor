`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2021 08:56:45 PM
// Design Name: 
// Module Name: Reg_file
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: t
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Reg_file( input clk,
                 input write_en,
                 input reg_rs_addr,
                 input reg_rtd_addr,
                 input [7:0]reg_rtd_data,
                 output [7:0]reg_read_rs_data,
                 output [7:0]reg_read_rtd_data
    );
    reg[7:0] reg_array[1:0];
    integer i;
    initial begin
    reg_array[0] = 8'b00000000;
    reg_array[1] = 8'b00000000;
    end
    
    always @(posedge clk)begin
    if(write_en == 1)
    begin
    reg_array[reg_rtd_addr] <= reg_rtd_data;
    end
    end
    
    assign reg_read_rs_data = reg_array[reg_rs_addr];
    assign reg_read_rtd_data = reg_array[reg_rtd_addr];

endmodule
