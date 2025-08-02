`include "uvm_macros.svh"
import uvm_pkg::*;

class alu_driver extends uvm_driver #(alu_transaction);
    virtual alu_if vif;

    `uvm_component_utils(alu_driver)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db #(virtual alu_if)::get(this, "", "vif", vif))
            `uvm_fatal("NOVIF", "Interface not found")
    endfunction

    task run_phase(uvm_phase phase);
        alu_transaction tr;
        forever begin
            seq_item_port.get_next_item(tr);
            vif.a <= tr.a;
            vif.b <= tr.b;
            vif.opcode <= tr.opcode;
            @(posedge vif.clk);
            seq_item_port.item_done();
        end
    endtask
endclass
