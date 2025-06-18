`ifndef RAM_TOP_SV
`define RAM_TOP_SV
module ram_top();
  import uvm_pkg::*;
  import ram_pkg::*;
  `include "uvm_macros.svh"

  bit clk;

  ram_inf inf(clk);

  ram DUT(
          .clk(clk),
          .rst(inf.rst),
          .wr_enb(inf.wr_enb),
          .wr_addr(inf.wr_addr),
          .wr_data(inf.wr_data),
          .rd_enb(inf.rd_enb),
          .rd_addr(inf.rd_addr),
          .rd_data(inf.rd_data)
         );

  always #5 clk = ~clk;

  initial begin
     fork
       inf.reset(20);
       uvm_config_db #(virtual ram_inf)::set(null,"*","vif",inf);
       run_test("ram_base_test");
     join
   end

endmodule
`endif
