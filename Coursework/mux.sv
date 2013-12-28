/////////////////////////////////////////////////////////////////////
// Design unit: Multiplexer
//            :
// File name  : mux.sv
//            :
// Author     : tjb2g11@ecs.soton.ac.uk
/////////////////////////////////////////////////////////////////////

module mux (input logic a, b, sel, output logic c);

  assign c = sel?b:a;

endmodule
