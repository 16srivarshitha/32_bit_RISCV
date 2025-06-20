module program_counter_tb;
    //Inputs
    reg clk;
    reg rst;
    reg [31:0] pc_load_data;
    reg pc_load_en;
    reg pc_inc_en;

    //outputs
    wire [31:0] pc_out;

    //Instantiation
    program_counter uut(
        .clk(clk),
        .rst(rst),
        .pc_load_data(pc_load_data),
        .pc_load_en(pc_load_en),
        .pc_inc_en(pc_inc_en)
        .pc_out(pc_out)
    );

    initial begin
        $display("program_counter.vcd");
        $display(0,program_counter_tb);
    end

    //Clock generation
    always #5 clk = ~clk;

    //test cases
    initial begin
        clk = 0;
        rst = 0;
        pc_load_data = 32'b0;
        pc_load_en = 0;
        pc_inc_en = 0;

        //Testcase 1
        pc_load_en = 0;
        pc_load_data = 32'b0000_0000_0000_0000_0000_0000_0000_1000;
        #10;
        $display("pc_out = %b",pc_out);

        //Testcase 2
        pc_load_en = 1;
        pc_load_data = 32'b0000_0000_0000_0000_0000_0000_0000_1000;
        #10;
        $display("pc_out = %b",pc_out);

        //Testcase 3
        pc_load_en = 0;
        pc_inc_en = 1;
        #10;
        $display("pc_out = %b",pc_out);

        //Testcase 4
        #10;
        $display("pc_out = %b",pc_out);

        //Testcase 5
        rst = 1;
        #10;
        $display("pc_out = %b",pc_out);

        #20;
        $finish;

    end

endmodule