module counter (
    input  logic       clk,   // Clock input
    input  logic       rst,   // Active-high reset
    input  logic       en,    // Enable
    output logic [3:0] count  // 4-bit output
);

  // Counter logic
  always_ff @(posedge clk) begin
    if (rst) begin
      count <= 4'd0;
    end else if (en) begin
      count <= count + 1;
    end
  end

endmodule
