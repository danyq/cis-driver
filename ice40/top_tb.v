`timescale 1ns / 1ps

module top_tb;

    initial begin
        $dumpfile("top.vcd");
        $dumpvars(0,top_tb);
    
        # 10000 $finish;
    end

    reg USB_CLK;
    reg [7:0] ADC_DATA;
    wire [7:0] USB_DATA;
    
    top top_i(
        // Inputs from USB IC
        USB_CLK,
        // Inputs from ADC
        ADC_DATA,
        
        // Outputs to CIS module
        CIS_MODE,
        CIS_CLK,
        CIS_SP,
        CIS_LED_BLUE,
        CIS_LED_GREEN,
        CIS_LED_RED,
        
        // Outputs to USB IC
        USB_DATA,
        USB_WR_L,
        
        // Outputs to ADC
        ADC_CLK,
        
        // Outputs to oscilloscope
        SCOPE_SYNC
        );
    
    initial begin
        ADC_DATA = 8'h64;
    end
    
    always begin
        USB_CLK = 1'b0;
        #8.333;
        USB_CLK = 1'b1;
        #8.333;
    end
    
endmodule
