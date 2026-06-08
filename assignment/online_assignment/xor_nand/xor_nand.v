module xor_nand(
input a,b,
output out
);
wire w1,w2,w3,w4;
nand(w1,a,a);
nand(w2,b,w1);
nand(w3,b,b);
nand(w4,a,w3);
nand(out,w2,w4);

endmodule

