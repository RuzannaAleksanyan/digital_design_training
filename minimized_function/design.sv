module minimized_function (
    input wire x1,
    input wire x2,
    input wire x3,
    output wire f
);

  assign f = (x3 & ~x1) | (x3 & x2) | (~x1 & x2) | (x1 & ~x2 & ~x3);

endmodule
