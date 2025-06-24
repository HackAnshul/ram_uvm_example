`ifndef RAM_BASE_V_SEQ_SV
`define RAM_BASE_V_SEQ_SV
class ram_base_v_seq extends uvm_sequence #(uvm_sequence_item);
  `uvm_object_utils_begin(ram_w_seq)
  `uvm_object_utils_end

  ram_virtual_seqr v_seqr_h;

  function new(string name = "");
    super.new(name);
  endfunction

  extern task pre_start();
endclass
task ram_base_v_seq::pre_start();
  if(!$cast(vseqr_h,m_sequencer))
    `uvm_fatal(get_full_name(),"virtual sequencer cast failed!")
endtask
/*task ram_w_seq::body();
  automatic int itr=0;
  repeat(no_of_trans) begin
    itr+=1;
    w_trans_h = ram_w_trans::type_id::create("w_trans_h");
    start_item(w_trans_h);
    assert(w_trans_h.randomize() with {wr_data > 150; wr_addr == itr;});
    finish_item(w_trans_h);
  end
endtask*/
`endif

