`timescale 1ns / 1ps

module slow_clk_100hz(
    input clk_in,
    input reset,
    output reg clk_out
    );
    
    reg [26:0] count=0;
    
    always @(posedge clk_in)
    begin
    if(count==50000-1)
    begin
    count<=0;
    clk_out<=~clk_out;
    end
    else if(reset)  
    begin
    count<=0;
    clk_out<=0;
    end
    else begin 
    count<=count+1;
    end
    end
endmodule
