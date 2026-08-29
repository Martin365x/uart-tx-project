module mux_tx(state,dbit,parity,tx_output);
input [2:0] state;
input dbit;
input parity;
output reg tx_output;
always @(*) begin
case(state)
0: tx_output=1;
1: tx_output=0;
2: tx_output=dbit;
3: tx_output=parity;
4: tx_output=1;
default: tx_output=1;
endcase
end
endmodule
