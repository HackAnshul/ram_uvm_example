`ifndef RAM_SB_SV
`define RAM_SB_SV

class ram_sb extends uvm_scoreboard;

  `uvm_components_utils(ram_scb)

  uvm_analysis_imp #(ram_wtrans) w_sb_analysis_imp;
  uvm_analysis_imp #(ram_rtrans) r_sb_analysis_imp;

  function new(string name="ram_scb",uvm_component parent);
    super.new(name, parent);
  endfunction

endclass

`endif
