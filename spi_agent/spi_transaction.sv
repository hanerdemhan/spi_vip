//------------------------------------------------------------------------------
// Module / Class Name : spi_transaction
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
class spi_transaction extends uvm_sequence_item;
    rand byte tx_data;
    byte rx_data;

    `uvm_object_utils(spi_transaction)

    function new(string name="spi_transaction");
        super.new(name);
    endfunction

    function string convert2string();
        return $sformatf("tx_data=0x%0h rx_data=0x%0h", tx_data, rx_data);
    endfunction
endclass
