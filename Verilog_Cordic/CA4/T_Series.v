
module Register
  (
    a,
    w,
    en,
    clock,
    reset
  );
    
    input[21:0] a;
    input en,clock,reset;
    output reg[21:0] w;
    
    always@(posedge clock) begin
      if(reset)
        w<=21'b0;
      else if(en) begin
        w<=a;
      end
    end
    
  endmodule


module T_Square
  (
    i_clock,
    i_reset,
    enW,
    enQ,
    SelectM,
    i_W,
    o_Q
  );
  
  input i_clock,i_reset,enW,enQ;
  input[21:0] i_W;
  input[1:0] SelectM;
  output [21:0] o_Q;
  
  wire [21:0] s_Xout,s_Mout,s_Aout,s_Rout;
  
  Register Wreg
  (
    i_W,
    s_Xout,
    enW,
    clock,
    reset
  );
  
  assign s_Mout = (SelectM == 2'b00) ? 1 : (SelectM == 2'b01) ? i_W << 1 : (SelectM == 2'b10) ? i_W << 3 : (SelectM == 2'b11) ? i_W << 4 : 0;
  
  assign s_Aout = s_Rout + s_Mout;
  
  Register Qreg
  (
    s_Aout,
    s_Rout,
    enQ,
    clock,
    reset
  );
  
  assign o_Q = s_Rout;
  
endmodule

module Controller
  (
    SelectM,
    enW,
    enQ,
    Clock,
    Reset
  );
  
  output reg[1:0] SelectM;
  output reg enW,enQ;
  input Clock,Reset;
  
  reg[2:0] ps,ns;
  
  parameter Idle =3'b000;
  parameter First =3'b001;
  parameter Second =3'b010;
  parameter Third =3'b011;
  parameter Fourth =3'b100;
  
  always@(posedge Clock) begin
    if(Reset)
      ps <= Idle;
    else
      ps <= ns;
  end

  always@(ps) begin
    case(ps)
      
      Idle: begin
        ns <= First;
      end
      
      First: begin
        ns <= Second;
      end
      
      Second: begin
        ns <= Third;
      end
      
      Third: begin
        ns <= Fourth;
      end
      
      Fourth: begin
        ns <= Idle;
      end
      
    endcase
  end
  
  always@(ps) begin
    enW=1'b0;enQ=1'b0;SelectM=2'b0;
    case(ps)
      
      Idle: begin
        enW <= 1'b1;
      end
      
      First: begin
        SelectM <= 2'b00;
      end
      
      Second: begin
        SelectM <= 2'b01;
      end
      
      Third: begin
        SelectM <= 2'b10;
      end
      
      Fourth: begin
        SelectM <= 2'b11;
        enQ <= 1'b1;
      end
      
    endcase
  end
  
endmodule


module Tseries
  (
    i_clock,
    i_reset,
    i_W,
    o_Q
  );
  
  input i_clock,i_reset;
  input[21:0] i_W;
  output [21:0] o_Q;
  
  wire s_enW,s_enQ;
  wire[1:0] s_SelectM;
  
  T_Square DP
  (
    i_clock,
    i_reset,
    s_enW,
    s_enQ,
    s_SelectM,
    i_W,
    o_Q
  ); 
  
  Controller Cnt
  (
    s_SelectM,
    s_enW,
    s_enQ,
    i_clock,
    i_reset
  ) ;
  
endmodule


`timescale 1ns/1ns
module Tseries_tb();
reg i_clock;
reg i_Reset;
reg [21:0] i_W;
wire[21:0] o_Q ;

Tseries UT
  (
    i_clock,
    i_reset,
    i_W,
    o_Q
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
    
          