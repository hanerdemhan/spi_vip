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
