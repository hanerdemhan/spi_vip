//------------------------------------------------------------------------------
// Module / Class Name : tb_spi_top
// Project             : SPI Verification IP
// Description         : UVM environment for SPI protocol verification
//
// Author              : Erdem Han Eldem
// Created Date        : 2025-05-18
// Revision            : v1.0
//
// Tool Compatibility  : Questa / ModelSim
// Language            : SystemVerilog (UVM)
//
// Notes:
// - This file defines the SPI UVM environment
// - Includes agent and scoreboard connectivity
// - Designed for extensibility
//
//------------------------------------------------------------------------------
// Revision History
//------------------------------------------------------------------------------
// Version | Date       | Author            | Description
//------------------------------------------------------------------------------
// v1.0    | 2025-06-01 | Erdem Han Eldem    | Initial implementation
//------------------------------------------------------------------------------
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
