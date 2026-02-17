class generator;
  
  mailbox gen2drv;
  
  
  function new(mailbox gen2drv);
    this.gen2drv = gen2drv;
  endfunction
  
  
  task main();
    transaction trans;
    
    repeat(10) begin
      trans=new();
      trans.randomize();
      trans.display("GENERATOR");
      gen2drv.put(trans);
    end
  endtask
endclass
      
    
