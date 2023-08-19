module testbench;

  reg clk;
  reg reset;
  reg w1;
  reg w2;
  wire z;

  sequential_comparator uut (
      .clk(clk),
      .reset(reset),
      .w1(w1),
      .w2(w2),
      .z(z)
  );

  always begin
      #5 clk = ~clk;
  end
  
  initial begin
    $dumpfile("problem5_20.vcd");
    $dumpvars(1, testbench);
  end

  initial begin
    
      clk = 0;
      reset = 0;
      w1 = 0;
      w2 = 0;

      #10;
      w1 = 0; #10;
      w1 = 1; #10;
      w1 = 1; #10;
      w1 = 0; #10;
      $display("Test Case 1: z = %b", z);

      reset = 1; #10;
      reset = 0; #10;
      w1 = 1; #10;
      w1 = 1; #10;
      w1 = 1; #10;
      w1 = 0; #10;
      $display("Test Case 2: z = %b", z);

      w1 = 0; #10;
      w1 = 0; #10;
      w1 = 1; #10;
      w1 = 1; #10;
      $display("Test Case 3: z = %b", z);

      $finish;
  end

endmodule
