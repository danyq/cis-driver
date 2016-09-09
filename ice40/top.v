`timescale 1ns / 1ps

// select 300 DPI or 600 DPI mode
`define DPI_300
// `define DPI_600

// Period of CIS clock is equal to 60MHz/USB_CLK_DIV
// Must be an even number
`define USB_CLK_DIV 'd6

// Sample ADC 16.7ns before the next rising edge of CIS_CLK
`define ADC_CLK_DELAY (`USB_CLK_DIV/2)

// Issue write pulse immediately before next rising edge of ADC_CLK
`define WR_PULSE_DELAY (`USB_CLK_DIV/2)-1

// define the clock window when the LED needs to be off
`define CIS_LED_OFF 'd40
`define CIS_LED_ON 'd70

// define the clock cycle at which the oscilloscope should be triggered
`define SCOPE_SYNC_POS 'd1000

`ifdef DPI_300
    `define CIS_CLK_PER_LINE 'd2700
`else
    `define CIS_CLK_PER_LINE 'd5300
`endif

module top(
    // Inputs from USB IC
    input USB_CLK,
    // Inputs from ADC
    input [7:0] ADC_DATA,
    
    // Outputs to CIS module
    output CIS_MODE,
    output reg CIS_CLK,
    output reg CIS_SP,
    output reg CIS_LED_BLUE,
    output reg CIS_LED_GREEN,
    output reg CIS_LED_RED,
    
    // Outputs to USB IC
    output [7:0] USB_DATA,
    output reg USB_WR_L,
    
    // Outputs to ADC
    output reg ADC_CLK,
    
    // Outputs to oscilloscope
    output reg SCOPE_SYNC
    );
    
    // internal reg variables
    reg [3:0] counter_usb_clk;
    reg [12:0] counter_cis_clk;
    
    // Set the DPI mode of the scanner
    `ifdef DPI_300
        assign CIS_MODE = 'b0;
    `else
        assign CIS_MODE = 'b1;
    `endif
    
    assign USB_DATA = ADC_DATA;
    
    initial begin
        // output initializations
        USB_WR_L = 'b0;
        CIS_CLK = 'b0;
        CIS_SP = 'b1;
        CIS_LED_BLUE = 'b1;
        CIS_LED_GREEN = 'b1;
        CIS_LED_RED = 'b1;
        SCOPE_SYNC = 'b0;
        
        // internal counter variables
        counter_usb_clk = 'd1;
        counter_cis_clk = 'd1;
        
    end
    
    // Generate the clock used to read out from the CIS module
    // by dividing down the 60MHz clock
    always @(posedge USB_CLK) begin
        
        // Generate the CIS clock signal
        if (0 <= counter_usb_clk && counter_usb_clk < (`USB_CLK_DIV/2)) begin
            CIS_CLK <= 'b1;
        end else begin
            CIS_CLK <= 'b0;
        end
                
        // Increment the clock counter
        if (counter_usb_clk == (`USB_CLK_DIV-1)) begin
            counter_usb_clk <= 'd0;
        end else begin
            counter_usb_clk <= counter_usb_clk + 'd1;
        end
    end

    always @(negedge USB_CLK) begin
        // Generate the shifted ADC sampling clock
        if (`ADC_CLK_DELAY <= counter_usb_clk && counter_usb_clk < (`ADC_CLK_DELAY+`USB_CLK_DIV/2)) begin
            ADC_CLK <= 'b1;
        end else begin
            ADC_CLK <= 'b0;
        end
        
        if (counter_usb_clk == `WR_PULSE_DELAY) begin
            USB_WR_L <= 'b0;
        end else begin
            USB_WR_L <= 'b1;
        end
    end    
    
    always @(posedge CIS_CLK) begin
        // update LED settings
        if (counter_cis_clk == `CIS_LED_OFF) begin
            CIS_LED_BLUE <= 'b0;
            CIS_LED_GREEN <= 'b0;
            CIS_LED_RED <= 'b0;
        end else if (counter_cis_clk == `CIS_LED_ON) begin
            CIS_LED_BLUE <= 'b1;
            CIS_LED_GREEN <= 'b1;
            CIS_LED_RED <= 'b1;
        end
        
        // update CIS counter
        if (counter_cis_clk == `CIS_CLK_PER_LINE) begin
            counter_cis_clk <= 'd1;
            CIS_SP <= 'b1;
        end else begin
            counter_cis_clk <= counter_cis_clk + 'd1;
            CIS_SP <= 'b0;
        end
        
        // update SCOPE_SYNC signal
        if (counter_cis_clk == `SCOPE_SYNC_POS) begin
            SCOPE_SYNC <= 1'b1;
        end else begin
            SCOPE_SYNC <= 1'b0;
        end
    end

endmodule
