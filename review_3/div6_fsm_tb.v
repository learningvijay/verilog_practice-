 module div6_fsm_tb;
reg clk;
reg rst;
reg si;
wire y;
integer i;



div6_fsm f1(
.clk(clk),
.rst(rst),
.si(si),
.y(y) 
);

initial clk=0;
always #5 clk=~clk;

initial
begin
rst=1'b1;
@(negedge clk)rst=1'b0;
for(i=0;i<50;i=i+1)
begin
@(negedge clk) si={$random}%2;
end
#10 $finish;
end
initial 
$monitor("data=%b ",f1.data);
endmodule

