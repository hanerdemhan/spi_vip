class spi_sequence extends uvm_sequence #(spi_transaction);
    `uvm_object_utils(spi_sequence)

    function new(string name="spi_sequence");
        super.new(name);
    endfunction

    task body();
        spi_transaction tr;
        `uvm_info(get_type_name(), "SPI sequence starting", UVM_MEDIUM)

        repeat (4) begin // 4 transferlik örnek senaryo
            tr = spi_transaction::type_id::create("tr");
            assert(tr.randomize());
            start_item(tr);
            finish_item(tr);
            `uvm_info(get_type_name(), $sformatf("Sequence sent: %s", tr.convert2string()), UVM_MEDIUM)
        end
    endtask
endclass
