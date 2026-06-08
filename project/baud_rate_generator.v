

if(CPOL)
begin
pre_sclk<=1'b1;
end
else
begin
pre_sclk<=1'b0;
end

wire terminal_count;

assign terminal_count = (count == (baud_div - 1)/2);

always@(posedge PCLK)
begin
if
if (PRESETn)
begin
sclk<=sclk;
end
else
begin
sclk<=pre_slk;
end

if (~terminal_count)
begin
sclk<=sclk;
end

if (terminal_count)
begin
sclk<= ~sclk;
end

if ((|(spi_mode == 2'b00) || (|(spi_mode== 2'b01) )&& ss && spiswai)
begin
sclk<=sclk;
end

if (~(|(spi_mode == 2'b00) || (|(spi_mode== 2'b01) )&& ss && spiswai)
begin
sclk<=pre_sclk;
end

end























module spi_clk_gen (
    input  wire       pclk,
    input  wire       presetn,
    input  wire [7:0] count,
    input  wire [7:0] baud_div,
    input  wire       cpol,

    output reg        sclk
);

wire terminal_count;

assign terminal_count = (count == (baud_div - 1)/2);

always @(posedge pclk or negedge presetn)
begin
    if (!presetn)
        sclk <= cpol;          // idle state

    else if (terminal_count)
        sclk <= ~sclk;         // feedback toggle

    else
        sclk <= sclk;          // hold previous value
end

endmodule
