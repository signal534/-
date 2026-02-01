module q3 (
    input  [31:0] A,
    input  [31:0] B,
    output [32:0] Sum
);

    wire [31:0] G, P;            //  产生信号 / 传播信号
    wire [7:0]  Gg, Pg;          // 组产生信号 / 传播信号 (4个部分)
    wire [8:0]  Cg;              // 组进位信号(4个部分)
    wire [32:0] C;               // 总进位信号

    // 传播信号 / 产生信号
    assign G = A & B;
    assign P = A ^ B;
    assign Cg[0] = 1'b0;  // 第1组进位信号 = 0

    // -------- 8组产生信号/传播信号 --------
    //定义genvar变量
   genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : GROUP
            wire [3:0] Gi = G[i*4+3 : i*4];
            wire [3:0] Pi = P[i*4+3 : i*4];

            assign Gg[i] = Gi[3] |
                           (Pi[3] & Gi[2]) |
                           (Pi[3] & Pi[2] & Gi[1]) |
                           (Pi[3] & Pi[2] & Pi[1] & Gi[0]);

            assign Pg[i] = Pi[3] & Pi[2] & Pi[1] & Pi[0];
        end
    endgenerate

    // -------- 8组进位信号--------
    generate
        for (i = 1; i < 8; i = i + 1) begin : GROUP_CARRY
            assign Cg[i] = Gg[i-1] | (Pg[i-1] & Cg[i-1]);
        end
    endgenerate

    // -------- 总进位信号 --------
    generate
        for (i = 0; i < 32; i = i + 1) begin : BIT_CARRY
            if (i % 4 == 0) begin
                assign C[i] = Cg[i/4];
            end else begin
                assign C[i] = G[i-1] | (P[i-1] & C[i-1]);
            end
        end
    endgenerate

    // 最高位总进位信号
    assign C[32] = G[31] | (P[31] & C[31]);

    // 和生成
    assign Sum = {C[32], (P ^ C[31:0])};

endmodule
