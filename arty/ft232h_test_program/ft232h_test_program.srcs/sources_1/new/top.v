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
    input CLK100MHZ,
    output CIS_MODE,
    output reg CIS_CLK,
    output reg CIS_SP,
    output reg CIS_LED_BLUE,
    output reg CIS_LED_GREEN,
    output reg CIS_LED_RED,
    output reg SCOPE_SYNC,
    input [7:0] ADC_DATA,
    input USB_CLK,
    output [7:0] USB_DATA
    );
    
    assign CIS_MODE = 1'b0;
    
    assign USB_DATA = ADC_DATA;
    
//    reg [3:0] counter_100MHZ;
    reg [3:0] counter_60MHZ;
    reg [11:0] counter_cis;
   
    initial begin
//        counter_100MHZ = 4'd1;
        counter_60MHZ = 4'd1;
        CIS_CLK = 1'b0;
        counter_cis = 12'd1;
        CIS_SP = 1'b1;
        SCOPE_SYNC = 1'b0;
        CIS_LED_BLUE = 1'b1;
        CIS_LED_GREEN = 1'b1;
        CIS_LED_RED = 1'b1;
    end
    
//    always @(posedge CLK100MHZ) begin
//        // implement clock divider
//        if (counter_100MHZ == 4'd10) begin
//            counter_100MHZ <= 4'd1;
//            CIS_CLK <= ~CIS_CLK;
//        end else begin
//            counter_100MHZ <= counter_100MHZ + 4'd1;
//        end
//    end

    always @(posedge USB_CLK) begin
        // implement clock divider
        if (counter_60MHZ == 4'd6) begin
            counter_60MHZ <= 4'd1;
            CIS_CLK <= ~CIS_CLK;
        end else begin
            counter_60MHZ <= counter_60MHZ + 4'd1;
        end
    end
    
    always @(posedge CIS_CLK) begin
        // update LED settings
        if (counter_cis == 12'd40) begin
            CIS_LED_BLUE <= 1'b0;
            CIS_LED_GREEN <= 1'b0;
            CIS_LED_RED <= 1'b0;
        end else if (counter_cis == 12'd70) begin
            CIS_LED_BLUE <= 1'b1;
            CIS_LED_GREEN <= 1'b1;
            CIS_LED_RED <= 1'b1;
        end
        
        // update CIS counter
        if (counter_cis == 12'd3000) begin
            counter_cis <= 12'd1;
            CIS_SP <= 1'b1;
        end else begin
            counter_cis <= counter_cis + 12'd1;
            CIS_SP <= 1'b0;
        end
        
        // update SCOPE_SYNC signal
        if (counter_cis == 12'd1000) begin
            SCOPE_SYNC <= 1'b1;
        end else begin
            SCOPE_SYNC <= 1'b0;
        end
    end

endmodule
