class env extends uvm_env;
  
  `uvm_component_utils(env)
  
  scoreboard scb;
  agent agt;
  
  function new(string name = "env",uvm_component parent);
    super.new(name,parent);
    
    `uvm_info("ENV", "Environment Created", UVM_LOW)
    
  endfunction
  
  function void build_phase(uvm_phase phase);
   
    super.build_phase(phase);
    scb = scoreboard::type_id::create("scb",this);
   agt = agent::type_id::create("agt",this);
  
  endfunction
  
  function void connect_phase(uvm_phase phase);
   
    super.connect_phase(phase);
    agt.mon.send.connect(scb.receive);
    
  endfunction
endclass
