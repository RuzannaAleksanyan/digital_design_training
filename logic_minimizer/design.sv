module logic_minimizer (
    input wire x0,
    input wire x1,
    input wire x2,
  	input wire x3,
  	output [0:6] arr

);

  assign arr[0] = (~x2 & ~x0) | x1 | (x2 & x0) | x3;
  assign arr[1] = (~x1 & ~x0) | (x1 & x0) | ~x2;
  assign arr[2] = ~x1 | x0 | x2;
  assign arr[3] = (~x0 & ~x2) | (x1 & ~x0) | x3 | (~x1 & x0 & x2) | (x1 & ~x3 & ~x2);
  assign arr[4] = (~x2 & ~x0) | (x1 & ~x0);
  assign arr[5] = x3 | (x1 & ~x0 & x2) | (~x1 & x2) | (~x1 & ~x0);
  assign arr[6] = x3 | (~x1 & x2) | (x1 & ~x2 & ~x3) | (x1 & ~x0);
 

endmodule
