module mux2_1 (
    input [1:0]data_in, 
    input s,
    output wire data_out
);

assign data_out= s?data_in[1]:data_in[0];
    
endmodule