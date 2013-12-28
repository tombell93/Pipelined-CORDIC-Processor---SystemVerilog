/////////////////////////////////////////////////////////////////////
// Design unit: CORDIC ALU testbench
//            :
// File name  : tb_CORDIC.sv
//            :
// Author     : tjb2g11@ecs.soton.ac.uk
/////////////////////////////////////////////////////////////////////

module tb_CORDIC;
  
  logic [15:0] VS_x, VC_x, VS_y, VC_y, VS_root, VC_root, atan_VS, atan_VC;
  logic data_valid_in, reset, clk, data_valid_out;

  // invoke an instance of CORDIC  
  CORDIC cordic1 (.*); 
  
  // clock generator
  always
  begin
    #5 clk = 1;
    #5 clk = 0;
  end
  
  initial
  begin
    clk <= 0;
    VS_x <= 16'b0000000000000000;
 	  VC_x <= 16'b0000000000000000;
 	  VS_y <= 16'b0000000000000000;
 	  VC_y <= 16'b0000000000000000;
 	  reset <= 0;
 	  #1ns reset <= 1;
 	  #1ns reset <= 0;
    
  end
endmodule



