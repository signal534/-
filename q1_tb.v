module tb_q1;
    reg [31:0] test_data;
    wire [5:0] result;
    reg [31:0] data_in;    // 32位寄存器，匹配输入端口
    wire [5:0] data_out;   // 6位线网，匹配输出端口
    
    q1 uut (
        .data_in (test_data),
        .data_out (result)
    );
    
    initial begin
        // 测试用例
        test_data = 32'b00000000000000000000000000000000; #10; // 全0
        test_data = 32'b10000000000000000000000000000000; #10; // 最高位
        test_data = 32'b00000000000000000000000000000001; #10; // 最低位
        test_data = 32'b00010000000000000000000000000000; #10; // 第28位
        test_data = 32'b00000000000000000000000000000010; #10; // 第30位
        test_data = 32'b00100000000000000000000000000000; #10; // 第29位
        test_data = 32'b00000000000000001000000000000000; #10; // 第16位
        
        $display("测试完成");
        $finish;
    end
    
    initial begin
        $monitor("时间=%0t, 输入=%32b, 位置=%0d", $time, test_data, result);
    end
endmodule