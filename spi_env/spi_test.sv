//------------------------------------------------------------------------------
// Module / Class Name : spi_test
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
class spi_test extends uvm_test;
    `uvm_component_utils(spi_test)

    spi_env env;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = spi_env::type_id::create("env", this);
    endfunction

    task main_phase(uvm_phase phase);
        spi_sequence seq;
        seq = spi_sequence::type_id::create("seq");
        seq.start(env.agent.seqr);
    endtask
endclass
