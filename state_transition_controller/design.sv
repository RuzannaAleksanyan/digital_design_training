module foo(
  reset_n,
  clk,
  w,
  curr_state
);
  input reset_n;
  input clk;
  input w;
  output reg [2:0] curr_state;
  
  reg [2:0] next_state;
  
  always @(negedge reset_n or posedge clk) begin
    if (~reset_n) begin
      curr_state <= 3'b000;
    end else if (w) begin
      curr_state <= next_state;
    end
  end
  
  always @(w, curr_state) begin
    if (curr_state == 3'b101) begin
      next_state = 3'b000;
    end else begin
      next_state[0] = ~curr_state[0];
      next_state[1] = curr_state[0] ^ curr_state[1];
      next_state[2] = (curr_state[0] & curr_state[1]) ^ curr_state[2];
    end
  end
  
endmodule
