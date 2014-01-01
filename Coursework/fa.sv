/////////////////////////////////////////////////////////////////////
// Design unit: Full Adder with clock
//            :
// File name  : fa.sv
//            :
// Author     : tjb2g11@ecs.soton.ac.uk
/////////////////////////////////////////////////////////////////////

module fa (input logic x, y, cin, output logic cout, s);

  assign s = x ^ y ^ cin;
  assign cout = (x & y) | (cin & (x ^ y));

endmodule