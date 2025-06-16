`ifndef RAM_R_SEQ_SV
`define RAM_R_SEQ_SV
class ram_r_seq extends uvm_sequence #(ram_r_trans);
  `uvm_object_utils(ram_r_seq)

  function new(string name = "ram_r_seq");
    super.new(name);
  endfunction

  extern task body();
endclass
task body();
endtask
`endif
