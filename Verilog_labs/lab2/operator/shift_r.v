module shift_r #(parameter N = 4, T =1 )(
    input [N-1:0]a,
    output wire [N-1:0]y
);
wire [T:0]b;
assign b=0;
assign y = {b,a[N-1:T]};

/*
assign y=a>>T;
assign y[N-1:N-T]=0;
*/

endmodule