module decoder (input [1:0]data_in,output[3:0]data_out);


assign data_out[0]=(~data_in[0])&(~data_in[1]);
assign data_out[1]=(data_in[0])&(~data_in[1]);
assign data_out[2]=(~data_in[0])&(data_in[1]);
assign data_out[3]=(data_in[0])&(data_in[1]);

endmodule