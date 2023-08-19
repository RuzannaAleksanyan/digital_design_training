module dec2to4 (W, En, Y);
    input [1:0] W;
    input En;
    output reg [0:3] Y;

    always @(W, En)
        case ({En, W})
            2'b00: Y = 4'b1000;
            2'b01: Y = 4'b0100;
            2'b10: Y = 4'b0010;
            2'b11: Y = 4'b0001;
            default: Y = 4'b0000;
        endcase
endmodule

module mux4to1 (D, S, Y);
    input [0:3] D;
    input [1:0] S;
    output reg Y;

    wire [0:3] dec2to4_Y;
    wire En = 1'b1;

    dec2to4 U0 (.W(S), .En(En), .Y(dec2to4_Y));

    always @(S, D) begin
        case (S)
            2'b00: Y = D[0];
            2'b01: Y = D[1];
            2'b10: Y = D[2];
            2'b11: Y = D[3];
            default: Y = 1'b0;
        endcase
    end

    wire some_other_signal = (D[0] & dec2to4_Y[0]) |
                             (D[1] & dec2to4_Y[1]) |
                             (D[2] & dec2to4_Y[2]) |
                             (D[3] & dec2to4_Y[3]);

endmodule

