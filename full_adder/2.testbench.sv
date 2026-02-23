`include "test.sv"
`include "interface.sv"

module full_adder_tb;
  
  intf int_f_add();
  test tst(int_f_add);
  
  full_adder dut (int_f_add);
  
  initial  
    begin
      $dumpfile("full_adder.vcd");
      $dumpvars;
    end
endmodule
  
  
