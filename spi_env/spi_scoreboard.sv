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
