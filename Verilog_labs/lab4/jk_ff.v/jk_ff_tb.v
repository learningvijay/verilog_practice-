module jk_ff_tb;
reg j,k,clk,rst;
wire q,qb;
integer i;
reg [(8*6)-1:0]state;


parameter CYCLE=10;

parameter 
HOLD  =2'b00,
RESET =2'b01,
SET   =2'b10,
TOGGLE=2'B11;

jk_ff j1 (
.j(j),
.k(k),
.clk(clk),
.rst(rst),
.q(q),
.qb(qb)
);

always@(*)
begin
case({j,k})
2'b00:state="  HOLD";
2'b01:state=" RESET";
2'b10:state="   SET";
2'b11:state="TOGGLE";
default:state="   rst";
endcase
end

initial
clk=0;
always#(CYCLE/2) clk=~clk;

task reset;
begin
@(negedge clk)
rst=1'b1;
@(negedge clk)
rst=1'b0;
end
endtask

task inputs(input [1:0]i);
begin
@(negedge clk)

{j,k}=i[1:0];

//j=i[1];
//k=i[0];

end
endtask

initial
begin
reset;
#10;
for(i=0;i<8;i=i+1)
begin
inputs(i[1:0]);
if(i==3)
begin
inputs(i);
#10;
inputs(i);
#10;
inputs(i);
end
end
#20 $finish;
end

initial
$monitor("input j=%b k=%b state=%s reset=%b output q=%b qb=%b ",j,k,state,rst,q,qb);

endmodule



