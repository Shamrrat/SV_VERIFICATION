class scoreboard;
  monitor mon;
  mailbox mon2scr;
  
  function new(mailbox mon2scr);
    this.mon2scr=mon2scr;
  endfunction
  
  task main();
    repeat(3)
      begin
        transaction trans;
        mon2scr.get(trans);
        trans.display("scoreboard received");
        self_checking(trans);
        
      end
  endtask
  
  
  //self checking
  task self_checking(transaction trans);
    logic a,b,c,sum,carry;
    logic exp_sum,exp_carry;
    
    begin
      a= trans.a;
      b= trans.b;
      c= trans.c;
      exp_sum= trans.sum;
      exp_carry= trans.carry;
    
      sum=a^b^c;
      carry=(a&b) | (b&c) | (c&a);
      
      $display("-----------------%s-------------",((exp_sum == sum) && (exp_carry == carry)) ? "pass" : "fail");
      $display("-------------%s--------\n","transaction done");
    end
  endtask
endclass
    
