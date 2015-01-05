`timescale 100ps/1ps
module hitrate (hitc, totalc, cs, rst, clk);

    output         hitc;
    output         totalc;
    input  [3:0]   cs;
    input          rst;
    input          clk;


    reg    [9:0]   totalc;
    reg    [9:0]   hitc;


    always @(negedge clk or posedge rst) begin
      if(rst) begin
			totalc  <= 10'd0;
			hitc    <= 10'd0;
			end
		else begin
				case(cs)
				    4'd9:begin//RDHIT
					totalc  <= totalc  + 10'd1;
					hitc    <= hitc    + 10'd1;
					end
				    4'd6:begin//WRHIT
					totalc  <= totalc  + 10'd1;
					hitc    <= hitc    + 10'd1;
					end
				    4'd2:begin//RDMISS
					totalc  <= totalc  + 10'd1;

					end
				    4'd7:begin//WRMISS
					totalc  <= totalc  + 10'd1;

					end
				    default:begin//OTHER

					end
				endcase
			end
		
    end


endmodule
