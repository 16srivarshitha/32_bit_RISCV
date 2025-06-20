module instruction_fetch(
    input wire clk,
    input wire rst,
    input wire pc_src, //if 1, branch target, if 0, increment 
    input wire [31:0] branch_target,
    input wire stall,

    output wire [31:0] Instruction,
    output wire [31:0] pc_out

);

    //Internal wire
    wire [31:0] pc;

    //Instantiate program counter
    program_counter pc_inst(
        .clk(clk),
        .rst(rst),
        .pc_load_data(pc_load_data),
        .pc_load_en(pc_load_en),
        .pc_inc_en(pc_inc_en)
        .pc_out(pc)
    );

    //Instantiate Instruction memory
    Instruction_memory inst(
        .PC(PC),
        .Instruction(Instruction)
    );

    //assign internal wire PC
    assign pc = pc_out;
    assign Instruction = Instruction;


endmodule