`ifndef RAM_ENV_SV
`define RAM_ENV_SV
class ram_env extends uvm_env;
  `uvm_component_utils(ram_env)
  ram_r_agt r_agt_h;
  ram_w_agt w_agt_h;
  ram_sb sb_h;

  function new(string name = "ram_env", uvm_component parent);
    super.new(name, parent);
  endfunction

extern function void build_phase (uvm_phase phase);
extern function void connect_phase (uvm_phase phase);
endclass
function void ram_env::build_phase (uvm_phase phase);
  super.build_phase(phase);
  w_agt_h = ram_w_agt::type_id::create("w_agt_h",this);
  r_agt_h = ram_r_agt::type_id::create("r_agt_h",this);
  sb_h    = ram_sb::type_id::create("sb_h",this);
endfunction

function void ram_env::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  w_agt_h.w_mon_h.w_mon_sb.connect(sb_h.w_mon_sb);
  r_agt_h.r_mon_h.r_mon_sb.connect(sb_h.r_mon_sb);
endfunction
`endif
