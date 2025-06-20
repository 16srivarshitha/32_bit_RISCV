module Instruction_memory(
    input [31:0] PC,
    output wire [31:0] Instruction

);

    reg [31:0] mem_array [0:255];

    initial begin
        $readmemb("program.bin",mem_array);
    end
    assign instruction = mem_array[PC[9:2]];


endmodule