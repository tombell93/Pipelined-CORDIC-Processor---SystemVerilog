/////////////////////////////////////////////////////////////////////
// Design unit: CORDIC ALU
//            :
// File name  : CORDIC.sv
//            :
// Author     : tjb2g11@ecs.soton.ac.uk
/////////////////////////////////////////////////////////////////////

module CORDIC(input logic [15:0] VS_x, VC_x, VS_y, VC_y,
               input logic data_valid_in, reset, clk,
               output logic [15:0] VS_root, VC_root, atan_VS, atan_VC,
               output logic data_valid_out);
               
  logic state;
  
  always_ff @(posedge clk or posedge reset) begin 
    if (reset) begin
        data_valid_out <= 0;
        state <= 1'b0;
    end
    else if (data_valid_in) begin
        case (state)
            1'b0: begin
                if (start) begin
                    x = 159188;
                    y = 0;
                    z = z0;
                    i = 0;
                    data_valid_out <= 0;
                    state = 1'b1;
                end
            end
            1'b1: begin
                dx = $signed(y >>> $signed({1'b0, i}));
                dy = $signed(x >>> $signed({1'b0, i}));
                // synthesis parallel_case full_case
                case (i)
                    0: dz = 205887;
                    1: dz = 121542;
                    2: dz = 64220;
                    3: dz = 32599;
                    4: dz = 16363;
                    5: dz = 8189;
                    6: dz = 4096;
                    7: dz = 2048;
                    8: dz = 1024;
                    9: dz = 512;
                    10: dz = 256;
                    11: dz = 128;
                    12: dz = 64;
                    13: dz = 32;
                    14: dz = 16;
                    15: dz = 8;
                    16: dz = 4;
                    17: dz = 2;
                    default: dz = 1;
                endcase
                if ((z >= 0)) begin
                    x = x - dx;
                    y = y + dy;
                    z = z - dz;
                end
                else begin
                    x = x + dx;
                    y = y - dy;
                    z = z + dz;
                end
                if ((i == 15)) begin
                    cos_z0 <= x;
                    sin_z0 <= y;
                    state = 1'b0;
                    data_valid_out <= 1;
                end
                else begin
                    i = i + 1;
                end
            end
        endcase
    end
  end

 
endmodule
    
endmodule
