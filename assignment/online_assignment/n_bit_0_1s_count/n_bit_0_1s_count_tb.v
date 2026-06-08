module n_bit_0_1s_count_tb;
parameter N=4;
reg [N-1:0]register;
reg count_en;
wire [N-1:0]once;
wire [N-1:0]zeros;
wire count_done;

n_bit_0_1s_count   n1(
register[N-1:0],
 count_en,
once [N-1:0],
 zeros[N-1:0],
 count_done
);

initial
begin
count_en=1'b0;
#5count_en=1'b1;
register=4'b1010;
#1;
if(once==2 && zeros==2)
begin 
$display("the implementaion is correct");
end
#10count_en=1'b0;
#5 count_en=1'b1;
register=4'b0100;
#1;
if(once==1 && zeros==3)
begin 
$display("the implementaion is correct");
end
#10count_en=1'b0;
#5 count_en=1'b1;
register=4'b0111;
#1;
if(once==3 && zeros==1)
begin 
$display("the implementaion is correct");
end
#10 $finish;
end

endmodule
