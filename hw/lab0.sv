`timescale 1ns / 1ps


module lab0(
    input clk_i,
    input rst_i,
    input rx_i,
    output tx_o,
    output [7:0] led_o,
    input [7:0] switch_i,
    input send_i);

reg [7:0] shift_register;
reg [20:0] counter;
reg [20:0] send_counter;
reg [3:0] sent_bits;

reg count_enable;
reg shift_enable;
reg synced_rx_i;
reg tx_var;
reg enable_send_counter;
reg send_dff_1;
reg send_dff_2;


//sync_rx_i
always @(posedge clk_i)
begin
	synced_rx_i <= rx_i;
end

// counter block
always @(posedge clk_i)
begin
	if(rst_i) begin
		shift_enable <= 1'b0;
		counter <= 20'h0;
		count_enable <= 1'b0;
	end else if (count_enable && ~send_i)	begin
 		counter <= counter + 1;
		if (counter == 8680) begin
			shift_enable <= 1'b1;
		end else if (counter == 2*8680) begin
			shift_enable <= 1'b1;
		end else if (counter == 3*8680) begin
			shift_enable <= 1'b1;
		end else if (counter == 4*8680) begin
			shift_enable <= 1'b1;
		end else if (counter == 5*8680) begin
			shift_enable <= 1'b1;
		end else if (counter == 6*8680) begin
			shift_enable <= 1'b1;
		end else if (counter == 7*8680) begin
			shift_enable <= 1'b1;			
		end else if (counter == 8*8680) begin
			shift_enable <= 1'b1;
		end else if (counter == 9*8680) begin
			shift_enable <= 1'b0;	
			count_enable <= 1'b0;
			counter <= 20'h0;
		end else begin
			shift_enable <= 1'b0;
		end
	end else begin
		shift_enable <= 1'b0;
	end

	if (~synced_rx_i) 
		count_enable <= 1'b1;

end

//shift_reg block
always @(posedge clk_i)
begin
	if (rst_i) begin
		shift_register <= 8'h0;
	end else if (shift_enable) begin
		shift_register[7] <= synced_rx_i;
		shift_register[6:0] <= shift_register[7:1];
	end
end

assign led_o = shift_register;

// procedural block
//continuous assignment


// counter send
always @(posedge clk_i)
begin
	send_dff_1 <= send_i;
	send_dff_2 <= send_dff_1;


	if (rst_i) begin
		send_counter <= 20'h0;
		enable_send_counter <= 1'b0;
		sent_bits <= 4'd10;
	end else if (~send_dff_1 && send_dff_2) begin
		enable_send_counter <= 1'b1;
		send_counter <= 20'h0;
		sent_bits <= 4'd0;
	end else if (sent_bits == 4'd10) begin
		enable_send_counter <= 1'b0;
	end else if (enable_send_counter) begin
 		send_counter <= send_counter + 1;

		if (send_counter == 8680) begin
			sent_bits <= sent_bits + 1;
			send_counter <= 20'h0;
		end
	
	end else 
		sent_bits <= 4'd10;

end

// mux
always_comb begin
	case(sent_bits)
		4'd0: 	 tx_var = 1'b0;
		4'd1:    tx_var = switch_i[0];
		4'd2:    tx_var = switch_i[1];
		4'd3:    tx_var = switch_i[2];
		4'd4:    tx_var = switch_i[3];
		4'd5:    tx_var = switch_i[4];
		4'd6:    tx_var = switch_i[5];
		4'd7:    tx_var = switch_i[6];
		4'd8:    tx_var = switch_i[7];
    default: tx_var = 1'b1;
	endcase
end

assign tx_o = tx_var;

endmodule

// Local Variables:
// verilog-library-directories:("." "or1200" "jpeg" "pkmc" "dvga" "uart" "monitor" "lab1" "dafk_tb" "eth" "wb" "leela")
// End:

