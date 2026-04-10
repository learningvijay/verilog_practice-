module s_r_ff (
input s,r,
output wire q,qb
);


nor  n1(q,r,qb);
nor  n2(qb,s,q);


endmodule
