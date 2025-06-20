module Instruction_decode(
    input wire clk,
    input wire [31:0] instruction,

    output reg [6:0] opcode,
    output reg [4:0] rs1,
    output reg [4:0] rs2,
    output reg [4:0] rd,
    output reg [6:0] funct7,
    output reg [6:0] funct3,
    output reg [11:0] imm12,
    output reg [20:0] imm21

);

    always @(*) begin
        opcode <= instruction[6:0];

        case(opcode)
        7'b0110011: begin           //R-type
            funct7 <= instruction[31:25];
            funct3 <= instruction[14:12];
            rs1 <= instruction[19:15];
            rs2 <= instruction[24:20];
            rd <= instruction[11:7];
        end
        7'b0010011: begin           //I-type arithemetic
            rd <= instruction[11:7];
            rs1 <= instruction[19:15];
            funct3 <= instruction[14:12];
            imm12 <= instruction[31:20];
        end
        7'b0000011: begin           //I-type load
            rd <= instruction[11:7];
            rs1 <= instruction[19:15];
            funct3 <= instruction[14:12];
            imm12 <= instruction[31:20];
        end
        7'b1100111: begin           //I-type Jump
            rd <= instruction[11:7];
            rs1 <= instruction[19:15];
            funct3 <= instruction[14:12];
            imm12 <= instruction[31:20];
        end
        7'b1110011: begin           //I-type System
            rd <= instruction[11:7];
            rs1 <= instruction[19:15];
            funct3 <= instruction[14:12];
            imm12 <= instruction[31:20];
        end
        7'b0100011: begin           //S-type
            imm12[4:0] <= instruction[11:7];
            funct3 <= instruction[14:12];
            rs1 <= instruction[19:15];
            rs2 <= instruction[24:20];
            imm12[11:5] <= instruction[31:25];
        end
        7'b1100011: begin           //B-type
            funct3 <= instruction[14:12];
            rs1 <= instruction[19:15];
            rs2 <= instruction[24:20];
            imm12[11] <= instruction[7];
            imm12[4:1] <= instruction[11:8];
            imm12[10:5] <= instruction[30:25];
            imm12[12] <= instruction[31];
        end
        7'b0110111: begin            //U-type
            imm12 <= instruction[31:12];
            rd <= instruction[11:7];
        end
        7'b110111: begin            //J -type
            imm21[20] <= instruction[31];           // Sign bit
            imm21[19:12] <= instruction[19:12];     // Bits 19-12
            imm21[11] <= instruction[20];           // Bit 11  
            imm21[10:1] <= instruction[30:21];      // Bits 10-1
            imm21[0] <= 1'b0;                       // Always 0
            rd <= instruction[11:7];

        end
        endcase
    end
endmodule