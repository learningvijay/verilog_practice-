module shift_l#(parameter N=4,T=1)(
    input [N-1:0]a,
    output wire [N-1:0]y
);
wire [T:0]b;
assign b=0;
assign y= {a[N-1:T],b};

/*assign y=a<<T;
assign y[T-1:0]=0;
*/

endmodule
