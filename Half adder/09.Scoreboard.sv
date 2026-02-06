class scoreboard extends uvm_scoreboard;

  `uvm_component_utils(scoreboard)
 
  uvm_analysis_imp #(trans,scoreboard) receive;
  
  function new(string name = "scoreboard",uvm_component parent);
   
    super.new(name,parent);
  
  endfunction
  
  function void build_phase(uvm_phase phase);
   
    super.build_phase(phase);
    receive = new("receive",this);
  
  endfunction
  
  function void write(trans tr);
    
    if((tr.sum == (tr.a ^ tr.b)) && (tr.carry == (tr.a & tr.b)))begin
      `uvm_info("sco",$sformatf("Test Passed : a = %b ,b = %b, sum = %b, carry = %b",tr.a,tr.b,tr.sum,tr.carry), UVM_LOW);
    end
    else begin
      `uvm_error("sco",$sformatf("Test Failed"))
    end
  endfunction
endclass
