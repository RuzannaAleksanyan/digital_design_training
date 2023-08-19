module testbench;
  reg [0:3] D;
  reg [1:0] S;
  wire mux_output;
  
  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench);

    for (int i = 0; i < 5; ++i) begin
      D = i; 
      #10;
    end

    $display("some_other_signal : %b", mux_output);

    $finish;
  end
    
  mux4to1 u_mux4to1 (
     .D(D),
     .S(S),
     .Y(mux_output)  
  );
endmodule


