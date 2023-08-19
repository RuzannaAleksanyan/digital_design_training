module sequential_comparator (
    input wire clk,
    input wire reset,
    input wire w1,
    input wire w2,
    output reg z
);

reg [3:0] count;

always @(posedge clk or posedge reset) begin
    if (reset)
        count <= 4'b0;
    else if (w1 == w2)
        count <= count + 1;
    else
        count <= 4'b0;
end

always @(posedge clk) begin
  if (count == 4'b100)
        z <= 1'b1;
    else
        z <= 1'b0;
end

endmodule
