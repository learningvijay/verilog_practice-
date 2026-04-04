module mux4x1 (
input [3:0]data_in,
input [1:0]s,
output data_out
);
wire [1:0]y;
mux2_1 m1(
.data_in(data_in[3:2]),
.s(s[0]),
.data_out(y[1])
);

mux2_1 m2(
.data_in(data_in[1:0]),
.s(s[0]),
.data_out(y[0])
);

mux2_1 m3(
.data_in(y[1:0]),
.s(s[1]),
.data_out(data_out)
);
    
endmodule