class scoreboard extends uvm_scoreboard;

  `uvm_component_utils(scoreboard)
  
  uvm_analysis_imp #(seq_item,scoreboard)receive;
 
  
  function new(string name = "scoreboard",uvm_component parent);
   
    super.new(name,parent);
  
  endfunction
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    receive = new("receive",this);
    
  endfunction
  
  function void write(seq_item s);
     bit exp_q;
    
    if(s.reset)
      exp_q = 1'b0;
    else 
    exp_q = s.d;

   
    if(exp_q == s.q)begin
      `uvm_info("Sb",$sformatf("Pass_input:t=%0t,clk=%0b,reset=%0b,d=%0b,Actual output:q=%0b||Expected output:q=%0b",$time,s.clk,s.reset,s.d,s.q,exp_q),UVM_LOW)
     
    end else begin
      `uvm_error("Sb",$sformatf("Fail_input:t=%0t,clk=%0b,reset=%0b,d=%0b,Actual output:q=%0b||Expected output:q=%0b",$time,s.clk,s.reset,s.d,s.q,exp_q))
    end
            
   endfunction
endclass
