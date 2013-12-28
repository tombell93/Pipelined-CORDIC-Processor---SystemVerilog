
/////////////////////////////////////////////////////////////////////
// Design unit: Multiplexer testbench
//            :
// File name  : tb_mux.sv
//            :
// Author     : tjb2g11@ecs.soton.ac.uk
/////////////////////////////////////////////////////////////////////

module tb_mux;
  logic a, b, sel, c;

  // invoke an instance of the mux
  mux m (.*);
  
  initial
  begin
    a <= 1'b0;
    b <= 1'b0;
    sel <= 1'b0;
    
    #5ns sel <= '1;
    
    #5ns a <= '1;
    
    #5ns sel <= '0;
    
    #5ns b <= '1;
    
    #5ns sel <= '1;
    
  end
endmodule

