class driver;
  virtual intf vint;
  
  mailbox gen2drv;
  
  function new(virtual intf vint, mailbox gen2drv);
    this.vint =vint;
    this.gen2drv=gen2drv;
  endfunction
  
  task main();
    repeat(3)
      begin
        transaction trans;
        gen2drv.get(trans);
        
          vint.a <= trans.a;
          vint.b <= trans.b;
          vint.c <= trans.c;
        #1;
        
        trans.display("received values of trans");
      end
  endtask
endclass
