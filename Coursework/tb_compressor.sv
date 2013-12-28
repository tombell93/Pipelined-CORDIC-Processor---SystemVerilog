
/////////////////////////////////////////////////////////////////////
// Design unit: 4-2 Compressor testbench
//            :
// File name  : tb_compressor.sv
//            :
// Author     : tjb2g11@ecs.soton.ac.uk
/////////////////////////////////////////////////////////////////////

module tb_compressor;
  
  logic VS_x, VC_x, VS_y, VC_y, cin, add_sub, clk, reset, VC, VS, cout;
  
  // compressor (
  // input logic VS_x, VC_x, VS_y, VC_y, cin, add_sub, clk, reset,
  // output logic VC, VS, cout);

  // invoke an instance of the 4-2 compressor
  compressor comp (VS_x, VC_x, VS_y, VC_y, cin, add_sub, clk, reset, VC, VS, cout);
    
  // clock generator
  always
  begin
    #10 clk = 1;
    #10 clk = 0;
  end
  
  initial
  begin
  clk <= 0;
  reset <= 0;
	VS_x <= 1'b0;
  VC_x <= 1'b0;
  VS_y <= 1'b0;
  VC_y <= 1'b0;
  cin <= 1'b0;
  add_sub <= 1'b0;
  
  #2ns reset <= 1;
  #2ns reset <= 0;
	
	// s = 1
  #5ns VS_x <= 1;
  VC_x <= 1;
  VS_y <= 1;
  VC_y <= 1;
  
  #30ns reset <= 1;
  #2ns reset <= 0;
  
  end
endmodule

