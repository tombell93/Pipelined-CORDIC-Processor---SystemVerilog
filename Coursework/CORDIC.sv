/////////////////////////////////////////////////////////////////////
// Design unit: CORDIC ALU
//            :
// File name  : CORDIC.sv
//            :
// Author     : tjb2g11@ecs.soton.ac.uk
/////////////////////////////////////////////////////////////////////

module CORDIC(
    output logic data_valid_out, 
    output logic [15:0] atan_VC, 
    output logic [15:0] atan_VS, 
    output logic [15:0] VC_root, 
    output logic [15:0] VS_root, 
    input logic [15:0] VS_x, 
    input logic [15:0] VC_x, 
    input logic [15:0] VS_y, 
    input logic [15:0] VC_y, 
    input logic clk, reset, data_valid_in);

//------------------------------------------------------------------------------
//                              Registers
//------------------------------------------------------------------------------
logic [15:0] VS_x_temp [0:15];
logic [15:0] VC_x_temp [0:15];

logic [15:0] VS_y_temp [0:15];
logic [15:0] VC_y_temp [0:15];

logic [15:0] VS_Z_temp [0:15];
logic [15:0] VC_Z_temp [0:15];

logic data_in, reset, clk, sgn, data_out;

logic [15:0] VS_x, VC_x, VS_y, VC_y;
logic add_sub, data_in, reset, clk;
logic [15:0] VS, VC;
logic data_out;

always_ff @(posedge clk or posedge reset) begin 
  if (reset) begin
      data_valid_out <= 0;
  end
  else if (data_valid_in) begin
     
  end
end

//------------------------------------------------------------------------------
//                           Pipelining stage
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
//                                 Output
//------------------------------------------------------------------------------
assign VS_root = VS_x_temp[15];
assign VC_root = VC_x_temp[15];
assign atan_VS = VS_z_temp[15];
assign atan_VC = VC_z_temp[15];

endmodule
