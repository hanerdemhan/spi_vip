//------------------------------------------------------------------------------
// Module / Class Name : spi_scoreboard
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
class spi_scoreboard extends uvm_component;
    `uvm_component_utils(spi_scoreboard)

    uvm_analysis_export #(spi_transaction) aport;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        aport = new("aport", this);
    endfunction

    task run_phase(uvm_phase phase);
        forever begin
            spi_transaction tr;
            aport.analysis_if.get(tr);
            `uvm_info(get_type_name(), $sformatf("[Scoreboard] Transaction checked: %s", tr.convert2string()), UVM_MEDIUM)
        end
    endtask
endclass
