`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv";

class environment;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scr;
  
  mailbox gen2drv;
  mailbox mon2scr;
  
  virtual intf vint;
  
  function new(virtual intf vint);
    this.vint =vint;
    
    gen2drv = new();
    mon2scr = new();
    gen =new(gen2drv);
    drv = new(vint, gen2drv);
    mon = new(vint,mon2scr);
    scr =new(mon2scr);
    
  endfunction
  
  task run_task();
    fork
      gen.main();
      drv.main();
      mon.main();
      scr.main();
    join
  endtask
endclass
