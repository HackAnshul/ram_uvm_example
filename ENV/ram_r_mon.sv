`ifndef RAM_R_MON_SV
`define RAM_R_MON_SV
class ram_r_mon extends uvm_monitor;

  virtual ram_inf vif;
  ram_r_trans r_mon_item;
  uvm_analysis_port #(ram_r_trans) r_mon_sb;

  `uvm_component_utils(ram_r_mon)

  function new (string name = "ram_r_mon", uvm_component parent);
    super.new(name, parent);
    r_mon_sb = new("r_mon_sb", this);
  endfunction

  extern task run_phase(uvm_phase phase);
  extern task monitor();
endclass

task ram_r_mon::run_phase(uvm_phase phase);
  // initial reset
  wait(vif.rst);
  wait(!vif.rst);
  forever begin
    fork
      begin
        wait(vif.rst); // in-b/w reset assert
      end
      forever begin
        @(vif.r_mon_cb)
        monitor();
        r_mon_item.print();
        r_mon_sb.write(r_mon_item);
      end
    join_any
    disable fork;
    wait(!vif.rst); //reset release
  end
endtask

task ram_r_mon::monitor();
  r_mon_item = ram_r_trans::type_id::create("r_mon_item");
  r_mon_item.rd_enb = vif.r_mon_cb.rd_enb;
  r_mon_item.rd_addr = vif.r_mon_cb.rd_addr;
endtask
`endif
