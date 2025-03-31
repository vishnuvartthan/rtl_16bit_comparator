module rtl_compa_16 (
    input wire clk,
    input wire rst_n,
    input wire start,
    input wire [15:0] ain,
    input wire [15:0] bin,
    output reg greater,
    output reg less,
    output reg equal,
    output reg done
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        greater <= 0;
        less <= 0;
        equal <= 0;
        done <= 0;
    end else if (start) begin
        if (ain > bin) begin
            greater <= 1;
            less <= 0;
            equal <= 0;
        end else if (ain < bin) begin
            greater <= 0;
            less <= 1;
            equal <= 0;
        end else begin
            greater <= 0;
            less <= 0;
            equal <= 1;
        end
        done <= 1;
    end else begin
        done <= 0;
    end
end

endmodule
