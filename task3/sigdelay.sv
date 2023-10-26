module sigdelay #(
    parameter A_WIDTH = 9,
              D_WIDTH = 8
)(
    input logic clk,
    input logic rst,
    input logic wr,
    input logic rd,
    input logic [A_WIDTH-1:0] offset,
    input logic  [D_WIDTH-1:0] mic_signal,
    output logic [D_WIDTH-1:0] delayed_signal
);

logic [A_WIDTH-1:0] write;
logic [A_WIDTH-1:0] read;

counter myCounter(
    .clk(clk),
    .rst(rst),
    .incr(offset),
    .count1(write),
    .count2(read)
);

ram2ports Ram(
    .clk (clk),
    .wr_en(wr),
    .rd_en(rd),
    .wr_addr(write),
    .rd_addr(read),
    .din(mic_signal),
    .dout(delayed_signal)
);





endmodule
