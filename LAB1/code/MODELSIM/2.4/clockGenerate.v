`timescale 1ns/1ns
module clockGen(input enable , output reg clk);

parameter FRQ = 10000;
parameter DUTY = 50;


real clk_on = DUTY/100.0 * (1.0/(FRQ *1e3)*1e9);
real clk_off = (100.0 - DUTY)/100.0 * (1.0/(FRQ *1e3)*1e9);

always@(posedge enable)begin
	if(enable)begin
	 clk=1;
	 while(enable)begin
	  #(clk_on) clk=0;
	  #(clk_off) clk=1;
	 end
	 clk=0;
	end
end
endmodule

module tbClockGen();
reg enable;
wire clk;
clockGen I1(enable , clk);
initial begin 
enable = 1;
#1000;
end
endmodule
