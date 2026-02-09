`include "uvm_macros.svh"
import uvm_pkg::*;

`include "interface.sv"
`include "seq_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module dff_tb;
  //logic clk;
  intf inf();
  
  dflipflop dut (.clk(inf.clk),
    			 .reset(inf.reset),
                 .d(inf.d),
                 .q(inf.q));
  
  
  initial begin
    
    uvm_config_db#(virtual intf)::set(null,"*","inf",inf);
    
    run_test("test");
    
  end

always #5 inf.clk = ~inf.clk;  // 10-unit period

  
  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars;
    
    inf.clk = 0;
    #300 $finish;
  end
endmodule
