`ifndef RAM_W_SEQ_SV
`define RAM_W_SEQ_SV
class ram_w_seq extends uvm_sequence #(ram_w_trans);
  `uvm_object_utils(ram_w_seq)

  rand int no_of_trans;
  ram_w_trans w_trans_h;

  function new(string name = "ram_w_seq");
    super.new(name);
  endfunction

  extern task body();
endclass
task ram_w_seq::body();
  automatic int itr=0;
  repeat(no_of_trans) begin
    itr+=1;
    w_trans_h = ram_w_trans::type_id::create("w_trans_h");
    start_item(w_trans_h);
    assert(w_trans_h.randomize() with {wr_data > 150; wr_addr == itr;});
    finish_item(w_trans_h);
  end
endtask
`endif
