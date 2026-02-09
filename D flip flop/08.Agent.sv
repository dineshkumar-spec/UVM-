class agent extends uvm_agent;

  `uvm_component_utils(agent)
  
  driver drv;
  monitor mon;
  sequencer seq;
  
  function new(string name = "agent",uvm_component parent);
  
    super.new(name,parent);
  
  endfunction
  
  //build phase for construction
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    drv = driver::type_id::create("drv",this);
    mon = monitor::type_id::create("mon",this);
    seq = sequencer::type_id::create("seq",this);
    
  endfunction
  
  //connect driver and sequence
  function void connect_phase(uvm_phase phase);
    
   // super.connect_phase(phase);
    drv.seq_item_port.connect(seq.seq_item_export);//driver has seq_item_port sequencer has seq_item_export this makes connection.
    
  endfunction
endclass
