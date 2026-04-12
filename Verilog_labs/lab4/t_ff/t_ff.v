module t_ff(
input t,reset,
output q,qb
);

always@(posedge clk)
begin
if(reset)
begin

