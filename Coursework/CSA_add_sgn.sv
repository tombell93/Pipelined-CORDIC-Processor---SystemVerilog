/////////////////////////////////////////////////////////////////////
// Design unit: Carry-save adder with sign detection
//            :
// File name  : CSA_add_sgn.sv
//            :
// Author     : tjb2g11@ecs.soton.ac.uk
/////////////////////////////////////////////////////////////////////

module CSA_add_sgn(
    input logic [15:0] VS_x, input logic [15:0] VC_x, input logic [15:0] VS_y, input logic [15:0] VC_y, input logic clk, reset, data_in,
    output logic [15:0] VC, output logic [15:0] VS, output logic data_out);

  wire cin_1, vc_last, zero, add_sub;
  wire [15:0] carry, VS_temp, VC_temp;
  assign zero = 0;
  
  sgn_detect_comb sign_detector(add_sub, VS_y, VC_y);
  
  always_ff @(posedge clk or posedge reset) begin 
    if(reset) begin
      data_out <= 0;
      VS <= 16'b0000000000000000;    
      VC <= 16'b0000000000000000;
    end
  	 else if (data_in) begin
      data_out <= 1;
      VS <= VS_temp;
      VC <= VC_temp;
      VC[0] <= add_sub;
    end
    else begin
      data_out <= 0;
      VS <= 16'b0000000000000000;    
      VC <= 16'b0000000000000000;
    end
  end
    
  compressor c1  (VS_x[0],  VC_x[0],  VS_y[0],  VC_y[0],  add_sub,   add_sub, VC_temp[1],  VS_temp[0],  carry[0]);
  compressor c2  (VS_x[1],  VC_x[1],  VS_y[1],  VC_y[1],  carry[0],  add_sub, VC_temp[2],  VS_temp[1],  carry[1]);
  compressor c3  (VS_x[2],  VC_x[2],  VS_y[2],  VC_y[2],  carry[1],  add_sub, VC_temp[3],  VS_temp[2],  carry[2]);
  compressor c4  (VS_x[3],  VC_x[3],  VS_y[3],  VC_y[3],  carry[2],  add_sub, VC_temp[4],  VS_temp[3],  carry[3]);
  compressor c5  (VS_x[4],  VC_x[4],  VS_y[4],  VC_y[4],  carry[3],  add_sub, VC_temp[5],  VS_temp[4],  carry[4]);
  compressor c6  (VS_x[5],  VC_x[5],  VS_y[5],  VC_y[5],  carry[4],  add_sub, VC_temp[6],  VS_temp[5],  carry[5]);
  compressor c7  (VS_x[6],  VC_x[6],  VS_y[6],  VC_y[6],  carry[5],  add_sub, VC_temp[7],  VS_temp[6],  carry[6]);
  compressor c8  (VS_x[7],  VC_x[7],  VS_y[7],  VC_y[7],  carry[6],  add_sub, VC_temp[8],  VS_temp[7],  carry[7]);
  compressor c9  (VS_x[8],  VC_x[8],  VS_y[8],  VC_y[8],  carry[7],  add_sub, VC_temp[9],  VS_temp[8],  carry[8]);
  compressor c10 (VS_x[9],  VC_x[9],  VS_y[9],  VC_y[9],  carry[8],  add_sub, VC_temp[10], VS_temp[9],  carry[9]);
  compressor c11 (VS_x[10], VC_x[10], VS_y[10], VC_y[10], carry[9],  add_sub, VC_temp[11], VS_temp[10], carry[10]);
  compressor c12 (VS_x[11], VC_x[11], VS_y[11], VC_y[11], carry[10], add_sub, VC_temp[12], VS_temp[11], carry[11]);
  compressor c13 (VS_x[12], VC_x[12], VS_y[12], VC_y[12], carry[11], add_sub, VC_temp[13], VS_temp[12], carry[12]);
  compressor c14 (VS_x[13], VC_x[13], VS_y[13], VC_y[13], carry[12], add_sub, VC_temp[14], VS_temp[13], carry[13]);
  compressor c15 (VS_x[14], VC_x[14], VS_y[14], VC_y[14], carry[13], add_sub, VC_temp[15], VS_temp[14], carry[14]);
  compressor c16 (VS_x[15], VC_x[15], VS_y[15], VC_y[15], carry[14], add_sub, vc_last,     VS_temp[15], carry[15]);
  
endmodule
