module Fixed_Prio(
    input logic [1:0] addr_i,
    input logic [1:0] din,
    input logic [1:0] frame_i,
    input logic [1:0] valid_i,
    output logic [1:0] dout,
    output logic [1:0] frame_o,
    output logic [1:0] valid_o
);
   
    // assign addr0 = addr_i[0];
    // assign addr1 = addr_i[1];

    // assign frame_o[0] = (addr0 == 0) ? frame_i[0] : frame_i[1];
    // assign frame_o[1] = (addr0 == 0 && addr1 == 1) ? frame_i[1] : ((addr0 == 1 && addr1 == 0)? frame_o[0] : 1'bz); 
    always @(addr_i) begin
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
                frame_o[0] = frame_i[1];
                frame_o[1] = frame_i[0];
                valid_o[0] = valid_i[1];
                valid_o[1] = valid_i[0];
                dout[0] = (!valid_i[1] && !frame_i[1]) ? din[1] : 1'bz;
                dout[1] = (!valid_i[0] && !frame_i[0]) ? din[0] : 1'bz;
            end
            2'b01:
            begin
                frame_o[0] = frame_i[0];
                frame_o[1] = frame_i[1];
                valid_o[0] = valid_i[0];
                valid_o[1] = valid_i[1];
                dout[0] = (!valid_i[0] && !frame_i[0]) ? din[0] : 1'bz;
                dout[1] = (!valid_i[1] && !frame_i[1]) ? din[1] : 1'bz;
            end
            2'b11:
            begin
                frame_o[0] = frame_i[1];
                frame_o[1] = frame_i[0];
                valid_o[0] = valid_i[1];
                valid_o[1] = valid_i[0];
                dout[0] = (!valid_i[1] && !frame_i[1]) ? din[1] : 1'bz;
                dout[1] = (!valid_i[0] && !frame_i[0]) ? din[0] : 1'bz;
            end
            default:
            begin
                frame_o[0] = 1;
                frame_o[1] = 1;
                valid_o[0] = 1;
                valid_o[1] = 1;
                dout[0] =  1'bz;
                dout[1] =  1'bz;
            end  
        endcase
    end

endmodule