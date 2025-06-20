`timescale 1ns/1ps
module register_file_tb;

    //Inputs
    reg clk;
    reg rst;
    reg [5:0] read_addr1;
    reg [5:0] read_addr2;
    reg [5:0] write_addr;
    reg [31:0] write_data;
    reg write_enable;

    //Outputs
    wire [31:0] read_data1;
    wire [31:0] read_data2;

    register_file uut(
        .clk(clk),
        .rst(rst),
        .read_addr1(read_addr1),
        .read_addr2(read_addr2),
        .write_addr(write_addr),
        .write_enable(write_enable),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    initial begin
        $dumpfile("register_file.vcd");
        $dumpfile(0,register_file_tb);
    end

    //Clock generation
    always #5 clk = ~clk;

    //testcases
    initial begin
        //Initialise
        clk = 0;
        rst = 0;
        read_addr1 = 5'b00000;
        read_addr1 = 5'b00000;
        write_addr = 5'b00000;
        write_enable = 0;


        //Testcase 1
        read_addr1 = 5'b00110;
        read_addr2 = 5'b00001:
        #10;
        $display("read_addr1 = %b,read_addr2 = %b",read_addr1,read_addr2);
        $display("read_data1 = %b,read_data2 = %b",read_data1,read_data2);

        //Testcase 2
        rst = 1;
        write_enable = 1;
        write_data = 32'b0000_0000_0000_0000_0000_0000_0000_1000;
        write_addr = 5'b00000;
        read_addr1 = 5'b00000;
        #10;
        $display("read_addr1 = %b,read_addr2 = %b",read_addr1, read_addr2);
        $display("read_data1 = %b, read_data2 = %b",read_data1,read_data2);

        //Testcase 3
        rst = 1;
        write_enable = 1;
        write_data = 32'b0000_0000_0000_0000_0000_0000_0000_1000;
        write_addr = 5'b00010;
        read_addr1 = 5'b00010;
        #10;
        $display("read_addr1 = %b,read_addr2 = %b",read_addr1, read_addr2);
        $display("read_data1 = %b, read_data2 = %b",read_data1,read_data2);

        //Testcase 4
        rst = 0;
        read_addr1 = 5'b00100;
        #10;
        $display("read_addr1 = %b",read_addr1);
        $display("read_data1 = %b",read_data1);

        //Testcase 5
        write_enable = 1;
        write_data = 32'b0000_0000_0000_0000_0000_0000_0001_1000;
        write_addr1 = 5'b00001;
        read_addr1 = 5'b00001;
        #10;
        $display("read_addr1 = %b",read_addr1);
        $display("read_data1 = %b",read_data1);

    end

endmodule