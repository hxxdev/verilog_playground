`include "uvm_macros.svh"
import uvm_pkg::*;

class alu_scoreboard extends uvm_component;
    uvm_analysis_imp #(alu_transaction, alu_scoreboard) analysis_export;

    `uvm_component_utils(alu_scoreboard)

    function new(string name, uvm_component parent);
        super.new(name, parent);
        analysis_export = new("analysis_export", this);
    endfunction

    function void write(alu_transaction tr);
        bit [31:0] ref_result;
        bit        ref_zero;

        case (tr.opcode)
            3'b000: ref_result = tr.a + tr.b;
            3'b001: ref_result = tr.a - tr.b;
            3'b010: ref_result = tr.a & tr.b;
            3'b011: ref_result = tr.a | tr.b;
            3'b100: ref_result = tr.a ^ tr.b;
            3'b101: ref_result = (tr.a < tr.b) ? 1 : 0;
            default: ref_result = 0;
        endcase
        ref_zero = (ref_result == 0);

        if (ref_result !== tr.expected_result || ref_zero !== tr.expected_zero) begin
            `uvm_error("ALU_MISMATCH", $sformatf("Mismatch: expected %0d, got %0d", ref_result, tr.expected_result))
        end else begin
            `uvm_info("ALU_MATCH", $sformatf("Match: %0d == %0d", ref_result, tr.expected_result), UVM_LOW)
        end
    endfunction
endclass
