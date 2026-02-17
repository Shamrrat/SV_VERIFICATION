`include "interface.sv"
`include "test.sv"


module testbench;
  intf int_d_ff();
  test tst(int_d_ff);
  
  
  d_ff dut(int_d_ff);
  
 initial int_d_ff.clk=1;
  always #5 int_d_ff.clk=~int_d_ff.clk;
  
  initial begin
    $dumpfile("d_ff.vcd");
    $dumpvars(0,testbench);
    #10000 $finish;
  end
endmodule
