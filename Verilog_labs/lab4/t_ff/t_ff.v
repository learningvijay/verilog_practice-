module t_ff(
input clk,t,rst,
output reg q,
output wire qb
);

always@(posedge clk)
begin
if(rst)
begin
q<=1'b0;
end

else
begin
q<=(t^q);
end
end

assign qb=~q;

endmodule
