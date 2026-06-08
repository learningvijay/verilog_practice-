module d_latch_tb;
reg d;
reg clk;
wire q;
wire qb;
integer i;

d_flip_floop d1 (
.clk(clk),
.d(d),
.q(q),
.qb(qb)
);

initial clk=1'b0;

always #10 clk=~clk;

initial
begin
d=1'd0;
for(i=0;i<25;i=i+1)
begin
@(negedge clk)  d=i;
end
#10 $finish;
end

endmodule
