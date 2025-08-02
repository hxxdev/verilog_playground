`include "uvm_macros.svh"
import uvm_pkg::*;

class alu_env extends uvm_env;
    alu_driver    drv;
    alu_monitor   mon;
    alu_scoreboard sb;

    `uvm_component_utils(alu_env)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        drv = alu_driver::type_id::create("drv", this);
        mon = alu_monitor::type_id::create("mon", this);
        sb  = alu_scoreboard::type_id::create("sb", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        mon.ap.connect(sb.analysis_export);
    endfunction
endclass
