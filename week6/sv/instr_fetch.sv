module instr_fetch (
	output logic [31:0] instruction, new_addr,
	input bit PCsrc,
	input logic [31:0] branch_addr,
	input logic clk
);
	logic [31:0] old_addr;
	bit del_clk; // delayed clock
	
	PC program_count(new_addr, old_addr, branch_addr, PCsrc, clk);
	mux_2_1 #(1) buffer(del_clk, clk, 1'b0, 1'b1);
	instr_mem code_mem(instruction, old_addr, del_clk);

	assign old_addr = new_addr;
    
endmodule