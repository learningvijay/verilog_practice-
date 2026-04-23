`timescale 1us/10ns
module vending_machine(
input [1:0]coin,
input rst,
input clk,
output reg y
);


reg [10:0] count;
reg [2:0]next_state;
reg [2:0]present_state;
parameter      IDLE=3'B000,
                   STATE1=3'B001,
                   STATE2=3'B010,
                   STATE3=3'B011,
                   STATE4=3'B100;
                   


always@(posedge clk or posedge rst)
begin
if (rst)
          begin
          present_state<=IDLE;
           count<=11'd0;
           y<=1'b0;
           end

else
begin
if(coin!=2'b11)
         begin
          present_state<=next_state;
          count<=11'd0; 
          end
          
else if(present_state==STATE4)
begin
present_state<=IDLE;
 y<=1'b0;
count<=11'd0; 
end

else
begin
if( count==5*255)
         begin 
          present_state<=IDLE;
           y<=1'b0;
          count<=11'd0; 
           end
else
         begin
           present_state<=present_state;
         count<=count+1;
         end
end
end
end
always@(coin)
begin
case(present_state)
IDLE: case(coin)
                   2'b00:next_state=STATE1;
                   2'b01:next_state=STATE2;
                   2'b10:next_state=STATE4;
           default: next_state=IDLE;  
                endcase
 
 STATE1:
 begin 
 case(coin)
                   2'b00:next_state=STATE2;
                   2'b01:next_state=STATE3;
                   2'b10:next_state=STATE4;
                 default: next_state=IDLE;  
                endcase              
 end
 STATE2:
 begin
  case(coin)
                   2'b00:next_state=STATE3;
                   2'b01:next_state=STATE4;
                   2'b10:next_state=STATE4;
               default: next_state=IDLE;  
                endcase
 end
 STATE3: 
 begin
 case(coin)
                   2'b00:next_state=STATE4;
                   2'b01:next_state=STATE4;
                   2'b10:next_state=STATE4;
               default: next_state=IDLE;  
                endcase
                end
 STATE4: 
 begin
 y<=1'b1;
 case(coin)
                   2'b00:next_state=IDLE;
                   2'b01:next_state=IDLE;
                   2'b10:next_state=IDLE;
               default: next_state=IDLE;  
                endcase
                end

default: next_state=IDLE;
endcase

end


endmodule
