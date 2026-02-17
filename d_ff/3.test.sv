`include "environment.sv"

program test(intf int_d_ff);
  environment envi;
  
  initial begin
    envi =new(int_d_ff);
    envi.run_task();
  end
endprogram
