module mux2_1 (
input [1:0]data_in,
input select,
output wire data_out
);
wire w1,w2;
and a1(w1,data_in[0],~select);
and a2(w2,data_in[1],select);
or o1(data_out,w1,w2);

endmodule
