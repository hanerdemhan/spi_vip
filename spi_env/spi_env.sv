//------------------------------------------------------------------------------
// Module / Class Name : spi_env
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
class spi_env extends uvm_env;
    `uvm_component_utils(spi_env)

    spi_agent agent;
    spi_scoreboard sb;
    virtual spi_if spi;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent = spi_agent::type_id::create("agent", this);
        agent.spi = spi;
        sb = spi_scoreboard::type_id::create("sb", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        agent.mon.mon_ap.connect(sb.aport);
    endfunction
endclass
