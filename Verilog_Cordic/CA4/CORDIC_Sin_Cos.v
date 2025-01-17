module Trigonometry
  (
    i_clock,
    i_Reset,
    i_Theta,
    i_Valid,
    o_Sin,
    o_Cos,
    o_Busy,
    o_Done
  );

  // input and outputs
  input i_clock,i_Reset,i_Valid;
  input [15:0] i_Theta;
  output reg o_Busy,o_Done;
  output reg [15:0] o_Sin;
  output reg [15:0] o_Cos;

  // wires and registers
  wire [1:0] s_place;
  reg [1:0] s_ps;
  reg [1:0] s_ns;
  reg [3:0] s_Count_Times; // counter
  reg [15:0] s_z0,s_x0,s_y0;
  reg [15:0] s_Theta,s_sin,s_cos;

  // Alphas
  parameter [15:0] Alpha0 = 16'd8192; // 45 = tan-1(2**0)
  parameter [15:0] Alpha1 = 16'd4836; // tan-1(2**-1)
  parameter [15:0] Alpha2 = 16'd2555; // tan-1(2**-2)
  parameter [15:0] Alpha3 = 16'd1297; // tan-1(2**-3)
  parameter [15:0] Alpha4 = 16'd651; // tan-1(2**-4)
  parameter [15:0] Alpha5 = 16'd326; // tan-1(2**-5)
  parameter [15:0] Alpha6 = 16'd163; // tan-1(2**-6)
  parameter [15:0] Alpha7 = 16'd81; // tan-1(2**-7)
  parameter [15:0] Alpha8 = 16'd41; // tan-1(2**-8)
  parameter [15:0] Alpha9 = 16'd20; // tan-1(2**-9)
  parameter [15:0] Alpha[9:0] = '{Alpha9, Alpha8, Alpha7, Alpha6, Alpha5, Alpha4, Alpha3, Alpha2, Alpha1, Alpha0};

  
  parameter [1:0] idle = 2'd0;
  parameter [1:0] Calculate = 2'd1;
  parameter [1:0] Ending = 2'd2;

 
  parameter [1:0] place1 = 2'd0;
  parameter [1:0] place2 = 2'd1;
  parameter [1:0] place3 = 2'd2;
  parameter [1:0] place4 = 2'd3;

 
  parameter one = 16'd4096; 
  parameter zero = 16'd0;

  assign s_place = i_Theta[15:14]; 

  always@(*) 
  begin
    case(s_place)
      place1:
      begin
        s_x0 = zero;
        s_y0 = one;
        s_z0 = i_Theta;
      end
      place2:
      begin
        s_x0 = one;
        s_y0 = zero;
        s_z0 = {2'b00, i_Theta[13:0]}; // -p/2
      end
      place3:
      begin
        s_x0 = (16'b0 - one);
        s_y0 = zero;
        s_z0 = {2'b11, i_Theta[13:0]}; // +p/2
      end
      place4:
      begin
        s_x0 = zero;
        s_y0 = one;
        s_z0 = i_Theta;
      end
    endcase
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
      if(i_Valid)
      begin
        s_ns = Calculate;
      end
      else
      begin
        s_ns = idle;
      end
    end
    Calculate:
    begin
      if(s_Count_Times == 4'd10)
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
      o_Done <= 1'b0;
      o_Busy <= 1'b0;
      s_Count_Times <= 4'd0;
      s_sin <= s_x0;
      s_cos <= s_y0;
      s_Theta <= s_z0;
    end
    Calculate:
    begin
      o_Busy <= 1'b1;
      s_Count_Times <= s_Count_Times + 4'd1;
      if(s_Theta[15])
      begin
        s_Theta <= s_Theta + Alpha[s_Count_Times];
        s_sin <= s_sin - ({{16{s_cos[15]}}, s_cos} >> s_Count_Times);
        s_cos <= s_cos + ({{16{s_sin[15]}}, s_sin} >> s_Count_Times);
      end
      else
      begin
        s_Theta <= s_Theta - Alpha[s_Count_Times];
        s_sin <= s_sin + ({{16{s_cos[15]}}, s_cos} >> s_Count_Times);
        s_cos <= s_cos - ({{16{s_sin[15]}}, s_sin} >> s_Count_Times);
      end
    end
    Ending:
    begin
      o_Done <= 1'b1;
      o_Sin <= s_sin;
      o_Cos <= s_cos;
    end
    endcase
  end

endmodule

`timescale 1ns/1ns
module cordic_tb();
reg i_clock;
reg i_Reset,i_Valid;
reg [15:0] i_Theta;
wire signed [15:0] COS , o_Sin ;
wire o_Done,o_Busy;
Trigonometry UUT
  (
    i_clock,
    i_Reset,
    i_Theta,
    i_Valid,
    o_Sin,
    o_Cos,
    o_Busy,
    o_Done
  );
  
initial i_clock=0;
always #20 i_clock=~i_clock;

initial begin
  i_Reset = 1;
  #30
  i_Reset = 0;
  #30 
  i_Theta = 16'd1;
  i_Valid = 1;
  #30 
  i_Theta = 16'd90;
  i_Valid = 1;
  #30 
  i_Theta = 16'd120;
  i_Valid = 1;
  #30 
  i_Theta = 16'd150;
  i_Valid = 1;
  #30 
  i_Theta = 16'd150;
  i_Valid = 1;
  #30 
  i_Theta = 16'd180;
  i_Valid = 1;
  #30 
  i_Theta = 16'd60;
  i_Valid = 1;
  #30 
  i_Theta = 16'd30;
  i_Valid = 1;
  #500
  $stop;
end
endmodule



