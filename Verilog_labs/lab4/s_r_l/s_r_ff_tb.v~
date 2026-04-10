
module s_r_ff_tb ;
reg s,r;
wire q,qb;
integer i;


s_r_ff s1(
.s(s),
.r(r),
.q(q),
.qb(qb)
);

task inputs(input [1:0]i);
begin 
s=i[0];
r=i[1];
end
endtask

initial
begin
for (i=0;i<8;i=i+1)
begin
inputs(i);
#10;
/*if(i==4)
begin
inputs(2'b11);
#10;
#10;
#10;
end*/
end
end

initial
$monitor("input s=%b ,r=%b , output q=%b ,qb=%b /n",s,r,q,qb );

endmodule

