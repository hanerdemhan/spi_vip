//------------------------------------------------------------------------------
// Module / Class Name : spi_agent
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
class spi_agent extends uvm_agent;
    `uvm_component_utils(spi_agent)

    spi_driver drv;
    spi_monitor mon;
    spi_sequencer seqr;
    virtual spi_if spi;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        drv = spi_driver::type_id::create("drv", this);
        mon = spi_monitor::type_id::create("mon", this);
        seqr = spi_sequencer::type_id::create("seqr", this);
        drv.spi = spi;
        mon.spi = spi;
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        drv.seq_item_port.connect(seqr.seq_item_export);
    endfunction
endclass
