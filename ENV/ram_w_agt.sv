`ifndef RAM_W_AGT_SV
`define RAM_W_AGT_SV
class ram_w_agt extends uvm_agent;
  `uvm_component_utils(ram_w_agt)

  //uvm_analysis_export #(ram_w_trans) w_agt_analysis_exp;

  virtual ram_inf vif;
  ram_w_drv w_drv_h;
  ram_w_mon w_mon_h;
  ram_w_seqr w_seqr_h;

  function new(string name = "ram_w_agt", uvm_component parent);
    super.new(name, parent);
  endfunction

  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
endclass

function void ram_w_agt::build_phase(uvm_phase phase);
  super.build_phase(phase);
  w_drv_h = ram_w_drv::type_id::create("w_drv_h", this);
  w_mon_h = ram_w_mon::type_id::create("w_mon_h", this);
  w_seqr_h = ram_w_seqr::type_id::create("w_seqr_h", this);
endfunction

function void ram_w_agt::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  w_drv_h.seq_item_port.connect(w_seqr_h.seq_item_export);
  //w_agt_analysis_exp.connect(w_mon_h.w_mon_sb);
  //w_mon_h.w_mon_sb.connect(w_agt_analysis_exp);
  w_drv_h.vif = vif;
  w_mon_h.vif = vif;
endfunction
`endif
