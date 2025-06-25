`ifndef RAM_W_SEQR_SV
`define RAM_W_SEQR_SV
class ram_w_seqr extends uvm_sequencer #(ram_w_trans);
  `uvm_component_utils(ram_w_seqr)

  function new(string name = "ram_w_seqr", uvm_component parent);
    super.new(name, parent);
  endfunction

endclass
`endif
