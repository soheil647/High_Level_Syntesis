module SQRT
  (
    i_clock,
    i_Reset,
    i_W,
    o_Q,
  );

  // input and outputs
  input i_clock;
  input i_Reset;
  input [21:0] i_W;
  output reg [21:0] o_Q;

  // wires and registers
  wire [1:0] s_place;
  reg [1:0] s_ps;
  reg [1:0] s_ns;
  reg [3:0] s_Count_Times; // counter
  reg [21:0] s_z0; 
  reg [21:0] s_x0; 
  reg [21:0] s_y0; 
  reg [21:0] s_x,s_y,s_z;

  // Alphas
  parameter [21:0] Alpha0 = 21'd8192; // 45 = tan-1(2**0)
  parameter [21:0] Alpha1 = 21'd4836; // tan-1(2**-1)
  parameter [21:0] Alpha2 = 21'd2555; // tan-1(2**-2)
  parameter [21:0] Alpha3 = 21'd1297; // tan-1(2**-3)
  parameter [21:0] Alpha[3:0] = '{Alpha3, Alpha2, Alpha1, Alpha0};

  
  parameter [1:0] idle = 2'd0;
  parameter [1:0] Calculate = 2'd1;
  parameter [1:0] Ending = 2'd2;




  always@(*) 
  begin
      begin
        s_x0 = i_W + 0.25;
        s_y0 = i_W - 0.25;
        s_z0 = 0;
      end
   end

  always@(posedge i_clock) 
  begin
    if(i_Reset)
    begin
      s_ps <= idle;
    end
    else
    begin
      s_ps <= s_ns;
    end
  end

  always@(*) 
  begin
    case(s_ps)
    idle:
    begin
        s_ns = Calculate;
      end

    Calculate:
    begin
      if(s_Count_Times == 4'd5)
      begin
        s_ns = Ending;
      end
      else
      begin
        s_ns = Calculate;
      end
    end
    Ending:
    begin
      s_ns = idle;
    end
    default:
    begin
      s_ns = idle;
    end
    endcase
  end

  always@(posedge i_clock) 
  begin
    case(s_ps)
    idle:
    begin
      s_Count_Times <= 4'd0;
      s_x <= s_x0;
      s_y <= s_y0;
      s_z <= s_z0;
    end
    Calculate:
    begin
      s_Count_Times <= s_Count_Times + 4'd1;
      if(s_y[21])
      begin
        s_z <= s_z - Alpha[s_Count_Times];
        s_x <= s_x - (s_y >> s_Count_Times);
        s_y <= s_y + (s_x >> s_Count_Times);
      end
      else
      begin
        s_z <= s_z - Alpha[s_Count_Times];
        s_x <= s_x - (s_y >> s_Count_Times);
        s_y <= s_y + (s_x >> s_Count_Times);
      end
    end
    Ending:
    begin
      o_Q <= s_x;
    end
    endcase
  end

endmodule

`timescale 1ns/1ns
module Absulote_tb();
reg i_clock;
reg i_Reset;
reg [21:0] i_W;
wire signed [21:0] o_Q;

SQRT UUTT
  (
    i_clock,
    i_Reset,
    i_W,
    o_Q,
  );
  
initial i_clock=0;
always #20 i_clock=~i_clock;

initial begin
  i_Reset = 1;
  #30
  i_Reset = 0;
  #30 
  i_W = 21'd9;
    #30 
  i_W = 21'd16;
    #30 
  i_W = 21'd25;
    #30 
  i_W = 21'd36;
    #30 
  i_W = 21'd49;
    #30 
  i_W = 21'd64;
    #30 
  i_W = 21'd81;
  #500
  $stop;
end
endmodule

