`ifndef RAM_PACKAGE_SV
`define RAM_PACKAGE_SV

`include "ram_defines.svh"
`include "ram_inf.sv"

package ram_pkg;
  `include "ram_r_trans.sv"
  `include "ram_w_trans.sv"
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
