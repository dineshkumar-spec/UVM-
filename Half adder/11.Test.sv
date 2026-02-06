class test extends uvm_test;
  
  `uvm_component_utils(test)
   env ev;
   seq sq;
  
  function new(string name = "test",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
   
    super.build_phase(phase);
    ev = env::type_id::create("ev",this);
    sq = seq::type_id::create("sq"); 
 
  endfunction
  
  task run_phase(uvm_phase phase);
    
    super.run_phase(phase);
    phase.raise_objection(this);
    sq.start(ev.agt.seq);
    #100;
    phase.drop_objection(this);
  
  endtask
endclass
