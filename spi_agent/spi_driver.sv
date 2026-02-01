//------------------------------------------------------------------------------
// Module / Class Name : spi_driver
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
class spi_driver extends uvm_driver #(spi_transaction);
    `uvm_component_utils(spi_driver)

    virtual spi_if spi;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    task run_phase(uvm_phase phase);
        spi_transaction tr;
        forever begin
            seq_item_port.get_next_item(tr);
            drive_spi(tr);
            seq_item_port.item_done();
        end
    endtask

    task drive_spi(spi_transaction tr);
        spi.ss_n <= 0;
        repeat (8) begin
            spi.mosi <= tr.tx_data[7];
            tr.tx_data <<= 1;
            spi.sclk <= 0; @(posedge spi.clk);
            spi.sclk <= 1; @(posedge spi.clk);
        end
        spi.ss_n <= 1;
    endtask
endclass
