module full_sub (
input a,b,
input barrow_in,
output diff,
output wire barrow_out
);
wire w1,w2,w3;

half_sub h1(
.a(a),
.b(b),
.diff(w1),
.barrow(w2)
);

half_sub h2(
.a(w1),
.b(barrow_in),
.diff(diff),
.barrow(w3)
);

or o1 (barrow_out,w2,w3);

endmodule
