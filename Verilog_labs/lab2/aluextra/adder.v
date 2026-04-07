module add #(parameter N=4)(
    input [N:0]a,b,
    output [N:0]y
);
reg i=0;
reg j;
   r_c_a a1 #(4)(
    .a(a),
    b(b),
    carry_in(i),
    sum(y),
    carry_out(j)
    );

