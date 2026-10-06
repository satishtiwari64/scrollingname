`timescale 1ns / 1ps



module bcdtoss(
    input [3:0] Y,
    output reg [6:0] disp
    );
    
    always @(Y)
    begin
    case(Y)
    0:disp=7'b0100100;
    1:disp=7'b0001000;
    2:disp=7'b1110000;
    3:disp=7'b1111010;
    4:disp=7'b0100100;
    5:disp=7'b1001000;
    6:disp=7'b1111111;
    7:disp=7'b1111111;
    default: disp=7'b1111111;//for common anode 0(low)-on,1(high)-off
    endcase
    end        
endmodule
