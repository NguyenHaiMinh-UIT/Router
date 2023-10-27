`timescale 1ns / 1ps
module test_top(
);
    bit clock=0;
    router_interface rtr_io(clock);
    router_testbench router_testbench_instance(rtr_io);
    router router_instance(
        .clk(rtr_io.clk),
        .reset_n(rtr_io.reset_n),
        .din(rtr_io.din),
        .frame_n(rtr_io.frame_n),
        .valid_n(rtr_io.valid_n),
        .dout(rtr_io.dout),
        .frameo_n(rtr_io.frameo_n),
        .valido_n(rtr_io.valido_n)
    );
    always #10 clock = ~clock;
endmodule : test_top
