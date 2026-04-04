module mux4x1 (
    input [3:0]data_in,
    input [1:0]s,
    output data_out
);
wire [3:0]i;

decoder d1 (
    .data_in(s[1:0]),
    .data_out(i[3:0])
);

tri_state_buff t0(
    .in(data_in[0]),
    .en(i[0]),
    .out(data_out)
);

tri_state_buff t1(
    .in(data_in[1]),
    .en(i[1]),
    .out(data_out)
);

tri_state_buff t2(
    .in(data_in[2]),
    .en(i[2]),
    .out(data_out)
);

tri_state_buff t3(
    .in(data_in[3]),
    .en(i[3]),
    .out(data_out)
);



endmodule