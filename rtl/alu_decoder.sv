module alu_decoder (
    input  logic [2:0] opcode,
    output logic [3:0] alu_ctrl
);
    // Opcode to ALU control signal mapping
    always_comb begin
        case (opcode)
            3'b000: alu_ctrl = 4'b0000; // ADD
            3'b001: alu_ctrl = 4'b0001; // SUB
            3'b010: alu_ctrl = 4'b0010; // AND
            3'b011: alu_ctrl = 4'b0011; // OR
            3'b100: alu_ctrl = 4'b0100; // XOR
            3'b101: alu_ctrl = 4'b0101; // SLT (set less than)
            default: alu_ctrl = 4'b1111; // NOP
        endcase
    end
endmodule
