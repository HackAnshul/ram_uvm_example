`include "ram_defines.svh"
`include "ram_inf.sv"

package ram_env_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import ram_w_agt_pkg::*;
  import ram_r_agt_pkg::*;

  `include "ram_sb.sv"

  `include "ram_virtual_seqr.sv"
  `include "ram_base_v_seq.sv"

  `include "ram_env.sv"

endpackage
