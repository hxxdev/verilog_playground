`include "uvm_macros.svh"
import uvm_pkg::*;

class alu_monitor extends uvm_monitor;
    virtual alu_if vif;
    uvm_analysis_port #(alu_transaction) ap;

    `uvm_component_utils(alu_monitor)

    function new(string name, uvm_component parent);
        super.new(name, parent);
        ap = new("ap", this);
    endfunction

    function void build_phase(uvm_phase phase);
        if (!uvm_config_db #(virtual alu_if)::get(this, "", "vif", vif))
            `uvm_fatal("NOVIF", "Interface not found")
    endfunction

    task run_phase(uvm_phase phase);
        alu_transaction tr;
        tr = alu_transaction::type_id::create("tr", this);
        forever begin
            @(posedge vif.clk);
            tr.a = vif.a;
            tr.b = vif.b;
            tr.opcode = vif.opcode;
            tr.expected_result = vif.result;
            tr.expected_zero = vif.zero;
            ap.write(tr);
        end
    endtask
endclass
