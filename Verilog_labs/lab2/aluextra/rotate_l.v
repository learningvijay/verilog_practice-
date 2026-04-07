module rotate_l #(parameter N = 4,T=1) (
    input [N-1:0]a;
    output wire [N-1:0]y;
);

assign y={a[N-1-T:0],a[N-1:N-T]};

/*reg [T-1:0]b;
assign b=a[N-1:N-T];
assign y=a<<T;
assign y[T-1:0]=b;*/

endmodule