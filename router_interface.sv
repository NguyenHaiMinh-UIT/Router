interface router_interface (input bit clk);
    logic reset_n;
    logic [1:0] din;
    logic [1:0] frame_n;
    logic [1:0] valid_n;
    logic [1:0] dout;
    logic [1:0] frameo_n;
    logic [1:0] valido_n;
    clocking cb @(posedge clk); 
        output reset_n;
        output din;
        output frame_n;
        output valid_n;
        input dout;
        input frameo_n;
        input valido_n;
    endclocking
    modport tb (clocking cb,output reset_n);
endinterface : router_interface
