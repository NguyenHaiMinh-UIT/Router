`timescale 1ns/1ps
module router(
    input  clk,
    input  reset_n,
    // input [1:0] addr_i,
    input [1:0] din,
    input [1:0] frame_n,
    input [1:0] valid_n,
    output [1:0] dout,
    output [1:0] frameo_n,
    output [1:0] valido_n
);
    // reg [1:0] addr;
    reg [1:0] dout, frameo_n,valido_n;
    reg pre_frame0, pre_frame1;
    wire [1:0] o,f,v;
    reg [1:0] addr;
    always @(posedge clk ) begin
        if (~reset_n) begin
            addr = 2'bz;
        end
        else begin
            if (frame_n[0] != pre_frame0) 
                addr[0] = din[0];
            else pre_frame0 = frame_n[0];
            if (frame_n[1] != pre_frame1) addr[1] = din[1];
            else pre_frame1 = frame_n[1];       
        end
        dout = o;
        frameo_n = f;
        valido_n = v;
    end

    Fixed_Prio Fixed_Prio_instance(
        .addr_i(addr),
        .din(din),
        .frame_i(frame_n),
        .valid_i(valid_n),
        .dout(o),
        .frame_o(f),
        .valid_o(v)
    );
    
endmodule