class seq extends uvm_sequence #(trans);
  
  `uvm_object_utils(seq)
  
  function new(string name = "seq");
    super.new(name);
  endfunction
  
  task body();
    trans tr;
    `uvm_info("TRAS", "Trans starts", UVM_LOW)
    repeat(10)begin
      tr = trans::type_id::create("tr");
//       start_item(tr);
//       tr.randomize();
//       finish_item(tr);
      `uvm_do(tr)
    end
  endtask
endclass
