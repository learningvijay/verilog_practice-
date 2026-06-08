module d_latch(
input d,
input control,
output wire q,
output wire qbar
);
wire w1,w2,w3,w4,w5,w6,w7;

not n1(w1,d);
and a1(w2,d,control);
and a2(w3,w1,control);
not n2(w4,w2);
not n3(w5,w3);
and a3(w6,w4,qbar);
and a4(w7,w5,q);
not n4(q,w6);
not n5(qbar,w7);

endmodule
