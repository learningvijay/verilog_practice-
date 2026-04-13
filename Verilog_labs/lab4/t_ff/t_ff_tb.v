
module t_ff_tb;

reg clk,t,rst;
wire q,qb;


t_ff t1(
.clk(clk),
.t(t),
.rst(rst),
.q(q),
.qb(qb)
);

task initialize;
begin
t=0;
rst=0;
end
endtask

task reset;
begin
@(negedge clk)
rst=1'b1;
@(negedge clk)
rst=1'b0;
end
endtask

task inputs(input i);
begin
@(negedge clk)
t=i;
end
endtask

initial clk=0;
always #5 clk=~clk;

initial
begin

initialize;

reset;

inputs(1'b0);
#10;
#10;
#10;
inputs(1'b1);
#10;
#10;
#10;
#10;
inputs(1'b0);
#10;
#10;
#10;
inputs(1'b1);
#10;
#10;
#10;
#10;
end

initial 
$monitor("input t=%b ,reset=%b ,output q=%b ,qb=%b",t,rst,q,qb);

initial
#200 $finish;
 
endmodule



