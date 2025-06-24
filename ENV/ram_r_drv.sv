`ifndef RAM_R_DRV_SV
`define RAM_R_DRV_SV
class ram_r_drv extends uvm_driver #(ram_r_trans);

  virtual ram_inf vif;

  `uvm_component_utils(ram_r_drv)

  function new (string name = "ram_r_drv", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  //extern function void build_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task send_to_dut(ram_r_trans req);

endclass

//function void ram_r_drv::build_phase(uvm_phase phase);
//    super.build_phase(phase);
//endfunction

task ram_r_drv::run_phase(uvm_phase phase);

  // wait for initial reset
  wait(vif.rst);
  wait(!vif.rst);
  forever begin
    fork
      begin
        wait(vif.rst); //in-b/w reset assert
      end
      forever begin
        @(vif.r_drv_cb);
        seq_item_port.get_next_item(req);
        send_to_dut(req);
        seq_item_port.item_done();
      end
    join_any
    disable fork;
    wait(!vif.rst); //reset release
  end
endtask

task ram_r_drv::send_to_dut(ram_r_trans req);
  vif.r_drv_cb.rd_enb <=req.rd_enb;
  vif.r_drv_cb.rd_addr <=req.rd_addr;

endtask
`endif
