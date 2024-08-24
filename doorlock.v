module doorlock(/*AUTOARG*/
   // Outputs
   display, unlock,
   // Inputs
   button, fingerprint, button_over,missed_password,clk
   );
   
   input [7:0] fingerprint;
   input       button_over;
   input       missed_password;
   input       clk;
   input [3:0] button;
   
   output [47:0] display;
   output   unlock;

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [47:0]      display;      // From our_disp of elec_lock.v
   wire [3:0]      num;         // From our_comp of comparator.v
  
   wire         unlock;         // From our_disp of elec_lock.v
   wire         clk_1;
   // End of automatics
   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
  
   // Beginning of automatic regs (for this module's undeclared outputs)
  

   comparator our_comp(/*AUTOINST*/
             // Outputs
             .s      (clk_1),
             .num             (num[3:0]),
             // Inputs
             .F      (fingerprint[7:0]),
             .b               (button[3:0]));
   elec_lock our_disp(/*AUTOINST*/
            // Outputs
            .display1      (display[47:0]),
            .unlock1      (unlock),
            // Inputs
            .button_bool   (clk_1),
            .button_1      (num[3:0]),
            .button_over   (button_over),
            .missed_password   (missed_password),
            .clk      (clk));

endmodule // doorlock
