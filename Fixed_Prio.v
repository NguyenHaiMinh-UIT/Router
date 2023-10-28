module Fixed_Prio(
    input  [1:0] addr_i,
    input  [1:0] din,
    input  [1:0] frame_i,
    input  [1:0] valid_i,
    output reg  [1:0] dout,
    output reg [1:0] frame_o,
    output reg [1:0] valid_o
);
   reg  [1:0] dout;
   reg [1:0] frame_o;
   reg [1:0] valid_o;
    
    always @(*) begin
        case (addr_i)
            2'b00:
            begin
                frame_o[0] = frame_i[0];
                frame_o[1] = frame_i[1];
                valid_o[0] = valid_i[0];
                valid_o[1] = valid_i[1];
                dout[0] = (!valid_i[0] && !frame_i[0]) ? din[0] : 1'bz;
                dout[1] = (!valid_i[1] && !frame_i[1]) ? din[1] : 1'bz;
            end
            2'b10:
            begin
                frame_o[0] <= frame_i[1];
                frame_o[1] <= frame_i[0];
                valid_o[0] <= valid_i[1];
                valid_o[1] <= valid_i[0];
                dout[0] <= (!valid_i[1] && !frame_i[1]) ? din[1] : 1'bz;
                dout[1] <= (!valid_i[0] && !frame_i[0]) ? din[0] : 1'bz;
            end
            2'b01:
            begin
                frame_o[0]<= frame_i[0];
                frame_o[1]<= frame_i[1];
                valid_o[0]<= valid_i[0];
                valid_o[1]<= valid_i[1];
                dout[0] = (!valid_i[0] && !frame_i[0]) ? din[0] : 1'bz;
                dout[1] = (!valid_i[1] && !frame_i[1]) ? din[1] : 1'bz;
            end
            2'b11:
            begin
                frame_o[0] <= frame_i[1];
                frame_o[1] <= frame_i[0];
                valid_o[0] <= valid_i[1];
                valid_o[1] <= valid_i[0];
                dout[0] = (!valid_i[1] && !frame_i[1]) ? din[1] : 1'bz;
                dout[1] = (!valid_i[0] && !frame_i[0]) ? din[0] : 1'bz;
            end
  
        endcase
    end

endmodule