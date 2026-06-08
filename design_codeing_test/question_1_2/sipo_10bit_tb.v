`timescale 1ns/1ps

module sipo_10bit_tb;

reg         clk_shift;
reg         clk_output;
reg         rst_n;
reg         mode;
reg         serial_in;

wire [9:0]  parallel_out;

reg [9:0] data;
integer i;

sipo_10bit dut (
    .clk_shift   (clk_shift),
    .clk_output  (clk_output),
    .rst_n       (rst_n),
    .mode        (mode),
    .serial_in   (serial_in),
    .parallel_out(parallel_out)
);

wire [9:0]shift_reg;
assign shift_reg= dut.shift_reg;

always #0.5 clk_shift  = ~clk_shift;   
always #5   clk_output = ~clk_output;  


task reset_dut;
begin
    rst_n     = 0;
    mode      = 0;
    serial_in = 0;

    repeat(2) @(posedge clk_shift);

    rst_n = 1;

    $display("[%0t] Reset Applied", $time);
end
endtask



task send_data;
begin
    data = $random;

    mode = 0;

    for(i=9; i>=0; i=i-1)
    begin
        serial_in = data[i];
        @(negedge clk_shift);
    end

    $display("[%0t] Sent Data = %b",
              $time, data);
end
endtask


task get_output;
begin
    mode = 1;

    @(negedge clk_output);
    
    $display("[%0t] Shift_Reg = %b  Parallel_Out = %b",
              $time,
              dut.shift_reg,
              parallel_out);

    mode = 0;
end
endtask



initial
begin

    clk_shift  = 0;
    clk_output = 0;
     reset_dut();

    repeat(5)
    begin
        send_data();
      
        get_output();
    end

    #20;
    $finish;

end

endmodule
