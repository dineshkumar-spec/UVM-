import uvm_pkg::*;          
`include "uvm_macros.svh"

`include "interface.sv"
`include "transaction.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module tb;
  intf inf();
  adder dut (.a(inf.a),
            .b(inf.b),
            .sum(inf.sum),
            .carry(inf.carry));
  
  initial begin
    
    uvm_config_db#(virtual intf)::set(null,"*","inf",inf);
    
    run_test("test");
    
  end
  
  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars;
    #200;
    $finish;
  end
endmodule
