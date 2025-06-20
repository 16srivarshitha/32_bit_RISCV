module instruction_fetch_tb;
    //Inputs
    reg clk;
    reg rst;
    reg pc_src;
    reg [31:0] branch_target;
    reg stall;

    //Outputs
    wire [31:0] Instruction;
    wire [31:0] pc_out;

    //Instantiate fetch
    instruction_fetch uut(
        .clk(clk),
        .rst(rst),
        .pc_src(pc_src),
        .branch_target(branch_target),
        .stall(stall),
        .Instruction(Instruction),
        .pc_out(pc_out)
    );

    initial begin
        $dumpfile("Instruction_fetch.vcd");
        $dumpvars(0,instruction_fetch_tb);
    end

    //Clock generation
    always #5 clk = ~clk;

    //testcases
    initial begin
        clk = 0;
        rst = 0;
        pc_src = 0;
        branch_target = 32'b0;
        stall = 0;

        //Testcase 1
        pc_src = 0;
        branch_target = 32'b0000_0000_0000_0000_0000_0000_0000_1000;
        stall = 0;
        #10;
        $display("pc_out = %b,Instruction = %b",pc_out,Instruction);

        //Testcase 2
        pc_src = 1;
        branch_target = 32'b0000_0000_0000_0000_0000_0000_1000_0011;
        #10;
        $display("pc_out = %b,Instruction = %b",pc_out,Instruction);

        //Testcase 3
        pc_src = 0;
        #10;
        $display("pc_out = %b,Instruction = %b",pc_out,Instruction);

        //Testcase 4
        #10;
        $display("pc_out = %b,Instruction = %b",pc_out,Instruction);

        #20;
        $finish;
    end

endmodule