module modulo_12_up_counter (
  resetn,
  clock,
  res
);
  
  input resetn;
  input clock;
  output reg [3:0] res;
  
  always @(posedge clock) begin
    if (!resetn) begin
      res <= 0;
    end else if (res < 11) begin
      res <= res + 1'b1;
    end else begin
      res = 'd0;
    end
  end
  
endmodule
