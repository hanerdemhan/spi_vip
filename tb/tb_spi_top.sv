`include "../rtl/spi_if.sv"
import uvm_pkg::*;
`include "uvm_macros.svh"
import spi_pkg::*;

module tb_spi_top();
    logic clk;
    logic rst_n;
    spi_if spi(clk, rst_n);

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;
        #20 rst_n = 1;
    end

    initial begin
        run_test("spi_test");
    end
endmodule
