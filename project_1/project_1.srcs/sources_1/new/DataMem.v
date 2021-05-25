`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2021 12:45:13 AM
// Design Name: 
// Module Name: DataMem
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


module DataMem( input [7:0] data_address,
                input [7:0] write_data,
                input read_ins,
                input write_ins,
                input clk,
                output [7:0] read_data 

    );
    reg [7:0] data_memory [255:0];
    reg [7:0] tempData;
    integer i;
    
    initial begin
    tempData = 8'd0;
    for(i = 0; i < 256; i = i + 1)
     data_memory[i] = 0;
    end
    
    always @ (*)//posedge clk)
    begin
        if(read_ins == 1)
        begin
        tempData <= data_memory[data_address];
        end
        if(write_ins == 1)
        begin
        data_memory[data_address] <= write_data;
        end
     end
     
     assign read_data = tempData;
        
endmodule
