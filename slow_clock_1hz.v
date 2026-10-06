`timescale 1ns / 1ps



module slow_clock_1hz(
    input clk_in,
    output reg clk_out
    );
    
    reg [28:0] count=0;
    
    always @(posedge clk_in)
    begin
    if(count==50000000-1)
    begin
    count<=0;
    clk_out<=~clk_out;
    end
    
    else begin 
    count<=count+1;
    end
    end
endmodule
