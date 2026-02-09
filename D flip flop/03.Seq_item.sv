class seq_item extends uvm_sequence_item;

  `uvm_object_utils(seq_item);
  
  bit clk;
  rand bit reset;
  rand bit d;
  bit q;
  
  constraint cons1{ reset dist{0:=80 , 1:=20};}
  constraint c_d   { d inside {0,1}; }
  
  function new(string name = "seq_item");
    super.new(name);
  endfunction
  
endclass
