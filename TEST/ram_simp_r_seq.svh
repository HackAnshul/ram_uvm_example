`ifndef RAM_SIMP_R_SEQ_SVH
`define RAM_SIMP_R_SEQ_SVH

class ram_simp_r_seq extends ram_base_r_seq;

  `uvm_object_utils(ram_simp_r_seq)

  function new(string name = "ram_simp_r_seq");
    super.new(name);
  endfunction

  extern task body();
endclass

task ram_simp_r_seq::body();
  repeat(no_of_itr) begin
    req = ram_seq_item_r::type_id::create("req");
    start_item(req);
    if(!req.randomize() with {kind_e == READ;})
      `uvm_error("RSEQ","FAILED")
    finish_item(req);
  end
endtask
`endif

