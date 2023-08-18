module testbench;
  reg [1:0] W;
  reg En;
  reg y0, y1, y2, y3;
  
  initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(1, testbench);

    W = 2'b00;
    En = 0;
    
    #5;
    
    W = 2'b10;
    En = 1;
    #10;
    $display("Time: %0t | y0 = %b | y1 = %b | y2 = %b | y3 = %b", $time, y0, y1, y2, y3);

    $finish;
  end
  
  dec2to4 u_dec2to4(
    .W(W),
    .En(En),
    .y0(y0),
    .y1(y1),
    .y2(y2),
    .y3(y3)
  );
  
endmodule
