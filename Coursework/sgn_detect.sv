/////////////////////////////////////////////////////////////////////
// Design unit: Sign detector
//            :
// File name  : sgn_detect.sv
//            :
// Author     : tjb2g11@ecs.soton.ac.uk
/////////////////////////////////////////////////////////////////////

module sgn_detect(input logic [15:0] VS, VC,
               input logic data_in, reset, clk,
               output logic sgn, data_out);

logic p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15;
logic g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15;
logic k0, k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11, k12, k13, k14, k15;
logic sgn1, sgn2, sgn3, sgn4;
logic control1, control2, control3;
logic out1, out2, sgn_temp;
logic state, next_state;
assign p0 = VS[0] | VC[0];
assign p1 = VS[1] | VC[1];
assign p2 = VS[2] | VC[2];
assign p3 = VS[3] | VC[3];
assign p4 = VS[4] | VC[4];
assign p5 = VS[5] | VC[5];
assign p6 = VS[6] | VC[6];
assign p7 = VS[7] | VC[7];
assign p8 = VS[8] | VC[8];
assign p9 = VS[9] | VC[9];
assign p10 = VS[10] | VC[10];
assign p11 = VS[11] | VC[11];
assign p12 = VS[12] | VC[12];
assign p13 = VS[13] | VC[13];
assign p14 = VS[14] | VC[14];
assign p15 = VS[15] | VC[15];

assign g0 = VS[0] & VC[0];
assign g1 = VS[1] & VC[1];
assign g2 = VS[2] & VC[2];
assign g3 = VS[3] & VC[3];
assign g4 = VS[4] & VC[4];
assign g5 = VS[5] & VC[5];
assign g6 = VS[6] & VC[6];
assign g7 = VS[7] & VC[7];
assign g8 = VS[8] & VC[8];
assign g9 = VS[9] & VC[9];
assign g10 = VS[10] & VC[10];
assign g11 = VS[11] & VC[11];
assign g12 = VS[12] & VC[12];
assign g13 = VS[13] & VC[13];
assign g14 = VS[14] & VC[14];
assign g15 = VS[15] & VC[15];

assign k0 = VS[0] |~ VC[0];
assign k1 = VS[1] |~ VC[1];
assign k2 = VS[2] |~ VC[2];
assign k3 = VS[3] |~ VC[3];
assign k4 = VS[4] |~ VC[4];
assign k5 = VS[5] |~ VC[5];
assign k6 = VS[6] |~ VC[6];
assign k7 = VS[7] |~ VC[7];
assign k8 = VS[8] |~ VC[8];
assign k9 = VS[9] |~ VC[9];
assign k10 = VS[10] |~ VC[10];
assign k11 = VS[11] |~ VC[11];
assign k12 = VS[12] |~ VC[12];
assign k13 = VS[13] |~ VC[13];
assign k14 = VS[14] |~ VC[14];
assign k15 = VS[15] |~ VC[15];

assign sgn4 = p15&p14&p13&p12 | p15&p14&p13&k12 | p15&p14&k13 | p15&k14 | g15;
assign sgn3 = p11&p10&p9&p8 | p11&p10&p9&k8 | p11&p10&k9 | p11&k10 | k11;
assign sgn2 = p7&p6&p5&p4 | p7&p6&p5&k4 | p7&p6&k5 | p7&k6 | k7;
assign sgn1 = p3&p2&p1&p0 | p3&p2&p1&k0 | p3&p2&k1 | p3&k2 | k3;
assign control3 = p15&p14&p13&p12;
assign control2 = p11&p10&p9&p8;
assign control1 = p7&p6&p5&p4;
  
always_ff @(posedge clk or posedge reset) begin
  if(reset) begin
    sgn <= 0;
    data_out <= 0;
    state <= 1'b0;
    next_state <= 1'b0;
  end
  else if (data_in) begin
    sgn <= sgn_temp;
    data_out <= 1;
  end
  else begin
    data_out <= 0;
    state <= 1'b0;
  end
  state <= next_state;
end

// mux (input logic a, b, sel, clk, reset, output logic c)
mux mux1 (sgn2, sgn1, control1, out1);
mux mux2 (sgn3, out1, control2, out2);
mux mux3 (sgn4, out2, control3, sgn_temp);
  
endmodule
