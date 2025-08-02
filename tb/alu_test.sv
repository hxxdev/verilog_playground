`include "uvm_macros.svh"
import uvm_pkg::*;

class alu_test extends uvm_test;
    alu_env env;

    `uvm_component_utils(alu_test)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        env = alu_env::type_id::create("env", this);
    endfunction
endclass
