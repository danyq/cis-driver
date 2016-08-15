`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2016 05:02:16 PM
// Design Name: 
// Module Name: top
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


module top(
//    input CLK100MHZ,
//    output reg CLK50MHZ,
    input CLKIN,
    output reg [7:0] DATA
    );
     
    always @(posedge CLKIN) begin
        DATA <= DATA + 1;
    end
    
//    always @(posedge CLK100MHZ) begin
//       CLK50MHZ <= ~CLK50MHZ;
//    end
endmodule
