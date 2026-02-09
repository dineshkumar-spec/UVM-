class test extends uvm_test;

  `uvm_component_utils(test)
  
  environment env;
  sequen seq;
    
  function new(string name = "test",uvm_component parent);
   
    super.new(name,parent);
  
  endfunction
    
    function void build_phase(uvm_phase phase);
     
      super.build_phase(phase);
      env = environment::type_id::create("env",this);
       seq = sequen::type_id::create("seq",this);
 
    endfunction
    
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    phase.raise_objection(this);
    seq.start(env.agt.seq);
    #200;
    
   phase.drop_objection(this);
  
  endtask
endclass
