module serializer(clk,rst,load,pin,bit_index,dbit);
input clk;
input rst;
input load;
input [7:0] pin;
input [3:0] bit_index;
output dbit;
reg [7:0] data_reg;
always @(posedge clk or negedge rst) begin
if(rst==0)
data_reg<=0;
else if(load==1)
data_reg<=pin;
end
assign dbit=data_reg[bit_index];
endmodule
