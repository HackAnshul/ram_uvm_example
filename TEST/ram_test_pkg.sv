package ram_test_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  `include "ram_defines.svh"

  import ram_w_agt_pkg::*;
  import ram_r_agt_pkg::*;
  import ram_env_pkg::*;

  `include "ram_env_config.svh"
  `include "ram_base_test.sv"

  `include "ram_simp_r_seq.svh"
  `include "ram_simp_w_seq.svh"

  `include "ram_hrng_w_seq.svh"
  `include "ram_lrng_w_seq.svh"

  `include "ram_hrng_data_test.svh"
  `include "ram_lrng_data_test.svh"


endpackage
