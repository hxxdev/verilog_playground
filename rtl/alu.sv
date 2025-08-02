module alu (
    input  logic [31:0] a,
    input  logic [31:0] b,
    input  logic [2:0]  opcode,
    output logic [31:0] result,
    output logic        zero
);
    logic [3:0] alu_ctrl;

    // Instantiate decoder and core
    alu_decoder u_decoder (
        .opcode   (opcode),
        .alu_ctrl (alu_ctrl)
    );

    alu_core u_core (
        .alu_ctrl (alu_ctrl),
        .a        (a),
        .b        (b),
        .result   (result),
        .zero     (zero)
    );
endmodule
