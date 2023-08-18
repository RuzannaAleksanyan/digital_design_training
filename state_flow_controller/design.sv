module fsm(
  input reset_n,
  input in,
  input clk,
  output out
);
  
  localparam STATE_A = 3'b000;
  localparam STATE_B = 3'b001;
  localparam STATE_C = 3'b010;
  localparam STATE_D = 3'b011;
  localparam STATE_E = 3'b100;
  localparam STATE_F = 3'b101;
  
  reg [3:0] current_state;
  reg [3:0] next_state;
  
  always @(negedge reset_n or posedge clk) begin
    if (!reset_n) begin
      current_state <= STATE_A;
    end else begin
      current_state <= next_state;
    end
  end
  
  always @(in, current_state) begin
    if (in) begin
      case (current_state)
        STATE_A: next_state = STATE_B;
        STATE_B: next_state = STATE_C;
        STATE_C: next_state = STATE_D;
        STATE_D: next_state = STATE_D;
        STATE_E: next_state = STATE_B;
        STATE_F: next_state = STATE_B;
        default: next_state = STATE_A;
      endcase
    end else begin
      case (current_state)
        STATE_A: next_state = STATE_A;
        STATE_B: next_state = STATE_E;
        STATE_C: next_state = STATE_E;
        STATE_D: next_state = STATE_E;
        STATE_E: next_state = STATE_F;
        STATE_F: next_state = STATE_A;
        default: next_state = STATE_A;
      endcase
    end
  end
  
  assign out = in & ((current_state == STATE_D) | (current_state == STATE_F));
  
endmodule
