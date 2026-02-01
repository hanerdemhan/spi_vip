//------------------------------------------------------------------------------
// Module / Class Name : spi_sequence
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
class spi_sequence extends uvm_sequence #(spi_transaction);
    `uvm_object_utils(spi_sequence)

    function new(string name="spi_sequence");
        super.new(name);
    endfunction

    task body();
        spi_transaction tr;
        `uvm_info(get_type_name(), "SPI sequence starting", UVM_MEDIUM)

        repeat (4) begin // Example scenario with 4 transfers
            tr = spi_transaction::type_id::create("tr");
            assert(tr.randomize());
            start_item(tr);
            finish_item(tr);
            `uvm_info(get_type_name(), $sformatf("Sequence sent: %s", tr.convert2string()), UVM_MEDIUM)
        end
    endtask
endclass
