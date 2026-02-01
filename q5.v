module circular_shift(
    input [31:0] in_data,   // 32位输入数据
    input [4:0] shift_amt,  // 位移值，最大可以是31，使用5位来表示
    input dir,               // 方向控制：1为左移，0为右移
    output reg [31:0] out_data  // 32位输出数据
);

always @(*) begin
    if (dir) begin  // 左移
        out_data = (in_data << shift_amt) | (in_data >> (32 - shift_amt));
    end else begin  // 右移
        out_data = (in_data >> shift_amt) | (in_data << (32 - shift_amt));
    end
end

endmodule
