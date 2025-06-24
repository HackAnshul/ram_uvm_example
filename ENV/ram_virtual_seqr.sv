
class ram_virtual_seqr extends uvm_sequencer #(uvm_sequence_item);

  `uvm_component_utils(ram_virtual_seqr)
   
   function new (string name = "ram_virtual_seqr", uvm_component parent=null);
	  super.new(name,parent);
   endfunction
   
   //sub_sequencers handle
   ram_w_seqr w_seqr_h;
   ram_r_seqr r_seqr_h;
   
endclass
