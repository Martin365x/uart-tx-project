module uart_tx_top(clk,rst,p_input,v_input,p_en,p_bit,tx_output,busy);
input clk;
input rst;
input [7:0] p_input;
input v_input;
input p_en;
input p_bit;
output tx_output;
output busy;
wire [2:0] state;
wire [3:0] bit_index;
wire load;
wire dbit;
wire parity;
controller CTRL(.clk(clk),.rst(rst),.v_input(v_input),.p_en(p_en),.busy(busy),.state(state),.bit_index(bit_index),.load(load));
serializer SER(.clk(clk),.rst(rst),.load(load),.pin(p_input),.bit_index(bit_index),.dbit(dbit));
parity_calc PAR(.pin(p_input),.p_bit(p_bit),.parity(parity));
mux_tx MUXTX(.state(state),.dbit(dbit),.parity(parity),.tx_output(tx_output));
endmodule
