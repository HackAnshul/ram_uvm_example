`ifndef RAM_W_TRANS_SV
`define RAM_W_TRANS_SV
class ram_w_trans extends uvm_sequence_item ;
  rand bit wr_enb;
  rand bit [(`ADDR_WIDTH-1):0] wr_addr;
  rand bit [(`DATA_WIDTH-1):0] wr_data;

  `uvm_object_utils_begin(ram_w_trans)
  `uvm_field_int(wr_enb,UVM_ALL_ON)
  `uvm_field_int(wr_addr,UVM_ALL_ON)
  `uvm_field_int(wr_data,UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name = "ram_w_trans")
    super.new(name);
  endfunction
endclass
`endif
