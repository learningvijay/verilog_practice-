module v_m(
input i,j,
input clk,
input rst,
output x,y
);
parameter           IDEL=3'B000,//IDEL
                   STATE1=3'B001,//1 RS COIN
                   STATE2=3'B010,//2 RS COIN
                   STATE3=3'B011,//3 RS RECIVED
                   STATE4=3'B100;//4 RS RECIVED 1 RUPEES RETUNED

reg [2:0]present_state;
reg[2:0] nextstate;

always@(posedge clk or  posedge rst)
begin
if(rst)
begin
present_state<=IDEL;
end
else
begin
present_state<=nextstate;
end
end

always@(present_state or i or j)
begin
case( present_state)
     IDEL:nextstate=i? (j? STATE2:STATE1): IDEL;
STATE1:nextstate=i? (j? STATE3:STATE2): IDEL;
STATE2:nextstate=i? (j? STATE4:STATE3): IDEL;
STATE3:nextstate=IDEL;
STATE4:nextstate=IDEL;
default:nextstate=IDEL;
endcase
end

assign x=(present_state==STATE3)||(present_state==STATE4);
assign y=(present_state==STATE4);

endmodule


