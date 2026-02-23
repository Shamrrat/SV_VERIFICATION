class generator;
  transaction trans;
  mailbox gen2drv;
  
  function new(mailbox gen2drv);
    this.gen2drv=gen2drv;
  endfunction
  
  
  task main();
    trans=new();
    repeat(3)
      begin
        trans.randomize();
        trans.display("Generation of values");
        
        assert(trans.randomize())
          else
            trans.display("generation failed");
        gen2drv.put(trans);
      end
  endtask
endclass
