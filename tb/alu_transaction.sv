`include "uvm_macros.svh"
import uvm_pkg::*;

class alu_transaction extends uvm_sequence_item;
    rand bit [31:0] a, b;
    rand bit [2:0] opcode;
    bit [31:0] expected_result;
    bit        expected_zero;

    `uvm_object_utils(alu_transaction)

    function new(string name = "alu_transaction");
        super.new(name);
    endfunction

    function void do_copy(uvm_object rhs);
        alu_transaction tx;
        if (!$cast(tx, rhs)) `uvm_fatal("COPY", "Type mismatch")
        a = tx.a;
        b = tx.b;
        opcode = tx.opcode;
    endfunction
endclass
