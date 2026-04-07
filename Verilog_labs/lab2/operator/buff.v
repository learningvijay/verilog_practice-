module buff #(parameter N= 4) (
    input [N-1:0]a,
    output wire [N-1:0]y
);


assign y=a;
/*assign b=~a;
assign y=~b;*/

endmodule