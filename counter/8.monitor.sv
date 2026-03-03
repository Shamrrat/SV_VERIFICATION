class monitor #(parameter WIDTH);
  transaction #(WIDTH) trans;			
  mailbox mon2scr;						
  virtual intf #(WIDTH) vintf;					
  
  function new(virtual intf #(WIDTH) vintf, mailbox mon2scr);
    this.mon2scr = mon2scr;
    this.vintf   = vintf;
  endfunction
  
  task mon_main();
   
    @(posedge vintf.clk);
    #1;
    
    repeat(((2**WIDTH)*3) +2) begin
      @(posedge vintf.clk); #1;
      
      trans = new();		// object allocation to transaction handle
      
      trans.reset   = vintf.reset;
      trans.enable  = vintf.enable;
      trans.up_down = vintf.up_down;
      trans.q		= vintf.q;
  
      trans.display("Received values to monitor");
      mon2scr.put(trans);
    end
  endtask
endclass
