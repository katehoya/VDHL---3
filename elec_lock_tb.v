`timescale 10ms/10ms
`include "elec_lock.v"

module elec_lock_tb;
   reg [3:0] button_1;
   reg        button_over;
   reg        clk;
   reg  [3:0]    num;///수정

   reg         missed_password;
   wire [47:0]   display;
   wire   unlock;
   reg     button_bool;
   elec_lock i0(/*AUTOINST*/
		// Outputs
		.display		(display[47:0]),
		.unlock			(unlock),
		// Inputs
		.button_bool		(button_bool),
		.button_1		(button_1[3:0]),
		.button_over		(button_over),
		.missed_password	(missed_password),
		.clk			(clk),
		.num			(num[3:0]));

   always
     
     #10 clk <= ~clk;

   initial
     begin
   $dumpfile ("elec_lock_tb.vcd");
   $dumpvars (0,elec_lock_tb);

   
   clk = 0;
        
   button_1= 0;
   button_bool = 0;
   button_over = 1;
   missed_password = 0;
   
   
	
   #1000
     button_over = 0;
   #1000
     missed_password = 1;
    #50
     button_bool = 1;
     button_1 = 9;
   #50
     button_bool = 0;
   #50
     button_bool = 1;
     button_1 = 8;
   #50
     button_bool = 0;
   #50
     button_bool = 1;
     button_1 = 1;
   #50
     button_bool = 0;
   #50
     button_bool = 1;
     button_1 = 2;
   #50
     button_bool = 0;
   #50
     button_bool = 1;
     button_1 = 0;
   #50
     button_bool = 0;
   #50
     button_bool = 1;
     button_1 = 3;
  


 #50
     button_bool = 0;
     
   #50
     button_bool = 1;
	num=2;///수정
     button_1 = 1;
   #50
     button_bool = 0;

   
   #50
     button_bool = 1;
     button_1 = 2;
   #50
     button_bool = 0;

   
   #50
     button_bool = 1;
     button_1 = 3;
   #50
     button_bool = 0;

   
   #50
     button_bool = 1;
     button_1 = 4;
   #50
     button_bool = 0;

   
   #50
     button_bool = 1;
     button_1 = 9;
   #50
     button_bool = 0;

   
   #50
     button_bool = 1;
     button_1 = 8;
   #50
     button_bool = 0;

   
   #50
     button_bool = 1;
     button_1 = 7;
   #50
     button_bool = 0;
   #50
     button_bool = 1;
     button_1 = 6;

    #50
     button_bool = 0;

   
    #50
     button_bool = 1;
     button_1 = 1;
   
   #50
     button_bool = 0;

   
    #50
     button_bool = 1;
     button_1 = 2;
   #50
     button_bool = 0;

   
   #50
     button_bool = 1;
     button_1 = 3;
   #50
     button_bool = 0;

   
   #50
     button_bool = 1;
     button_1 = 4;
   #50
     button_bool = 0;

   
   #50
     button_bool = 1;
     button_1 = 9;
   #50
     button_bool = 0;

   
   #50
     button_bool = 1;
     button_1 = 8;
   #50
     button_bool = 0;

   
   #50
     button_bool = 1;
     button_1 = 7;
   #50
     button_bool = 0;
   #50
     button_bool = 1;
     button_1 = 6;

    #50
     button_bool = 0;
   #50
     button_bool = 1;
     button_1 = 6;

    #50
     button_bool = 0;
   #50
     button_bool = 1;
     button_1 = 6;

    #50
     button_bool = 0;
   #50
     button_bool = 1;
     button_1 = 6;

    #50
     button_bool = 0;
   #50
     button_bool = 1;
     button_1 = 6;

    #50
     button_bool = 0;
   #50
     button_bool = 1;
     button_1 = 6;

    #50
     button_bool = 0;
   #50
     button_bool = 1;
     button_1 = 6;
       
    
   #6000
    
   



   
  
    
     $finish;
     end // initial begin
endmodule // elec_lock_tb
