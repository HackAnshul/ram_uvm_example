`ifndef RAM_W_DRV_SV
`define RAM_W_DRV_SV
class ram_w_drv extends uvm_driver #(ram_w_trans);

  virtual ram_inf vif;

  `uvm_component_utils(ram_w_drv)

  function new (string name ="ram_w_drv", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  //extern function void build_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task send_to_dut(ram_w_trans req);

endclass

//function void ram_r_drv::build_phase(uvm_phase phase);
//    super.build_phase(phase);
//endfunction

task ram_w_drv::run_phase(uvm_phase phase);

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

task ram_w_drv::send_to_dut(ram_w_trans req);
  vif.w_drv_cb.wr_enb <=req.wr_enb;
  vif.w_drv_cb.wr_addr <=req.wr_addr;
  vif.w_drv_cb.wr_data <=req.wr_data;
endtask
`endif
