`ifndef RAM_R_TRANS_SV
`define RAM_R_TRANS_SV
class ram_r_trans extends uvm_sequence_item ;
  rand bit rd_enb;
  rand bit [(`ADDR_WIDTH-1):0] rd_addr;
  bit [(`DATA_WIDTH-1):0] rd_data;

  `uvm_object_utils_begin(ram_r_trans)
    `uvm_field_int(rd_enb,UVM_ALL_ON)
    `uvm_field_int(rd_addr,UVM_ALL_ON)
    `uvm_field_int(rd_data,UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name = "ram_r_trans")
    super.new(name);
  endfunction
endclass
`endif
