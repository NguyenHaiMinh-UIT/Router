module router(
    input logic clk,
    input logic reset_n,
    // input [1:0] addr_i,
    input logic[1:0] din,
    input logic[1:0] frame_n,
    input logic[1:0] valid_n,
    output logic[1:0] dout,
    output logic[1:0] frameo_n,
    output logic[1:0] valido_n
);
    // reg [1:0] addr;
    logic pre_frame0, pre_frame1;
    logic [1:0] addr;
    always @(posedge clk) begin
        if (~reset_n) begin
            dout <= 2'bz;
            frameo_n <= 2'b11;
            valido_n <= 2'b11;
        end
        else begin
            
            if (frame_n[0] != pre_frame0) 
                addr[0] <= din[0];
            else pre_frame0 = frame_n[0];
            
            if (frame_n[1] != pre_frame1) addr[1] <= din[1];
            else pre_frame1 = frame_n[1];
            
            
                
        end
    end

    Fixed_Prio Fixed_Prio_instance(
        .addr_i(addr),
        .din(din),
        .frame_i(frame_n),
        .valid_i(valid_n),
        .dout(dout),
        .frame_o(frameo_n),
        .valid_o(valido_n)
    );
endmodule