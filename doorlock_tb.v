`timescale 1ms/1ms
`include "comparator.v"
`include "display.v"
`include "doorlock.v"
`include "random_display.v"

module doorlock_tb;
   reg [3:0] button;
   reg [7:0] fingerprint;
   reg        sync_clk;
   wire [31:0] display1;
   wire          unlock1;
   wire [39:0] rand_display;

   doorlock i0(/*AUTOINST*/
          // Outputs
          .display1      (display1[31:0]),
          .unlock1         (unlock1),
          .rand_display      (rand_display[39:0]),
          // Inputs
          .button         (button[3:0]),
          .fingerprint      (fingerprint[7:0]),
          .sync_clk      (sync_clk));

   always
     #1 sync_clk = ~sync_clk;
         
   initial
     begin
   $dumpfile("doorlock_tb.vcd");
   $dumpvars(0, doorlock_tb);
   
   sync_clk = 0;
   button = 0; fingerprint = 8'b0;
   #10
     button = 10; fingerprint = 8'b1001_0111;
   #10
     button = 0; fingerprint = 8'b0;
   #10
     button = 11; fingerprint = 8'b1001_0111;
   #10
     button = 0; fingerprint = 8'b0;
   #10
     button = 11; fingerprint = 8'b1001_0111;
   #10
     button = 0; fingerprint = 8'b0;
   #10
     button = 11; fingerprint = 8'b1001_0111;
   #10
     button = 0; fingerprint = 8'b0;
   #10
     button = 11; fingerprint = 8'b1001_0111; 
   #10
     button = 0; fingerprint = 8'b0;
   #10
     button = 5; fingerprint = 8'b1001_0111;
   #10
     button = 0; fingerprint = 8'b0;
   #10
     button = 7; fingerprint = 8'b1001_0111;
   #10
     button = 0; fingerprint = 8'b0;
   #10
     button = 4; fingerprint = 8'b1001_0111;
   #10
     button = 0; fingerprint = 8'b0;
   #10
     button = 9; fingerprint = 8'b1001_0111;
   #10
     button = 0; fingerprint = 8'b0;
   #10
     button = 1; fingerprint = 8'b1001_0111;
   #10
     button = 0; fingerprint = 8'b0;
   #10
     button = 7; fingerprint = 8'b1001_0111;
   #10
     button = 0; fingerprint = 8'b0;
   #10
     button = 2; fingerprint = 8'b1001_0111;
   #10
     button = 0; fingerprint = 8'b0;
   #10
     button = 6; fingerprint = 8'b1001_0111;
   #10
     button = 0; fingerprint = 8'b0; // new password 57491726
   #10
     button = 5; fingerprint = 8'b1001_0111;
   #10
     button = 0; fingerprint = 8'b0;
   #10
     button = 7; fingerprint = 8'b1001_0111;
   #10
     button = 0; fingerprint = 8'b0;
   #10
     button = 4; fingerprint = 8'b1001_0111;
   #10
     button = 0; fingerprint = 8'b0;
   #10
     button = 9; fingerprint = 8'b1001_0111;
   #10
     button = 0; fingerprint = 8'b0;
   #10
     button = 1; fingerprint = 8'b1001_0111;
   #10
     button = 0; fingerprint = 8'b0;
   #10
     button = 7; fingerprint = 8'b1001_0111;
   #10
     button = 0; fingerprint = 8'b0;
   #10
     button = 2; fingerprint = 8'b1001_0111;
   #10
     button = 0; fingerprint = 8'b0;
   #10
     button = 6; fingerprint = 8'b1001_0111;
   #10
     button = 0; fingerprint = 8'b0;
   #10
     button = 12; fingerprint = 8'b1001_0111;
   #10
     button = 0; fingerprint = 8'b0;
   #100
     $finish;
     end // initial begin
endmodule // doorlock_tb
