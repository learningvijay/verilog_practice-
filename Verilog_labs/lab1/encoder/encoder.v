module encoder (
    input  [7:0] data_in,
    output [2:0] data_out
);

wire x;
wire [1:0] lower, upper;

assign x = ~(data_in[0] | data_in[1] | data_in[2] | data_in[3]);

assign data_out[2] = x;

encoder_4to_2 d1 (
    .data_in(data_in[3:0]),
    .data_out(lower)
);

encoder_4to_2 d2 (
    .data_in(data_in[7:4]),
    .data_out(upper)
);

assign data_out[1:0] = (~x) ? lower : upper;

endmodule 