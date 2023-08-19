module testbench (); 
  reg clock;
  reg resetn;
  wire [3:0] res;
  
  initial begin
    $dumpfile("problem5_20.vcd");
    $dumpvars(1, testbench);
  end
  
  initial begin
    clock <= 0;
    forever #5 clock <= ~clock;
  end

  initial begin
    resetn <= 0;
    #22;  
    resetn <= 1;
  end
  
  initial begin
    #1000;
    $finish();
  end
  
  modulo_12_up_counter problem5_20_t (
    .resetn (resetn),
    .clock (clock),
    .res(res)
  );
  
endmodule
