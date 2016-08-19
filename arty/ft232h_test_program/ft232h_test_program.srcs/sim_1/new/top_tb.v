`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2016 07:39:43 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb;

// reg CLK100MHZ;
reg USB_CLK;
reg [7:0] ADC_DATA;
wire [7:0] USB_DATA;

top top_i(
    CLK100MHZ,
    CIS_MODE,
    CIS_CLK,
    CIS_SP,
    CIS_LED_BLUE,
    CIS_LED_GREEN,
    CIS_LED_RED,
    SCOPE_SYNC,
    ADC_DATA,
    USB_CLK,
    USB_DATA
    );

initial begin
    ADC_DATA = 8'h64;
end

always begin
//    CLK100MHZ = 1'b0;
//    #5;
//    CLK100MHZ = 1'b1;
//    #5;

    USB_CLK = 1'b0;
    #8.333;
    USB_CLK = 1'b1;
    #8.333;
end
    
endmodule