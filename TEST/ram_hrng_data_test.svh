`ifndef RAM_HRNG_DATA_TEST_SVH
`define RAM_HRNG_DATA_TEST_SVH

class ram_hrng_data_test extends ram_base_test;

  `uvm_component_utils(ram_hrng_data_test)

  ram_hrng_w_seq w_seq;
  ram_simp_r_seq r_seq;

  function new(string name = "ram_hrng_data_test", uvm_component parent);
    super.new(name,parent);
  endfunction

  extern function void build_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
endclass

function void  ram_hrng_data_test::build_phase(uvm_phase phase);
  w_seq = ram_hrng_w_seq::type_id::create("w_seq");
  r_seq = ram_simp_r_seq::type_id::create("r_seq");
endfunction

task ram_hrng_data_test::run_phase(uvm_phase phase);
  phase.raise_objection(this,"HRNG_TESTCASE_BEGINS");
  fork
    begin
      void'(w_seq.randomize() with {no_of_trans == 10;});
      w_seq.start(env_h.w_agt_h.w_seqr_h);
    end
    begin
      void'(r_seq.randomize() with {no_of_trans == 10;});
      r_seq.start(env_h.r_agt_h.r_seqr_h);
    end
  join
  phase.drop_objection(this,"HRNG_TESTCASE_ENDED");
  phase.phase_done.set_drain_time(this,20ns);
endtask

`endif
