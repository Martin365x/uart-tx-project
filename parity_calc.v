module parity_calc(pin,p_bit,parity);
input [7:0] pin;
input p_bit;
output parity;
assign parity=(p_bit==0)?(^pin):(~(^pin));
endmodule
