module counter #(
    parameter WIDTH = 9
)(
    input logic clk,
    input logic rst,
    input logic [WIDTH-1:0] incr,
    output logic [WIDTH-1:0] count1,
    output logic [WIDTH-1:0] count2
);

always_ff @(posedge clk )
    if (rst) 
    begin
    count1 <= {WIDTH{1'b0}};
    count2 <= {WIDTH{1'b0}};
    end
    else
    begin 
    count1 <=  count1 + 1;
    count2 <=  count1 + 1 - incr;
    end


endmodule
