module rotate_r #(parameter N = 4, T =1 )(
    input [N-1:0]a;
    output wire [N-1:0]y;
);

assign y = {[T-1:0]a,[N-1:T]a};

/*reg [T-1:0]b;
assign b=a[T-1:0];
assign y=a>>T;
assign y[N-1:N-T]=b;*/

endmodule