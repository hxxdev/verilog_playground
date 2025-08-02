`include "uvm_macros.svh"
import uvm_pkg::*;

interface alu_if(input logic clk);
    logic [31:0] a;
    logic [31:0] b;
    logic [2:0]  opcode;
    logic [31:0] result;
    logic        zero;
endinterface
