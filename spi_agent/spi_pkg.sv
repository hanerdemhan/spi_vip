//------------------------------------------------------------------------------
// Module / Class Name : spi_pkg
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
package spi_pkg;
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    // SPI agent files
    `include "spi_transaction.sv"
    `include "spi_sequence.sv"
    `include "spi_sequencer.sv"
    `include "spi_driver.sv"
    `include "spi_monitor.sv"
    `include "spi_agent.sv"

    // SPI env and test files
    `include "../spi_env/spi_scoreboard.sv"
    `include "../spi_env/spi_env.sv"
    `include "../spi_env/spi_test.sv"
endpackage
