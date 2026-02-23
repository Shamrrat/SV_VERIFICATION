class monitor;
  virtual intf vint;
  mailbox mon2scr;
  
  function new(virtual intf vint,mailbox mon2scr);
    this.vint=vint;
    this.mon2scr = mon2scr;
  endfunction
  
  task main();
    repeat(3) begin
      transaction trans;
      trans = new();
      
      
      #1;
      trans.a=vint.a;
      trans.b=vint.b;
      trans.c=vint.c;
      trans.sum=vint.sum;
      trans.carry=vint.carry;
      
      mon2scr.put(trans);
      trans.display("monitor received");
    end
  endtask
endclass
