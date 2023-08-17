module testbench;
    reg x1;
    reg x2;
    reg x3;
  
    output wire f;

    initial begin
        $dumpfile("testbench.vcd");
      	$dumpvars(1, testbench);

        for (int i = 0; i < 8; ++i) begin
            {x1, x2, x3} = i;
            #5;
        end
      
      
      $finish;
    end
  
     minimized_function uut (
       .f(f),
       .x1(x1),
       .x2(x2),
       .x3(x3)
    );
  
  always @(f)
      $display("Time: %0t | x1: %b | x2: %b | x3: %b | f: %b", $time, x1, x2, x3, f);

endmodule
