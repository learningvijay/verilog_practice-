module r_c_a_tb ;
reg [3:0]a;
reg [3:0]b;
reg carry_in;
wire [3:0]sum;
wire carry_out;
integer i;
r_c_a r1(
    .a(a[3:0]),
    .b(b[3:0]),
    .carry_in(carry_in),
    .sum(sum[3:0]),
    .carry_out(carry_out)
);
initial begin
    a=0;
    b=0;
    carry_in=0;
    #10;
    b=5;
    carry_in=1;
end

initial begin
for(i=0;i<16;i=i+1)
begin
    a=i;
    #10;
end

end
initial
 $monitor("Input a=%b, b=%b, c=%b, Output sum =%b, carry=%b",a,b,carry_in,sum,carry_out);


initial 
    #500 $finish;


endmodule