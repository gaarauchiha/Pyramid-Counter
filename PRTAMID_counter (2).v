module PRTAMID_counter(
    input wire clk,
    input wire reset,
    output reg [3:0] count,
    output reg pulse1,
    output reg pulse2
);

    reg [3:0] max_count;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
            pulse1 <= 0;
            pulse2 <= 0;
            max_count <= 4'b1111; // 15 in binary
        end
		  else begin
            if (count == max_count) begin
                pulse1 <= 1;
                max_count <= max_count - 1;
                count <= 0;
					 if (max_count == 1) begin
							pulse2 <= 1;
						end
					 
            
            end else begin
                pulse1 <= 0;
                pulse2 <= 0;
                count <= count + 1;
            end
        end
    end

endmodule
