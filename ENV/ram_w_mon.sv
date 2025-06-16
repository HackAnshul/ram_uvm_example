`ifndef RAM_W_MON_SV
`define RAM_W_MON_SV
class ram_w_mon extends uvm_monitor;

  virtual ram_inf vif;
  ram_w_trans w_mon_item;
  uvm_analysis_port #(ram_w_trans) w_mon_sb;

  `uvm_component_utils(ram_w_mon)

  function new (string name = "ram_w_mon", uvm_component parent);
    super.new(name, parent);
    r_mon_sb = new("w_mon_sb", this);
  endfunction

  extern task run_phase(uvm_phase phase);
  extern task monitor();
endclass

task run_phase(uvm_phase phase);
  //TODO: reset handling
  forever begin
    @(vif.w_mon_cb)
    monitor();
    w_mon_sb.write(w_mon_item);
  end
endtask

task monitor();
  w_mon_item = w_mon_item::type_id::create("w_mon_item");
  w_mon_item.wr_enb = vif.r_mon_cb.wr_enb;
  w_mon_item.wr_addr = vif.r_mon_cb.wr_addr;
  w_mon_item.wr_data = vif.r_mon_cb.wr_data;
endtask
`endif
