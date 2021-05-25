`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2021 07:02:33 PM
// Design Name: 
// Module Name: mux
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


module mux(
    input [7:0] address_a,
    input [7:0] address_b,
    input select_bit,
    output [7:0] output_address
    );
    reg[7:0] temp_address;
    
    initial begin
    temp_address = 8'd0;
    end
    
    always @(*)begin// || address_b || select_bit)begin
    if(select_bit == 0)begin
        temp_address = address_a;
    end
    else begin
        temp_address = address_b;
    end
    end
    
    assign output_address = temp_address;
endmodule
