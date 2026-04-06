module not_logical#(parameter N= 4)(
    input [N-1:0]a,
    output wire y
   
);

assign y= !a;

// assign y=~(|a);

endmodule