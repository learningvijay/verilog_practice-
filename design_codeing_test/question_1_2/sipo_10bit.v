`timescale 1ns/1ps
module sipo_10bit (
    input        clk_shift,     
    input        clk_output,    
    input       rst_n,         
    input       mode,          
    input      serial_in,
    output reg [9:0] parallel_out
);

    reg [9:0] shift_reg;

    
    always @(posedge clk_shift ) begin
        if (!rst_n)
            shift_reg <= 10'b0;
        else if (!mode)
            shift_reg <= {shift_reg[8:0], serial_in};
    end

  
    always @(posedge clk_output) begin
        if (!rst_n)
            parallel_out <= 10'b0;
        else if (mode)
            parallel_out <= shift_reg;
    end

endmodule
