class spi_env extends uvm_env;
    `uvm_component_utils(spi_env)

    spi_agent agent;
    spi_scoreboard sb;
    virtual spi_if spi;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent = spi_agent::type_id::create("agent", this);
        agent.spi = spi;
        sb = spi_scoreboard::type_id::create("sb", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        agent.mon.mon_ap.connect(sb.aport);
    endfunction
endclass
