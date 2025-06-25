`ifndef RAM_R_SEQR_SV
`define RAM_R_SEQR_SV
class ram_r_seqr extends uvm_sequencer #(ram_r_trans);
  `uvm_component_utils(ram_r_seqr)

  function new(string name = "ram_r_seqr", uvm_component parent);
    super.new(name, parent);
  endfunction

endclass
`endif
