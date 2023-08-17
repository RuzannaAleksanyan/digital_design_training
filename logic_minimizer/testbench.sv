module testbench;

 	reg [3:0] in;
  
  	output [0:6] arr;


    initial begin
        $dumpfile("testbench.vcd");
      	$dumpvars(1, testbench);

      for (int i = 0; i < 10; ++i) begin
          in = i;
            #5;
        end
      
      
      $finish;
    end
  
     logic_minimizer uut (
       .x0(in[0]),
       .x1(in[1]),
       .x2(in[2]),
       .x3(in[3]),
       .arr(arr)
    );
  
  always @(in) begin
    	#2;
    $display("Time: %0t | in = %b | out = %b ", $time, in, arr);
  end

endmodule
