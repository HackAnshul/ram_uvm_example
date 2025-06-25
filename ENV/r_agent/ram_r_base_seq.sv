`ifndef RAM_R_BASE_SEQ_SV
`define RAM_R_BASE_SEQ_SV
class ram_r_base_seq extends uvm_sequence #(ram_r_trans);
  `uvm_object_utils(ram_r_base_seq)

  rand int no_of_trans;
  ram_r_trans r_trans_h;

  function new(string name = "ram_r_base_seq");
    super.new(name);
  endfunction

  //extern task body();
endclass
/*task ram_r_seq::body();
  automatic int itr = 0;
  repeat(no_of_trans) begin
    r_trans_h = ram_r_trans::type_id::create("r_trans_h");
    start_item(r_trans_h);
    assert(r_trans_h.randomize() with {rd_addr == itr;});
    finish_item(r_trans_h);
    itr+=1;
  end
endtask*/
`endif
