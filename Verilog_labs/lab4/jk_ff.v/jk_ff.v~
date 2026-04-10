module jk_ff(
input j,k,clk,rst,
output reg q,
output wire qb
);

parameter 
HOLD  =2'b00,
RESET =2'b01,
SET   =2'b10,
TOGGLE=2'B11;

always@(posedge clk)
begin
if(rst)
begin
q<=1'b0;
end

else
begin
case({j,k})
    HOLD  :q<=q;
    RESET :q<=1'b0;
    SET   :q<=1'b1;
    TOGGLE:q<=~q;
default:q<=1'b0;
endcase
end

end

assign qb=~q;

endmodule
