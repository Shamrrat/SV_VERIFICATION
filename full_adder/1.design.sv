`include "interface.sv"
module full_adder(intf int_f_add);
  assign {int_f_add.carry,int_f_add.sum}=int_f_add.a+int_f_add.b+int_f_add.c;
endmodule
