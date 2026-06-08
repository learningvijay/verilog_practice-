module xnor_nand(
input a,b,
output out
);
wire w1,w2,w3,w4;

nand(w1,a,a);
nand(w2,b,b);
nand(w3,w1,w2);
nand(w4,a,b);
nand(out,w3,w4);

endmodule

