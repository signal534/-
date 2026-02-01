module test_circular_shift();
  reg [31:0] in_data;
  reg [4:0] shift_amt;
  reg dir;
  wire [31:0] out_data;

  circular_shift uut (
                   .in_data(in_data),
                   .shift_amt(shift_amt),
                   .dir(dir),
                   .out_data(out_data)
                 );

  initial
  begin
    // 测试例子 1：左移 10 位
    in_data = 32'b00011000101000000000000000000000;
    shift_amt = 10;
    dir = 1;  // 左移
    #10;
    $display("Test 1: %b", out_data);  // 输出：10000000000000000000000001100010

    // 测试例子 2：右移 20 位
    in_data = 32'b00000000111111110000000000000011;
    shift_amt = 20;
    dir = 0;  // 右移
    #10;
    $display("Test 2: %b", out_data);  // 输出：11110000000000000011000000001111
  end
endmodule
