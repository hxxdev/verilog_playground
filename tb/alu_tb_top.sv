`include "uvm_macros.svh"
import uvm_pkg::*;
import alu_tb_pkg::*;

module alu_tb_top;
    logic clk = 0;
    always #5 clk = ~clk;

    alu_if alu_if_inst(clk);

    alu dut (
        .a      (alu_if_inst.a),
        .b      (alu_if_inst.b),
        .opcode (alu_if_inst.opcode),
        .result (alu_if_inst.result),
        .zero   (alu_if_inst.zero)
    );

    initial begin
        uvm_config_db #(virtual alu_if)::set(null, "*", "vif", alu_if_inst);
        run_test("alu_test");
    end
endmodule
