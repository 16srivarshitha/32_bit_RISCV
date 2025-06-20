module register_file(
    input wire clk,
    input wire rst,

    input wire [4:0] read_addr1,
    input wire [4:0] read_addr2,
    input wire [4:0] write_addr,
    input wire [31:0] write_data,
    input wire write_enable,

    output reg [31:0] read_data1,
    output reg [31:0] read_data2
);

    //32 general purpose registers 8-bit registers
    //ABI
    reg [31:0] registers [0:31];

    // RISC-V ABI register names
    localparam zero = 5'd0;
    localparam ra   = 5'd1;
    localparam sp   = 5'd2;
    localparam gp   = 5'd3;
    localparam tp   = 5'd4;
    localparam t0   = 5'd5;
    localparam t1   = 5'd6;
    localparam t2   = 5'd7;
    localparam s0   = 5'd8;
    localparam fp   = 5'd8;  // same as s0
    localparam s1   = 5'd9;
    localparam a0   = 5'd10;
    localparam a1   = 5'd11;
    localparam a2   = 5'd12;
    localparam a3   = 5'd13;
    localparam a4   = 5'd14;
    localparam a5   = 5'd15;
    localparam a6   = 5'd16;
    localparam a7   = 5'd17;
    localparam s2   = 5'd18;
    localparam s3   = 5'd19;
    localparam s4   = 5'd20;
    localparam s5   = 5'd21;
    localparam s6   = 5'd22;
    localparam s7   = 5'd23;
    localparam s8   = 5'd24;
    localparam s9   = 5'd25;
    localparam s10  = 5'd26;
    localparam s11  = 5'd27;
    localparam t3   = 5'd28;
    localparam t4   = 5'd29;
    localparam t5   = 5'd30;
    localparam t6   = 5'd31;

    //Read logic
    always@(*) begin
        read_data1 = (read_addr1 < 32) ? registers[read_addr1] : 32'b0;
        read_data2 = (read_addr2 < 32) ? registers[read_addr2] : 32'b0;
    end

    integer i;
    always @(posedge clk) begin
        if(rst) begin
            for(i=0;i<32;i++)
                registers[i] <= 32'b0;
        end
        else if (write_enable && (write_addr<32)&&(write_addr>0)) begin
                registers[write_addr] <= write_data;
        end
    end



endmodule
