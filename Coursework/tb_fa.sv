/////////////////////////////////////////////////////////////////////
// Design unit: Full Adder testbench
//            :
// File name  : tb_fa.sv
//            :
// Author     : tjb2g11@ecs.soton.ac.uk
/////////////////////////////////////////////////////////////////////

module tb_fa;
  //logic x, y, cin, cout, s;
  logic x, y, z, clk, reset, c, s;

  // invoke an instance of the full adder
  //fa full_adder (.*); 
  fa full_adder (x, y, z, clk, reset, c, s); 
  
  // Clock generator
  always
  begin
    #10 clk = 1;
    #10 clk = 0;
  end
  
  initial
  begin
  clk = 0;
  reset <= 0;
  
	z <= 1'b0;
	

	// s = 0
  x <= 1'b0;
  y <= 1'b0;
  
  #2ns reset <= 1;
  
  #2ns reset <= 0;
	
	// s = 1
  #5ns y <= '1;
  
  #3ns reset <= 1;
  #2ns reset <= 0;
  
  #25ns x <= '1;

  end
endmodule
