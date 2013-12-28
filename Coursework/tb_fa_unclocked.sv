
/////////////////////////////////////////////////////////////////////
// Design unit: Full Adder testbench
//            :
// File name  : tb_fa.sv
//            :
// Author     : tjb2g11@ecs.soton.ac.uk
/////////////////////////////////////////////////////////////////////

module tb_fa_unclocked;
  //logic x, y, cin, cout, s;
  logic x, y, z, c, s;

  // invoke an instance of the full adder
  //fa full_adder (.*); 
  cs_fa cs_full_adder (.*); 
  
  initial
  begin
	z <= 1'b0;

	// s = 0
  x <= 1'b0;
  y <= 1'b0;
	
	// s = 1
  #5ns y <= '1;

	// s = 1, c = 0
	#10ns x <= '1;
	#10ns y <= '0;

	// s = 0, c = 1
  #15ns x <= '1;
	#15ns y <= '1;	
	
	// for z = 1
	#20ns z <= 1'b1;
	
	// s = 1, c = 0
  #20ns x <= 1'b0;
  #20ns y <= 1'b0;
	
	// s = 0, c = 1
  #25ns y <= '1;

	// s = 0, c = 1
	#30ns x <= '1;
	#30ns y <= '0;

	// s = 1, c = 1
  #35ns x <= '1;
	#35ns y <= '1;

  end
endmodule

