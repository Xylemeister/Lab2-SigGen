module ram2ports #(
    ADDRESS_WIDTH = 9,
    DATA_WIDTH = 8
)(
    input logic clk,
    input logic  wr_en,    //write enable
    input logic rd_en,     //read enable
    input logic [ADDRESS_WIDTH-1:0] wr_addr,
    input logic [ADDRESS_WIDTH-1:0] rd_addr,
    input logic [DATA_WIDTH-1:0] din,
    output logic [DATA_WIDTH-1:0] dout
);

    logic [DATA_WIDTH-1:0] ram_array[2**ADDRESS_WIDTH-1:0];

    always_ff @(posedge clk) begin
        if (wr_en) ram_array[wr_addr]  <= din;
        if (rd_en) dout <= ram_array[rd_addr];
    end






endmodule
