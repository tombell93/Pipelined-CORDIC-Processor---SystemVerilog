/////////////////////////////////////////////////////////////////////
// Design unit: Sign detector testbench
//            :
// File name  : tb_sgn_detect.sv
//            :
// Author     : tjb2g11@ecs.soton.ac.uk
/////////////////////////////////////////////////////////////////////

module tb_sgn_detect;
                 
logic [15:0] VS, VC;
logic data_in, reset, clk, sgn, data_out;

// invoke an instance of sgn_detect  
sgn_detect sgn_det (.*);
  
always
  begin
    #5ns clk = 1;
    #5ns clk = 0;
  end

initial
begin
  VS <= 16'b0000000000000000;
  VC <= 16'b0000000000000000;
  data_in <= 0;
  reset <= 1;
  clk <= 0;
  #1ns reset <= 0;
  
  #2ns VS <= 16'b1000001100000000;
  VC <=      16'b0000000000000001;
    
  #6ns data_in <= 1;
  #7ns data_in <= 0;
  
  #8ns VS <= 16'b001011000011101;
  VC <= 16'b0010111100001010;
  
  #6ns data_in <= 1;
  #7ns data_in <= 0;
  
  

end
endmodule


