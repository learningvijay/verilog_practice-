module r_c_a (
    input [3:0]a,
    input [3:0]b,
    input carry_in,
    output [3:0]sum,
    output carry_out
    );
    wire c1,c2,c3;
    full_adder a0 (
    .a_in(a[0]),
    .b_in(b[0]),
	.c_in(carry_in),
    .sum_out(sum[0]),
	.carry_out(c1)
    );

    full_adder a1 (
    .a_in(a[1]),
    .b_in(b[1]),
	.c_in(c1),
    .sum_out(sum[1]),
	.carry_out(c2)
    );

    full_adder a2 (
    .a_in(a[2]),
    .b_in(b[2]),
	.c_in(c2),
    .sum_out(sum[2]),
	.carry_out(c3)
    );

    full_adder a3 (
    .a_in(a[3]),
    .b_in(b[3]),
	.c_in(c3),
    .sum_out(sum[3]),
	.carry_out(carry_out)
    );

endmodule    