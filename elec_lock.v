module elec_lock(
   
   output reg [47:0] display, 
   output reg        unlock,

  input button_bool,
   input [3:0]        button_1,
   input        button_over,
   input        missed_password,
   input        clk
   
   
   );
   reg [47:0] display_1 = 0;
   reg        unlock_reg = 0;
   reg        clock = 0;
   reg         change_bool = 0;

   reg [31:0] PASSWORD = 32'h12345678;
   reg [23:0] check_information =32'h981203;
   reg [7:0] clk_count;
   reg [2:0]  warning_count = 0;
  
  

   always@ (button_bool,button_over,missed_password) begin
      clock <= ~clock;
      clk_count <= 0;
      
   end

   always@ (posedge clk) begin
      clock <= 0;
      clk_count <= clk_count + 1;
      if (clk_count == 200)
   begin
      display <= 0;
      unlock <= 0;
      clk_count <= 0;
   end
      
   end

  
    
   always@ (posedge clock) begin
      if(warning_count < 4) begin
     
     
      if (button_over) begin
         if ((unlock_reg == 1))
      begin
              unlock <= 1;
         warning_count <= 0;
      end
    
         else
      begin
              unlock <= 0;
              display <= 0;
         warning_count <= warning_count + 1;
      end
    
      end // if (button[1])
      
      else begin
         
    if (missed_password)
      begin
         if(change_bool) begin
       if(button_bool) begin
          display <= (display<<4);
          display[3:0] <= button_1;
       end
       if(display[31] || display[30] || display[29] || display[28]) 
       begin
          PASSWORD <= display[31:0];
          change_bool <= 0;
          display <= 0;
          display_1 <= 0;
       end
         end
         else if(button_bool) begin
       display <= (display<<4);
       display[3:0] <= button_1;
         end
         if (display[23:0] == check_information) begin
       display <= 0;
       change_bool <= 1;
         end
         
    end // if (missed_password)
       
    else if (button_bool) 
      begin
              display <= (display<<4);
         display[3:0] <= button_1;
      end
    
       
         else
      begin
         unlock <= 0;
         display <= 0;
      end
      end // else: !if(button_over)
      end // if (warning_count < 4)
      
      else
   begin
      display <= 0;
      unlock <= 0;
   end // else: !if(warning_count < 4)
      
     if(~change_bool) begin
   display_1 <= display[31:0]; 
     end

     if (display_1 == PASSWORD) begin
    unlock_reg <= 1;
      end
    
     
  end // always@ (posedge clock)

endmodule // elec_lock
