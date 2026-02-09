class driver extends uvm_driver#(seq_item);

  `uvm_component_utils(driver)
  
  seq_item s;
  virtual intf inf;
  
  function new(string name = "driver",uvm_component parent);
   
    super.new(name,parent);
  
  endfunction
  
  function void build_phase(uvm_phase phase);
   
    super.build_phase (phase);
    if (!uvm_config_db#(virtual intf)::get(this,"","inf",inf))
    `uvm_fatal("Driver","config db not found");
 
  endfunction
  
  task run_phase(uvm_phase phase);
  // s = seq_item::type_id::create("s"); 
  
       forever begin
       
         seq_item_port.get_next_item(s);//gget next item
         @(negedge inf.clk);
         
         inf.reset <= s.reset;
         inf.d <= s.d;
         @(posedge inf.clk);
         #10;
    seq_item_port.item_done();//if got all item done executed 
    end
  endtask
endclass
