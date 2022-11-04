`timescale 1ps/1ps
module ringOsillotor #(parameter invDelay , parameter N)(input enable , input value , output reg clk);

always@(posedge enable)begin
	if(value==1)begin
	clk=1;	
	end
	else begin
	clk=0;
	end
end

	initial begin
	repeat(N)#invDelay clk=~clk;
	end

endmodule






module tbRingOsillotor();
reg ENABLE;
reg VALUE;
wire CLK;
ringOsillotor #(1600 , 5) I1(ENABLE , VALUE , CLK);
initial begin
VALUE = 1;
ENABLE = 1 ;
#1000;
end
endmodule
