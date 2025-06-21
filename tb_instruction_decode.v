module instruction_decode_tb;
    //inputs
    reg clk;
    reg [31:0] instruction;

    //outputs
    wire [6:0] opcode;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [4:0] rd;
    wire [6:0] funct7;
    wire [2:0] funct3;
    wire [11:0] imm12;
    wire [20:0] imm21;

    //Instantiate
    instruction_decode uut(
        .clk(clk),
        .instruction(instruction),
        .opcode(opcode),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .funct7(funct7),
        .funct3(funct3),
        .imm12(imm12),
        .imm21(imm21)
    );

    initial begin
        $dumpfile("instruction_decode.vcd");
        $dumpvars(0,instruction_decode_tb);
    end

    //clock generation
    always #5 clk = ~clk;

    //testcases
    initial begin
        //Initialisation
        clk = 0;
        instruction = 32'b0;

        //R-type
        //Testcase 1: add x3,x5,x2;
        instruction = 32'b0000_0000_0010_0010_1000_0001_1011_0011; 
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,rs2 = %b,funct7 = %b,funct3 = %b",opcode,rd,rs1,rs2,funct7,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 2: sub x2, x6, x1;
        instruction = 32'b0100_0000_0001_0011_0000_0001_0011_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,rs2 = %b,funct7 = %b,funct3 = %b",opcode,rd,rs1,rs2,funct7,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 4: sll x4,x2,x1;
        instruction = 32'b0000_0000_0001_0001_0001_0010_0011_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,rs2 = %b,funct7 = %b,funct3 = %b",opcode,rd,rs1,rs2,funct7,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 5: slt x3,x9,x4;
        instruction = 32'b0000_0000_0100_0100_1010_0001_1011_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,rs2 = %b,funct7 = %b,funct3 = %b",opcode,rd,rs1,rs2,funct7,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 6: sltu x3,x9,x4;
        instruction = 32'b0000_0000_0100_0100_1011_0001_1011_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,rs2 = %b,funct7 = %b,funct3 = %b",opcode,rd,rs1,rs2,funct7,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 7: xor x2,x7,x5;
        instruction = 32'b0000_0000_0101_0011_1100_0001_0011_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,rs2 = %b,funct7 = %b,funct3 = %b",opcode,rd,rs1,rs2,funct7,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 8: srl x4,x9,x3;
        instruction = 32'b0000_0000_0011_0100_1101_0010_0011_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,rs2 = %b,funct7 = %b,funct3 = %b",opcode,rd,rs1,rs2,funct7,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 9: sra x4,x9,x3;
        instruction = 32'b0100_0000_0011_0100_1101_0010_0011_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,rs2 = %b,funct7 = %b,funct3 = %b",opcode,rd,rs1,rs2,funct7,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 10: or x7,x3,x2;
        instruction = 32'b0000_0000_0010_0001_1110_0011_1011_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,rs2 = %b,funct7 = %b,funct3 = %b",opcode,rd,rs1,rs2,funct7,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 11: and x7,x3,x2;
        instruction = 32'b0000_0000_0010_0001_1111_0011_1011_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,rs2 = %b,funct7 = %b,funct3 = %b",opcode,rd,rs1,rs2,funct7,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //I-type Arithmetic
        //Testcase 12: addi x3,x5,2;
        instruction = 32'b0000_0000_0010_0010_1000_0001_1001_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,imm12 = %b,funct3 = %b",opcode,rd,rs1,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 13: slti x3,x15,100;
        instruction = 32'b0000_0110_0100_0011_1010_0001_1001_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,imm12 = %b,funct3 = %b",opcode,rd,rs1,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 14: sltiu x3, x15, 100;
        instruction = 32'b0000_0110_0100_0011_1011_0001_1001_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,imm12 = %b,funct3 = %b",opcode,rd,rs1,im12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 15: xori x7,x4,33;
        instruction = 32'b0000_0010_0001_0010_0100_0011_1001_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,imm12 = %b,funct3 = %b",opcode,rd,rs1,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 16: ori x7,x4,33;
        instruction = 32'b0000_0010_0001_0010_0110_0011_1001_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,imm12 = %b,funct3 = %b",opcode,rd,rs1,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 17: andi x7,x4,33;
        instruction = 32'b0000_0010_0001_0010_0111_0011_1001_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,imm12 = %b,funct3 = %b",opcode,rd,rs1,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 18: slli x7,x4,3;
        instruction = 32'b0000_0000_0011_0010_0001_0011_1001_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,imm12 = %b,funct3 = %b",opcode,rd,rs1,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 19: srli x4,x9,21;
        instruction = 32'b0000_0001_0101_0100_0101_1101_0001_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,imm12 = %b,funct3 = %b",opcode,rd,rs1,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 20: srai x4,x9,21;
        instruction = 32'b0100_0001_0101_0100_1101_0010_0001_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,imm12 = %b,funct3 = %b",opcode,rd,rs1,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //I-type load
        //Testcase 21: lb x5, 8(x3);
        instruction = 32'b0000_0000_1000_0001_1000_0010_1000_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,imm12 = %b,funct3 = %b",opcode,rd,rs1,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 22: lh x7, 2(x2);
        instruction = 32'b0000_0000_0010_0001_0001_0011_1000_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,imm12 = %b,funct3 = %b",opcode,rd,rs1,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 23: lw x7, 4(x2);
        instruction = 32'b0000_0000_0010_0001_0010_0011_1000_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,imm12 = %b,funct3 = %b",opcode,rd,rs1,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 24: lbu x7, 8(x3);
        instruction = 32'b0000_0000_1000_0001_1100_0011_1000_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,imm12 = %b,funct3 = %b",opcode,rd,rs1,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 25: lhu x7, 2(x2);
        instruction = 32'b0000_0000_0010_0001_0101_0011_1000_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,imm12 = %b,funct3 = %b",opcode,rd,rs1,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //I-type - Jump and Link register
        //Testcase 26: jalr x7, 8(x1);
        instruction = 32'b0000_0000_1000_0000_1000_0011_1110_0111;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,imm12 = %b,funct3 = %b",opcode,rd,rs1,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //I-type - System
        //Testcase 27: ecall x6, 0(x1);
        instruction = 32'b0000_0000_0000_0000_10000_0011_0111_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,imm12 = %b,funct3 = %b",opcode,rd,rs1,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 28: ebreak x6, 1(x1);
        instruction = 32'b0000_0000_0001_0000_1000_0011_0111_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,rs1 = %b,imm12 = %b,funct3 = %b",opcode,rd,rs1,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //S-Type instruction
        //Testcase 29: sb x7, 8(x2);
        instruction = 32'b0000_0000_0111_0001_0010_0100_0010_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rs2 = %b,rs1 = %b,imm12 = %b,funct3 = %b",opcode,rs2,rs1,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 30: sh x7, 8(x2);
        instruction = 32'b0000_0000_0111_0001_0001_0100_0010_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rs2 = %b,rs1 = %b,imm12 = %b,funct3 = %b",opcode,rs2,rs1,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 31: sw x7, 8(x2);
        instruction = 32'b0000_0000_0111_0001_0010_0100_0010_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rs2 = %b,rs1 = %b,imm12 = %b,funct3 = %b",opcode,rs2,rs1,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //B-type instructions
        //Testcase 32: beq x4, x5, 33;
        instruction = 32'b0000_0010_0101_0010_0000_0001_0110_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rs1 = %b,rs2 = %b,imm12 = %b,funct3 = %b",opcode,rs1,rs2,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 33: bne x4, x5, 33;
        instruction = 32'b0000_0010_0101_0010_0001_0001_0110_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rs1 = %b,rs2 = %b,imm12 = %b,funct3 = %b",opcode,rs1,rs2,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 34: blt x4, x5, 33;
        instruction = 32'b0000_0010_0101_0010_0100_0001_0110_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rs1 = %b,rs2 = %b,imm12 = %b,funct3 = %b",opcode,rs1,rs2,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 35: bgt x4, x5, 33;
        instruction = 32'b000_0010_0101_0010_0110_0001_0110_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rs1 = %b,rs2 = %b,imm12 = %b,funct3 = %b",opcode,rs1,rs2,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 36: bltu x4, x4, 33;
        instruction = 32'b0000_0010_0101_0010_0110_0001_0110_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rs1 = %b,rs2 = %b,imm12 = %b,funct3 = %b",opcode,rs1,rs2,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 37: bgeu x4, x5, 33;
        instruction = 32'b0000_0010_0101_0010_0111_0001_0110_0011;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rs1 = %b,rs2 = %b,imm12 = %b,funct3 = %b",opcode,rs1,rs2,imm12,funct3);
        $display("----------------------------------------------------------------------------------------------------------");

        //U-type instructions
        //Testcase 38: lui x7, 255
        instruction = 32'b0000_0000_0000_0111_1111_0011_1011_0111;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,imm21 = %b",opcode,rd,imm21);
        $display("----------------------------------------------------------------------------------------------------------");

        //Testcase 39: auipac x7, 255
        instruction = 32'b0000_0000_0000_0111_1111_0011_1001_0111;
        #10;
        $display("Instruction = %b",instruction);
        $display("Opcode = %b, rd = %b,imm21 = %b",opcode,rd,imm21);
        $display("----------------------------------------------------------------------------------------------------------");

        #20;
        $finish;


    end
endmodule