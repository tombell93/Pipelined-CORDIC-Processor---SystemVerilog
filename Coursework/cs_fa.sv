/////////////////////////////////////////////////////////////////////
// Design unit: Carry-Save Full Adder
//            :
// File name  : cs_fa.sv
//            :
// Author     : tjb2g11@ecs.soton.ac.uk
/////////////////////////////////////////////////////////////////////

module cs_fa (input logic x, y, z, output logic c, s);

  assign s = x ^ y ^ z;
  assign c = (x & y) | (z & (x ^ y));

endmodule
