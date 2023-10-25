module counter #(
    parameter WIDTH = 8
)(
    input logic clk, en, rst,
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
    count1 <= en ?  count1 + 4'b1000: count1;
    count2 <= en ?  count1 + incr: count2;
    end
endmodule
