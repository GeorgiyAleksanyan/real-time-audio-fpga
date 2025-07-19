/* Divides a clock by producing an enable signal */
module clkdiv #( parameter DIV_AMT) (
        input logic clk,
        output logic clk_en
    );
    
    localparam LEN = $clog2(DIV_AMT);
    logic[LEN-1:0] counter = 0;
    always_ff@(posedge clk) begin
        if (counter >= DIV_AMT-1) begin
            counter <= 0;
            clk_en <= 1;
        end else begin
            counter++;
            clk_en <= 0;
        end
    end 
endmodule

