
module dafsm (input clk, reset, input [3:0] x_in0, x_in1, x_in2, x_in3,
output [3:0] lut, output reg [6:0] y);

reg [3:0] x0, x1, x2, x3;
wire [3:0] table_in, table_out;
reg [6:0] p; // temporary register

assign table_in[0] = x0[0];
assign table_in[1] = x1[0];
assign table_in[2] = x2[0];
assign table_in[3] = x3[0];

always @(posedge clk or posedge reset)
begin : DA //----> DA in behavioral style

parameter s0=0, s1=1;

reg [0:0] state;
reg [2:0] count; // Counts the shifts

if (reset) // Asynchronous reset
state <= s0;
else
case (state)
s0 : begin // Initialization
state <= s1;
count = 0;
p <= 0;
x0 <= x_in0;
x1 <= x_in1;
x2 <= x_in2;
x3 <= x_in3;
end
s1 : begin // Processing step
if (count == 4) begin // Is sum of product done?
y <= p; // Output of result to y and
state <= s0; // start next sum of product
end
else begin
p <= (p >> 1) + (table_out << 2); // p/2+table*4
x0[0] <= x0[1];
x0[1] <= x0[2];
x0[2] <= x0[3];
x1[0] <= x1[1];
x1[1] <= x1[2];
x1[2] <= x1[3];
x2[0] <= x2[1];
x2[1] <= x2[2];
x2[2] <= x2[3];
count = count + 1;
state <= s1;
end
end
endcase
end
case3 LC_Table0( .table_in(table_in), .table_out(table_out));
assign lut = table_out; // Provide test signal
endmodule


module case3 (input [3:0] table_in,
output reg [3:0] table_out); 
// This is the DA CASE table for the 4 coefficients: 3, 12, 12, 3
always @(table_in)
begin
case (table_in)
0 : table_out = 0;
1 : table_out = 3;
2 : table_out = 12;
3 : table_out = 15;
4 : table_out = 12;
5 : table_out = 15;
6 : table_out = 24;
7 : table_out = 27;
8 : table_out = 3;
9 : table_out = 6;
10: table_out = 15;
11: table_out = 18;
12: table_out = 15;
13: table_out = 18;
14: table_out = 27;
15: table_out = 30;
default : ;
endcase
end
endmodule