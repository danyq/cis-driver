`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/18/2016 03:00:47 PM
// Design Name: 
// Module Name: debounce
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

// based on this design
// http://web.mit.edu/6.111/www/f2005/code/jtag2mem_6111/debounce.v.html

module debounce(
    input clock,
    input noisy,
    output clean,
    output pulse
    );
    
    parameter NDELAY = 650000;
    parameter NBITS = 20;
 
    reg [NBITS-1:0] count;
    reg xnew, clean;
 
    initial begin
        xnew = noisy;
        clean = noisy;
        count = 0;
    end
 
    always @(posedge clk)
      if (noisy != xnew) begin xnew <= noisy; count <= 0; end
      else if (count == NDELAY) clean <= xnew;
      else count <= count+1;
endmodule
