`timescale 1ns / 1ps
    
    module top_module(
    input clock,
    input reset,
    output [6:0] seg,
    output reg [3:0] an
    );
    
    wire slowclock_1hz;
    wire slowclock_100hz;
    reg [3:0] scroll;
    reg [3:0]D;
    reg [3:0] fourth,third,second,first;
    
    slow_clock_1hz s1(clock,slowclock_1hz);
    slow_clk_100hz s2(clock,reset,slowclock_100hz);
    
    
    always @(posedge slowclock_1hz or posedge reset)
    begin
    if(reset)
    scroll<=0;
    else if(scroll==4'b1010)
    scroll<=1;
    else scroll<=scroll+1;
    end
    
        
    always @(posedge slowclock_1hz)
    begin
    case(scroll)
    0:
    begin 
    fourth=0;
    third=1;
    second=2;
    first=3;
    end  
    
    1:
    begin 
    fourth=1;
    third=2;
    second=3;
    first=4;
    end  
    
    2:
    begin 
    fourth=2;
    third=3;
    second=4;
    first=5;
    end  
    
    3:
    begin 
    fourth=3;
    third=4;
    second=5;
    first=6;
    end  
    
    4:
    begin 
    fourth=4;
    third=5;
    second=6;
    first=7;
    end
    
    5:
    begin 
    fourth=5;
    third=6;
    second=7;
    first=7;
    end  
    
    6:
    begin 
    fourth=6;
    third=7;
    second=7;
    first=7;
    end  
    
    7:
    begin 
    fourth=7;
    third=7;
    second=7;
    first=0;
    end  
    
    
    8:
    begin 
    fourth=7;
    third=7;
    second=0;
    first=1;
    end
    
    9:
    begin 
    fourth=7;
    third=0;
    second=1;
    first=2;
    end 
    
    4'b1010:
    begin 
    fourth=0;
    third=1;
    second=2;
    first=3;
    end  
    endcase
    end
    
  
    
    reg[1:0]count;
    always @(posedge slowclock_100hz)
    begin
    if(reset)
    count<=0;
    else count=count+1;
    end
     
    always @(*)
    begin
    case(count)
    2'b00:
    begin
    D=first;
    an=4'b1110;
    end  
    
    2'b01:
    begin
    D=second;
    an=4'b1101;
    end  
    
    2'b10:
    begin
    D=third;
    an=4'b1011;
    end  
   
   2'b11:
    begin
    D=fourth;
    an=4'b0111;
    end  
   endcase
   end
   

     bcdtoss s3(D,seg);
endmodule
