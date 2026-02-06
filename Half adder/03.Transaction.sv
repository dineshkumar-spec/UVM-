class trans extends uvm_sequence_item;
  
  `uvm_object_utils(trans)//factorization
  
    rand bit a;
    rand bit b;
    bit sum;
    bit carry;
  
  function new (string name = "trans");
    super.new(name);
  endfunction
  
endclass
