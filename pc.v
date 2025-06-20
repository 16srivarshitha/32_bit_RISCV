module program_counter(
    input wire clk,
    inout wire rst,

    input wire [31:0] pc_load_data,
    input wire pc_load_en,
    input wire pc_inc_en,

    output reg [31:0] pc_out
);

    always @(posedge clk or posedge rst) begin
        if(rst)
            pc_out <= 32'b0;
        else if (pc_load_en)
            pc_out <= pc_load_data;
        else if (pc_inc_en)
            pc_out <= pc_out + 4;
    end

endmodule