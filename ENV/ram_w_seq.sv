`ifndef RAM_W_SEQ_SV
`define RAM_W_SEQ_SV
class ram_w_seq extends uvm_sequence #(ram_w_trans);
  `uvm_object_utils(ram_w_seq)

  function new(string name = "ram_w_seq");
    super.new(name);
  endfunction

  extern task body();
endclass
task body();
endtask
`endif
