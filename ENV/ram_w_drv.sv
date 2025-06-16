`ifndef RAM_W_DRV_SV
`define RAM_W_DRV_SV
class ram_w_drv extends uvm_driver #(ram_w_trans);

  virtual ram_inf vif;

  `uvm_object_utils(ram_w_drv)

  function new (string name ="ram_w_drv", uvm_component parent);
    super.new(name, parent);
  endfunction

  extern function void build_phase(uvm_phase phase);
  extern function void run_phase(uvm_phase phase);
  extern task send_to_dut(ram_r_trans req);

endclass

function void ram_r_drv::build_phase(uvm_phase phase);
    super.build_phase(phase);
endfunction

function void ram_w_drv::run_phase(uvm_phase phase);
  //TODO : reset handling
  forever begin
    @(vif.w_drv_cb);
    seq_item_port.get_next_item(req);
    send_to_dut(req);
    seq_item_port.item_done();
  end
endfunction

task send_to_dut(ram_w_trans req);
  vif.w_drv_cb.wr_enb <=req.wr_enb;
  vif.w_drv_cb.wr_addr <=req.wr_addr;
  vif.w_drv_cb.wr_data <=req.wr_data;
endtask
`endif
