package spi_pkg;
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    // SPI agent dosyaları
    `include "spi_transaction.sv"
    `include "spi_sequence.sv"
    `include "spi_sequencer.sv"
    `include "spi_driver.sv"
    `include "spi_monitor.sv"
    `include "spi_agent.sv"

    // SPI env ve test dosyaları
    `include "../spi_env/spi_scoreboard.sv"
    `include "../spi_env/spi_env.sv"
    `include "../spi_env/spi_test.sv"
endpackage
