module display(/*AUTOARG*/
   // Outputs
   display, unlock, rand_display,
   // Inputs
   number, clk, clk1
   );
   input [3:0] number; // comparator의 output s 숫자 
   input       clk, clk1; // clk는 comparator output s : display에 숫자 뜨게 하는 클럭
                          // clk1은 일반적인 clock : 긴 시난 입력 없을시 초기화 하는 용도
   output [31:0] display; // 숫자판 display
   output    unlock;
   output [39:0] rand_display;

   /*AUTOWIRE*/
   /*AUTOREG*/
   reg [31:0]    disp, reset_count = 32'b0; // reset_count : 초기화 하기 위해 세는 변수
   reg       open; 
   reg [3:0]       count = 4'b0, pass_count = 4'b0; // pass_count : 비밀번호 바꿀떄 8자리로 설정하기 위한 변수
   reg [31:0]       password = 32'b0001_0010_0011_0100_0101_0110_0111_1000; 
   // initial password 12345678
   reg [15:0]       change_pass = 16'b1011_1011_1011_1011; // #### --> change password
  
random_display digit_disp(/*AUTOINST*/
           // Outputs
           .rand_display      (rand_display[39:0]),
           // Inputs
           .pass_count      (pass_count[3:0]));


   
   assign #5 display = disp; 
   assign #5 unlock = open;

   // 긴 시간 아무것도 안누름 --> reset
   always @ (posedge clk1) // 지문이 다르거나 입력 없는게 6초 넘으면 초기화 하는 코딩문
     begin
   reset_count <= reset_count + 1;
   if (number != 4'b0 && clk == 0) 
     begin
        reset_count <= 0;
     end
   else
     begin
        if(reset_count == 3000) // 얼마나 안누르면 초기화 설정하는 변수 (6sec)
          begin
        reset_count <= 0;
        disp <= 0; open <= 0;
        count <= 0; pass_count <= 0; // reset
          end
     end // else: !if(number != 4'b0)
     end // if (s == 1)
          
   always @ (posedge clk) // 지문 일치, 입력 들어올떄 display 갱신, 시작위해 *(=10) 눌러야 함
     begin
   if(disp == password)
     begin
        open <= 1;
        disp <= 0;
        count <= 0;
        pass_count <= 0;
     end
   else if (disp [15:0] == change_pass && pass_count < 8) // 비번 바꾸기 
     begin
        password[31:4] = password[27:0];
        password[3:0] = number;
        pass_count <= pass_count + 1;
        count <= 0;
     end
   else
     begin
        disp[31:4]   <= disp[27:0]; count <= count + 1; // display 밀리면서 숫자표기
        if(number == 10 || count == 8)
          begin 
        open <= 0;
        disp <= 0;
        count <= 0 ;
        pass_count <= 0;
        reset_count <= 0;
          end
        else
          begin
        disp[3:0] <= number;
          end
     end // else: !if(disp == 32'b0001_0010_0011_0100_0101_0110_0111_1000)
     end // always @ (negedge clk)
     
endmodule // display
