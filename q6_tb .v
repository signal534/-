module testbench;
    reg [31:0] A, B;
    wire [32:0] Sum;
    
    // 实例化顶层模块
    q3 uut(
        .A(A),
        .B(B),
        .Sum(Sum)
    );
    
    initial begin
        // 测试用例1
        A = 32'b0111_1111_1111_1111_1111_1111_1111_1111;
        B = 32'b0111_1111_1111_1111_1111_1111_1111_1111;
        #10;
        $display("Test 1:");
        $display("A = %h", A);
        $display("B = %h", B);
        $display("Sum = %h_%h", Sum[32], Sum[31:0]);
        $display("Expected: 0_fffffffe");
        $display("");
        
        // 测试用例2
        A = 32'b1000_0000_0000_0000_0000_0000_0000_0001;
        B = 32'b1000_0000_0000_0000_0000_0000_0000_0001;
        #10;
        $display("Test 2:");
        $display("A = %h", A);
        $display("B = %h", B);
        $display("Sum = %h_%h", Sum[32], Sum[31:0]);
        $display("Expected: 1_00000002");
        $display("");
        
        // 测试用例3
        A = 32'b0101_0000_0101_0000_0101_0000_0101_0000;
        B = 32'b1010_0000_1010_0000_0000_1010_0000_1010;
        #10;
        $display("Test 3:");
        $display("A = %h", A);
        $display("B = %h", B);
        $display("Sum = %h_%h", Sum[32], Sum[31:0]);
        $display("Expected: 1_f0f05a5a");
        $display("");
        
        // 测试用例4：边界条件测试
        A = 32'hFFFFFFFF;  // -1
        B = 32'h00000001;  // +1
        #10;
        $display("Test 4:");
        $display("A = %h (-1)", A);
        $display("B = %h (+1)", B);
        $display("Sum = %h_%h", Sum[32], Sum[31:0]);
        $display("Expected: 1_00000000 (0 with carry)");
        $display("");
        
        $finish;
    end
endmodule