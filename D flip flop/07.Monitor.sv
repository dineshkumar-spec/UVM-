class monitor extends uvm_monitor;

  `uvm_component_utils(monitor)
  
  virtual intf inf;
  
  uvm_analysis_port#(seq_item)send;
  seq_item s;
  function new(string name = "monitor",uvm_component parent);
   
    super.new(name,parent);
  
  endfunction
  
  function void build_phase(uvm_phase phase);
   
    super.build_phase(phase);

    if(!uvm_config_db #(virtual intf)::get(this,"","inf",inf))
      `uvm_fatal("Monitor","config db not set");
     send = new("send",this);
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase (phase);
    forever begin
     
      @(posedge inf.clk);
      #1;
      s = seq_item::type_id::create("s",this);
    
      s.reset = inf.reset;
      s.clk = inf.clk;
      s.d = inf.d;
      s.q = inf.q;
      send.write(s);
    end
    
  endtask
endclass
