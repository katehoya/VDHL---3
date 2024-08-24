module comparator(/*AUTOARG*/
   // Outputs
   s, num,
   // Inputs
   F, b
   ); //지문 비교기
   input [7:0] F; // fingerprint
   input [3:0] b; // button
   
   output   s; // 지문 일치하면 0 아니면 1
   output [3:0]   num; // 입력 숫자 그대로
   reg [7:0]   F1 = 97; // 저장된 지문
   
   /*AUTOWIRE*/
   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   
   // End of automatics
   assign  num = b;
   assign  s = (F == F1) ? 0 : 1;
        endmodule // comparator
