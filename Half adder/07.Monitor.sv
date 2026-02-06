class monitor extends uvm_monitor;
  
  `uvm_component_utils(monitor)
  
    virtual intf inf;
    trans tr;
  
  uvm_analysis_port #(trans) send;
  
  function new(string name = "monitor", uvm_component parent);
   
    super.new(name,parent);
  
  endfunction
  
  function void build_phase(uvm_phase phase);
   
    super.build_phase(phase);
     send = new("send",this);
    if(!uvm_config_db #(virtual intf) :: get(this,"","inf",inf))
      `uvm_fatal("mon","config_db not set in monitor")
  
   endfunction
      
      task run_phase(uvm_phase phase);
     
      super.run_phase(phase);
      forever begin
      #10;
        tr=trans::type_id::create("tr",this);
        tr.a = inf.a;
        tr.b = inf.b;
        tr.sum = inf.sum;
        tr.carry = inf.carry;
        send.write(tr);
      end
     
    endtask

endclass
