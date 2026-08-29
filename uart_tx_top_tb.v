`timescale 1ns/1ps
module uart_tx_top_tb;
reg clk;
reg rst;
reg [7:0] p_input;
reg v_input;
reg p_en;
reg p_bit;
wire tx_output;
wire busy;
uart_tx_top DUT(.clk(clk),.rst(rst),.p_input(p_input),.v_input(v_input),.p_en(p_en),.p_bit(p_bit),.tx_output(tx_output),.busy(busy));
always #5 clk=~clk;
initial begin
clk=0;
rst=0;
p_input=0;
v_input=0;
p_en=0;
p_bit=0;
#10;
rst=1;
p_input=8'b10110101;
p_en=0;
v_input=1;
#10;
v_input=0;
#200;
p_input=8'b11001100;
p_en=1;
p_bit=0;
v_input=1;
#10;
v_input=0;
#200;
p_input=8'b11001100;
p_en=1;
p_bit=1;
v_input=1;
#10;
v_input=0;
#200;
$stop;
end
endmodule
