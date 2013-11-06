//
// Verilog Module leela.leela_cam_sprite
//
// Created:
//          by - spritegen.pike
//          at - 16:51:27 06/03/2004
`resetall
`timescale 1ns/10ps
module leela_cam_sprite (
       // Syscon interface
       clk, rst,

       // Sprite memory interface
       adr_i, dat_o
);

// Syscon interface
input			clk;
input			rst;

// Sprite memory interface
input	[5:0]		adr_i;
output  [31:0]		dat_o;
reg	[31:0]		dat_o;

always @(posedge clk) begin
case(adr_i)
6'h00: dat_o <= 32'b00000000000011111111000000000000;
6'h01: dat_o <= 32'b00000000011111111111111000000000;
6'h02: dat_o <= 32'b00000000111111111111111100000000;
6'h03: dat_o <= 32'b00000011111111111111111111000000;
6'h04: dat_o <= 32'b00000111111111111111111111100000;
6'h05: dat_o <= 32'b00001111111111111111111111110000;
6'h06: dat_o <= 32'b00011111111111111111111111111000;
6'h07: dat_o <= 32'b00011111111111111111111111111000;
6'h08: dat_o <= 32'b00111111111111111111111111111100;
6'h09: dat_o <= 32'b00111111111111111111111111111100;
6'h0A: dat_o <= 32'b01111111111111111111111111111110;
6'h0B: dat_o <= 32'b01111111111111111111111111111110;
6'h0C: dat_o <= 32'b01111111111111111111111111111110;
6'h0D: dat_o <= 32'b11111111111111111111111111111111;
6'h0E: dat_o <= 32'b11111111111111111111111111111111;
6'h0F: dat_o <= 32'b11111111111111111111111111111111;
6'h10: dat_o <= 32'b11111111111111111111111111111111;
6'h11: dat_o <= 32'b11111111111111111111111111111111;
6'h12: dat_o <= 32'b11111111111111111111111111111111;
6'h13: dat_o <= 32'b01111111111111111111111111111110;
6'h14: dat_o <= 32'b01111111111111111111111111111110;
6'h15: dat_o <= 32'b01111111111111111111111111111110;
6'h16: dat_o <= 32'b00111111111111111111111111111100;
6'h17: dat_o <= 32'b00111111111111111111111111111100;
6'h18: dat_o <= 32'b00011111111111111111111111111000;
6'h19: dat_o <= 32'b00011111111111111111111111111000;
6'h1A: dat_o <= 32'b00001111111111111111111111110000;
6'h1B: dat_o <= 32'b00000111111111111111111111100000;
6'h1C: dat_o <= 32'b00000011111111111111111111000000;
6'h1D: dat_o <= 32'b00000000111111111111111100000000;
6'h1E: dat_o <= 32'b00000000011111111111111000000000;
6'h1F: dat_o <= 32'b00000000000011111111000000000000;
6'h20: dat_o <= 32'b00000000000000000000000000000000;
6'h21: dat_o <= 32'b00000000000000000000000000000000;
6'h22: dat_o <= 32'b00000000000000000000000000000000;
6'h23: dat_o <= 32'b00000000000000000000000000000000;
6'h24: dat_o <= 32'b00000000000000000000000000000000;
6'h25: dat_o <= 32'b00000000000000000000000000000000;
6'h26: dat_o <= 32'b00000000000000000000000000000000;
6'h27: dat_o <= 32'b00000000000000000000000000000000;
6'h28: dat_o <= 32'b00000000000001111110000000000000;
6'h29: dat_o <= 32'b00000000000011111111000000000000;
6'h2A: dat_o <= 32'b00000000001111111111110000000000;
6'h2B: dat_o <= 32'b00000000001111111111110000000000;
6'h2C: dat_o <= 32'b00000000011111111111111000000000;
6'h2D: dat_o <= 32'b00000000011111111111111000000000;
6'h2E: dat_o <= 32'b00000000111111111111111100000000;
6'h2F: dat_o <= 32'b00000000111111111111111100000000;
6'h30: dat_o <= 32'b00000000111111111111111100000000;
6'h31: dat_o <= 32'b00000000111111111111111100000000;
6'h32: dat_o <= 32'b00000000011111111111111000000000;
6'h33: dat_o <= 32'b00000000011111111111111000000000;
6'h34: dat_o <= 32'b00000000001111111111110000000000;
6'h35: dat_o <= 32'b00000000001111111111110000000000;
6'h36: dat_o <= 32'b00000000000011111111000000000000;
6'h37: dat_o <= 32'b00000000000001111110000000000000;
6'h38: dat_o <= 32'b00000000000000000000000000000000;
6'h39: dat_o <= 32'b00000000000000000000000000000000;
6'h3A: dat_o <= 32'b00000000000000000000000000000000;
6'h3B: dat_o <= 32'b00000000000000000000000000000000;
6'h3C: dat_o <= 32'b00000000000000000000000000000000;
6'h3D: dat_o <= 32'b00000000000000000000000000000000;
6'h3E: dat_o <= 32'b00000000000000000000000000000000;
6'h3F: dat_o <= 32'b00000000000000000000000000000000;
default: dat_o <= 32'b0;
endcase
end

endmodule // leela_cam_sprite
// Local Variables:
// verilog-library-directories:("." ".." "../or1200" "../jpeg" "../pkmc" "../dvga" "../uart" "../monitor" "../lab1" "../dafk_tb" "../eth" "../wb" "../leela")
// End: