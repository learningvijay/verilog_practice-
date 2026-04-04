module encoder_4to_2 (input [3:0]data_in, output reg [1:0]data_out);
always @(*) begin

        
    casez (data_in)
        4'b???1:data_out=0;
        4'b??10:data_out=1;
        4'b?100:data_out=2;
        4'b1000:data_out=3;

        default: data_out=2'bxx;
    endcase
end

endmodule