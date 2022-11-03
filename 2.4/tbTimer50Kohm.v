
`timescale 1ns/1ns
module timerTestbench();

reg CLK;
reg RESET;
wire PULSE;

lm_555_timer #(1,50,10) I1(CLK , RESET , PULSE);

initial begin

CLK=0;
#10
CLK=1;
#10
CLK=0;
RESET=1;
#10
CLK=1;
#10
RESET=0;
CLK=0;


repeat(500) #10 CLK=~CLK;
	$stop;

end
endmodule