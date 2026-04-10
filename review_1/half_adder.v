module half_adder(
input a,b,
output wire sum,carry
);
reg c=1'b0;

full_adder f1(
.a(a),
.b(b),
.cin(c),
.sum(sum),
.cout(carry)
);

endmodule
