module tb_t_flipflop_with_clear;

    reg [2:0] clk;
    reg [2:0] clr;
    reg [2:0] t;
    reg q;

    t_flipflop_with_clear dut (
        .clk(clk),
        .clr(clr),
        .t(t),
        .q(q)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin
        $dumpfile("tb_t_flipflop_with_clear.vcd");
        $dumpvars(0, tb_t_flipflop_with_clear);

        clk = 3'b000;
        clr = 3'b000;
        t = 3'b000;

        #10 clr = 3'b001;
        #10 clr = 3'b000;

        t = 3'b001;
        #10;
        t = 3'b000;
        #10;
        t = 3'b001;
        #10;
        t = 3'b000;
        #10;

        $finish;
    end

endmodule
