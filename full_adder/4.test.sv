`include "environment.sv"

program test(intf int_f_add);
  environment env;
  
  initial 
    begin
      env=new(int_f_add);
      env.run_task();
    end 
endprogram
