`ifndef RAM_R_AGT_SV
`define RAM_R_AGT_SV
class ram_r_agt extends uvm_agent;
  `uvm_component_utils(ram_r_agt)

  virtual ram_inf vif;
  ram_r_drv r_drv_h;
  ram_r_mon r_mon_h;
  ram_r_seqr r_seqr_h;

  function new(string name = "ram_r_agt", uvm_component parent);
    super.new(name, parent);
  endfunction

  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
endclass

function void ram_r_agt::build_phase(uvm_phase phase);
  super.build_phase(phase);
  r_drv_h = ram_r_drv::type_id::create("r_drv_h", this);
  r_mon_h = ram_r_mon::type_id::create("r_mon_h", this);
  r_seqr_h = ram_r_seqr::type_id::create("r_seqr_h", this);
endfunction

function void ram_r_agt::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  r_drv_h.seq_item_port.connect(r_seqr_h.seq_item_export);
  r_drv_h.vif = vif;
  r_mon_h.vif = vif;
endfunction
`endif
