class agent extends uvm_agent;
  
  `uvm_component_utils(agent)
  
  driver dv;
  monitor mon;
  sequencer seq;
  
  function new(string name = "agent",uvm_component parent);
   
    super.new(name,parent);
  
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  
    dv  = driver::type_id::create("dv",this);
    mon = monitor::type_id::create("mon",this);
    seq = sequencer::type_id::create("seq",this);
 
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    dv.seq_item_port.connect(seq.seq_item_export);
  endfunction

endclass
