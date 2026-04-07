module r_c_a #parameter#(N=4) (
    input [N-1:0]a,
    input [N-1:0]b,
    input carry_in,
    output [N-1:0]sum,
    output carry_out
    );
    wire [N-1:0]c;
    genvar i;

    



    full_adder a0 (
    .a_in(a[0]),
    .b_in(b[0]),
	.c_in(carry_in),
    .sum_out(sum[0]),
	.carry_out(c1)
    );

     generate
        for (i =1 ;i<N-2;i=i+1 ) begin
           full_adder a[i] (
           .a_in(a[i]),
           .b_in(b[i]),
	       .c_in(c[i]),
           .sum_out(sum[1]),
	       .carry_out(c[i+1])
    ); 
            
        end
    endgenerate


    full_adder aN (
    .a_in(a[N-1]),
    .b_in(b[N-1]),
	.c_in(c[N-1]),
    .sum_out(sum[N-1]),
	.carry_out(carry_out)
    );

endmodule   