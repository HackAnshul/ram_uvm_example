`ifndef RAM_PACKAGE_SV
`define RAM_PACKAGE_SV

`include "ram_defines.svh"
`include "ram_inf.sv"

package ram_pkg;

  // uvm
  import uvm_pkg::*;
  `include "uvm_macros.svh"

   // env
  `include "ram_r_trans.sv"
  `include "ram_w_trans.sv"

  `include "ram_r_seq.sv"
  `include "ram_w_seq.sv"

  `include "ram_r_seqr.sv"
  `include "ram_w_seqr.sv"

  `include "ram_r_drv.sv"
  `include "ram_w_drv.sv"

  `include "ram_r_mon.sv"
  `include "ram_w_mon.sv"

  `include "ram_r_agt.sv"
  `include "ram_w_agt.sv"

  `include "ram_sb.sv"
  `include "ram_env.sv"

  //testcases
  // `include "ram_test_reset.svh"
  // `include "ram_test_read.svh"
  // `include "ram_test_write.svh"
  // `include "ram_test_simrw.svh"
  // `include "ram_test_back2back.svh"

  `include "ram_base_test.sv"

endpackage


`endif
