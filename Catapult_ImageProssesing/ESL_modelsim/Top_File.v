
module Top_File(Clock,Rst,finish );
  
  input Clock,Rst,finish;
 
 
 
  wire [7:0] in_rsc_singleport_data_in;
  wire [17:0] in_rsc_singleport_addr;
  wire in_rsc_singleport_re;
  wire in_rsc_singleport_we;
  wire [7:0] in_rsc_singleport_data_out;
  wire [7:0] out_rsc_singleport_data_in;
  wire [17:0] out_rsc_singleport_addr;
  wire out_rsc_singleport_re;
  wire out_rsc_singleport_we;
  wire [7:0] out_rsc_singleport_data_out;
  
 
  
Convolotion U1(
  Clock, Rst, in_rsc_singleport_data_in, in_rsc_singleport_addr, in_rsc_singleport_re,
      in_rsc_singleport_we, in_rsc_singleport_data_out, out_rsc_singleport_data_in,
      out_rsc_singleport_addr, out_rsc_singleport_re, out_rsc_singleport_we, out_rsc_singleport_data_out
);

Ram U2  (out_rsc_singleport_addr,
         out_rsc_singleport_data_in,
         Clock,
         Rst,
         out_rsc_singleport_we,
         finish);
         
Rom U3 (in_rsc_singleport_addr, 
        in_rsc_singleport_data_out,
        Clock,
        Rst);     
endmodule