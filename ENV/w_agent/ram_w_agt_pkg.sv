package ram_ragent_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  `include "ram_defines.svh"
  `include "ram_env_config.svh"

  `include "ram_w_trans.sv"
  `include "ram_w_seqr.sv"

  `include "ram_w_drv.sv"
  `include "ram_w_mon.sv"
  `include "ram_w_agt.sv"

  `include "ram_w_base_seq.sv"

endpackage

