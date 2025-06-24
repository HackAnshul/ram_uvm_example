`ifndef RAM_SB_SV
`define RAM_SB_SV
`uvm_analysis_imp_decl (_wr)
`uvm_analysis_imp_decl (_rd)


class ram_sb extends uvm_scoreboard;

  `uvm_component_utils(ram_sb)

  int mem[];

  uvm_analysis_imp_wr #(ram_w_trans,ram_sb) w_mon_sb;
  uvm_analysis_imp_rd #(ram_r_trans,ram_sb) r_mon_sb;

  function new(string name="ram_sb",uvm_component parent);
    super.new(name, parent);
    w_mon_sb = new("w_mon_sb",this);
    r_mon_sb = new("r_mon_sb",this);
    mem = new[`DEPTH];
  endfunction

  extern function void write_wr(ram_w_trans trans_h);
  extern function void write_rd(ram_r_trans trans_h);
endclass

function void ram_sb::write_wr(ram_w_trans trans_h);
  if(trans_h.wr_enb)
    mem[trans_h.wr_addr] = trans_h.wr_data;
endfunction

function void ram_sb::write_rd(ram_r_trans trans_h);
  trans_h.print();
  if(trans_h.rd_enb) begin
    if(ram_dyn[trans_h.rd_addr] == trans_h.rd_data )
      `uvm_info("info","pass",UVM_LOW);
    else
      `uvm_error("error",$sformatf("fail exp_data = %p",ram_dyn[trans_h.rd_addr]));
  end
endfunction

`endif
