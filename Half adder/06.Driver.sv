class driver extends uvm_driver #(trans);
  
  `uvm_component_utils(driver)
 
  trans tr;
  virtual intf inf;
  
  
  function new (string name = "driver",uvm_component parent);
   
    super.new(name,parent);
  
  endfunction
  
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    if(!uvm_config_db#(virtual intf)::get(this,"","inf",inf))
      `uvm_fatal("DRV","Config db not found")
  endfunction
  
      task run_phase(uvm_phase phase);
       
       super.run_phase(phase);
        
        forever begin
          tr=trans::type_id::create("tr");
       
          seq_item_port.get_next_item(tr);//geting next item from sequencer
        inf.a = tr.a;
        inf.b = tr.b;
          
          #10;
        
          seq_item_port.item_done();
        end
      endtask
endclass
