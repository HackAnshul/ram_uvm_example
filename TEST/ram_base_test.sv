
class ram_base_test extends uvm_test;

  `uvm_component_utils(ram_base_test)

  ram_env env_h;

  ram_w_seq w_seq_h;
  ram_r_seq r_seq_h;

  function new (string name = "ram_base_test", uvm_component parent=null);
    super.new(name,parent);
  endfunction

  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    env_h = ram_env::type_id::create("env_h",this);
    w_seq_h = ram_w_seq::type_id::create("w_seq_h",this);
    r_seq_h = ram_r_seq::type_id::create("r_seq_h",this);
  endfunction

  task run_phase (uvm_phase phase);
     phase.raise_objection(this);
     fork
       begin
         void'(w_seq_h.randomize() with {no_of_trans == 10;});
         w_seq_h.start(env_h.w_agt_h.w_seqr_h);
       end
       begin
         void'(r_seq_h.randomize() with {no_of_trans == 10;});
         r_seq_h.start(env_h.r_agt_h.r_seqr_h);
       end
     join
	 phase.drop_objection(this);
  endtask

endclass
