`ifndef RAM_HRNG_W_SEQ_SVH
`define RAM_HRNG_W_SEQ_SVH
class ram_hrng_w_seq extends ram_base_w_seqs;

  `uvm_object_utils(ram_hrng_w_seq)

  function new(string name = "ram_hrng_w_seq");
    super.new(name);
  endfunction

  extern task body();
endclass

task ram_hrng_w_seq::body();
  repeat (no_of_trans) begin
    req = ran_w_trans::type_id::create("req");
    start_item(req);
    if(!req.randomize() with {wr_data inside {[150:250]};})
      `uvm_error("WSEQ","FAILED")
    finish_item(req);
  end
endtask
`endif
