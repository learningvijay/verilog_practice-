module n_bit_0_1s_count #(parameter N=4)(
input [N-1:0]register,
input count_en,
output reg [N+1:0]once,
output  reg [N+1:0]zeros,
output reg count_done
);
integer i;

always@(*)
begin
if(~count_en)
begin
once=0;
zeros=0;
count_done=1'b0;
end

else
begin
once=0;
zeros=0;
for(i=0;i<N;i=i+1)
begin
if(register[i])
once=once+1;
else
zeros=zeros+1;

if(i==N-1)
count_done=1'b1;

end

end

end

endmodule






