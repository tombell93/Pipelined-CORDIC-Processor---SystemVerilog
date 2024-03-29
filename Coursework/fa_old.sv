
/////////////////////////////////////////////////////////////////////
// Design unit: Old full Adder with clock
//            :
// File name  : fa_old.sv
//            :
// Author     : tjb2g11@ecs.soton.ac.uk
/////////////////////////////////////////////////////////////////////

module fa_old (input logic x, y, cin, clk, reset, output logic cout, s);
  wire s_temp, cout_temp;
  
  assign s_temp = x ^ y ^ cin;
  assign cout_temp = (x & y) | (cin & (x ^ y));
  
  always_ff @(posedge clk or posedge reset) begin 
    if (reset) begin
      s <= '0;
      cout <= '0;
    end
    else begin
      s <= s_temp; 
      cout <= cout_temp; 
    end
  end
  
endmodule
