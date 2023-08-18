module testbench (); 
  reg  reset_n;
  reg  clk;
  reg  w = 0;
  wire [2:0] curr_state;
  reg [3:0] i = 0;
  
  localparam [15:0] in_vec = 16'b0001001110011110;
  
  initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(1, testbench);
  end
  
  initial begin
    reset_n <= 0;
    #22;  
    reset_n <= 1;
  end
  
  initial begin
    clk <= 0;
    forever #5 clk <= ~clk;
  end

  initial begin
    #1000;
    $finish();
  end
  
  always @(posedge clk) begin
    if (i < 16) begin
      i <= i + 1'b1;
    end else begin
      i <= 0;
    end
    
    w <= in_vec[i];
  end
  
  foo u_foo (
    .reset_n    (reset_n),
    .clk        (clk),
    .w          (w),
    .curr_state (curr_state)
  );
  
endmodule
