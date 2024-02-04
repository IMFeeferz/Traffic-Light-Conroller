module Project3 (
	input clk,
	input rst_n,
	input x1,
	input	x2,
	output reg z
);

	reg [3:0] state;
	
	parameter A = 0, B = 1, C = 2, D = 3, E = 4, F = 5;
	
	always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			state <= A;
		else
		begin
			case(state)
				A:
					if ((x1 == 0 && x2 == 0) || (x1 == 1 && x2 == 1))
						state <= A;
					else if (x1 == 0 && x2 == 1)
						state <= C;
					else if (x1 == 1 && x2 == 0)
						state <= E;
				B:
					if ((x1 == 0 && x2 == 0) || (x1 == 1 && x2 == 1))
						state <= B;
					else if (x1 == 0 && x2 == 1)
						state <= D;
					else if (x1 == 1 && x2 == 0)
						state <= F;
				C:
					if (x1 == 0 && x2 == 1)
						state <= C;
					else if (x1 == 1 && x2 == 0)
						state <= E;
					else if ((x1 == 0 && x2 == 0) || (x1 == 1 && x2 == 1))
						state <= A;
				D:
					if (x1 == 0 && x2 == 1)
						state <= D;
					else if (x1 == 0 && x2 == 0)
						state <= B;
					else if (x1 == 1 && x2 == 0)
						state <= F;
				E:
					if (x1 == 1 && x2 == 0)
						state <= E;
					else if (x1 == 0 && x2 == 1)
						state <= D;
					else if (x1 == 1 && x2 == 1)
						state <= B;
				F:
					if (x1 == 1 && x2 == 0)
						state <= F;
					else if (x1 == 0 && x2 == 1)
						state <= C;
					else if ((x1 == 0 && x2 == 0) || (x1 == 1 && x2 == 1))
						state <= B;
			endcase
		end
	end
	
endmodule