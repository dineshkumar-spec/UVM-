class sequen extends uvm_sequence #(seq_item);

  `uvm_object_utils(sequen);
  //constructor
  function new(string name = "sequen");
    super.new(name);
  endfunction
  //task to randomize
  task body();
    seq_item s;
    repeat(10)begin
      s = seq_item::type_id::create("s");
//       start_item(s);
//       if(!s.randomize())`uvm_error("seq","Randomize failed");
//       finish_item(s);
      `uvm_do(s);
    end
  endtask
endclass
