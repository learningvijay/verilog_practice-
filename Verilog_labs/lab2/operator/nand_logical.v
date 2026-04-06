module nand_logical#(parameter N= 4)(
    input [N-1:0]a,b,
    output wire y
   
);

assign y=~(a&&b);

// assign y=~((|a)&(|b));

endmodule