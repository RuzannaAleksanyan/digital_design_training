module t_flipflop_with_clear (
    input [2:0] clk,
    input [2:0] clr,
    input [2:0] t,
    output reg q
);

    always @(posedge clk or posedge clr) begin
        if (clr)
            q <= 1'b0;
        else if (t)
            q <= ~q;
    end

endmodule
