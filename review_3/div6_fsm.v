module div6_fsm(
input clk,
input rst,
input si,
output reg y
);
reg [31:0]data;
reg [1:0]present_state;
reg [1:0]next_state;
parameter IDLE= 2'b00,
                   STATE0=2'b01,
                   STATE1=2'b10;


always@(posedge clk or posedge rst)
begin
if(rst)
begin
data<=31'b0;
y<=1'b0;
present_state<=IDLE;
end
else if (y==1'b1)
begin
data<=31'b0;
present_state<=IDLE;
end
else
begin
data<={data[30:1],si};
present_state<=next_state;
end
end

always@(data)
begin
if((data%6)==0)
begin
next_state=STATE0;
y<=1'b1;
end
else if((data%6)!=0)
begin
next_state=STATE1;
y<=1'b0;
end
else
begin
next_state=IDLE;
data<=31'b0;
y<=1'b0;
end
end



endmodule
