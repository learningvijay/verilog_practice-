module buff #(parameter N= a) (
    input [N-1:0]a;
    output wire [N-1:]y
);
reg [N-1:0]b;

assign y=a;
/*assign b=~a;
assign y=~b;*/

endmodule