class spi_monitor extends uvm_monitor;
    `uvm_component_utils(spi_monitor)

    virtual spi_if spi;

    uvm_analysis_port #(spi_transaction) mon_ap;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        mon_ap = new("mon_ap", this);
    endfunction

    task run_phase(uvm_phase phase);
        forever begin
            spi_transaction tr = spi_transaction::type_id::create("tr");
            @(negedge spi.ss_n);
            repeat (8) begin
                @(posedge spi.sclk);
                tr.rx_data = {tr.rx_data[6:0], spi.miso};
            end
            mon_ap.write(tr);
            `uvm_info(get_type_name(), $sformatf("SPI monitor captured: %s", tr.convert2string()), UVM_MEDIUM)
        end
    endtask
endclass
