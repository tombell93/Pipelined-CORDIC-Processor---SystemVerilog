`timescale 1 ns/100 ps

module cordic_test;

reg  [15:0] Xin, Yin;
reg  [31:0] frequency;
wire [21:0] Xout, Yout, out_data_I, out_data_Q;
reg         CLK_12MHZ;
//
// Waveform generator
//
initial
begin
  $write("Starting sim");
  CLK_12MHZ = 1'b0;
  //Xin = 16'b0;      // Xout = -An*Yin*sin(2*PI*f0/fs*k)
  //Yin = 16'd10000;  // Yout =  An*Yin*cos(2*PI*f0/fs*k)
  Xin = 16'd10000;  // Xout = An*Xin*cos(2*PI*f0/fs*k)
  Yin = 16'b0;      // Yout = An*Xin*sin(2*PI*f0/fs*k)
//  frequency = 32'h2000_0000; // 45 deg at a time
  frequency = 32'h1555_5555; // about 30 deg at a time
  force kord.phase_acc = 0;
  force orig.phase = 0;
  #100
  #5000;
  @(posedge CLK_12MHZ);
  release kord.phase_acc;
  release orig.phase;
  @(posedge CLK_12MHZ); // 60
  @(posedge CLK_12MHZ); // 90
  @(posedge CLK_12MHZ); // 120
  @(posedge CLK_12MHZ); // 150
  @(posedge CLK_12MHZ); // 180
  @(posedge CLK_12MHZ); // 210
  @(posedge CLK_12MHZ); // 240
  @(posedge CLK_12MHZ); // 270
  @(posedge CLK_12MHZ); // 300
  @(posedge CLK_12MHZ); // 330
  @(posedge CLK_12MHZ); // 360 = 0
  @(posedge CLK_12MHZ); // 30
  force kord.phase_acc = 0;
  force orig.phase = 0;
  #3000
  $stop;
end

cordic orig (CLK_12MHZ, frequency, Xin, out_data_I, out_data_Q );
kordic kord (CLK_12MHZ, frequency, Xin, Yin, Xout, Yout);

parameter CLK12_SPEED = 40.7;  // CLK_MCLK = 12.288Mhz = 81.38nS, CPUSPEED = 81.38nS/2 = 40.7nS

initial
begin
  CLK_12MHZ = 1'b0;
  $display ("CLK_12Mhz started");
  #5;
  forever
  begin
    #CLK12_SPEED CLK_12MHZ = 1'b1;
    #CLK12_SPEED CLK_12MHZ = 1'b0;
  end
end

endmodule