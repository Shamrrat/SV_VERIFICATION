module d_ff(
  intf int_d_ff);
  
  always@(posedge int_d_ff.clk or posedge int_d_ff.reset) begin
    if(int_d_ff.reset)
      int_d_ff.q<=0;
    else
      int_d_ff.q<=int_d_ff.d;
  end
  assign int_d_ff.q_bar=!int_d_ff.q;
endmodule
