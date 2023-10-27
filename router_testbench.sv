program automatic router_testbench(router_interface.tb rtr_io);
    // logic[1:0] dout;
    initial begin
        // #0 rtr_io.cb = 0 ;
        #0
        rtr_io.reset_n <=1 ;
        rtr_io.cb.frame_n<=2'b11;
        rtr_io.cb.valid_n<=2'b11;
        repeat(15) @(rtr_io.cb) ;
        // forever #10 clk = ~clk;
    end

    initial
    fork
        //assert reset
        rtr_io.reset_n=0;

        begin
            rtr_io.reset_n = 0;
            rtr_io.cb.din <= 2'b00;
            rtr_io.cb.frame_n <= 2'b11;
            rtr_io.cb.valid_n <= 2'b11;
        end
        //deassert reset
        #20 rtr_io.reset_n=1;
        //din port1 control
        // begin
        //     #375;
        //     #40 rtr_io.cb.din[1]=1;
        //     #20 rtr_io.cb.din[1]=1'bx;
        //     #20 rtr_io.cb.din[1]=1'b0;
        //     #20 rtr_io.cb.din[1]=1'b1;
        //     #20 rtr_io.cb.din[1]=1'b1;
        //     #20 rtr_io.cb.din[1]=1'b0;
        //     #20 rtr_io.cb.din[1]=1'b1;
        // end
        // //din port0 control
        // begin
        //     #375;
        //     #40 rtr_io.cb.din[0]=0;
        //     #20 rtr_io.cb.din[0]=1'bx;
        //     #20 rtr_io.cb.din[0]=1'b1;
        //     #20 rtr_io.cb.din[0]=1'b0;
        //     #20 rtr_io.cb.din[0]=1'b1;
        //     #20 rtr_io.cb.din[0]=1'b1;
        //     #20 rtr_io.cb.din[0]=1'b0;
        // end
        // //valid_n port 1 control
        // begin
        //     #375;
        //     #80 rtr_io.cb.valid_n[1]=0;
        //     #20 rtr_io.cb.valid_n[1]=1;
        // end
        // //valid_n port 0 control
        // begin
        //     #375;
        //     #80 rtr_io.cb.valid_n[0]=0;
        //     #20 rtr_io.cb.valid_n[0]=1;
        // end
        // //frame_n port 1 control
        // begin
        //     #375;
        //     #40 rtr_io.cb.frame_n[1]=0;
        //     #60 rtr_io.cb.frame_n[1]=1;
        // end
        // //frame_n port 0
        // begin
        //     #375;
        //     #40 rtr_io.cb.frame_n[0]=0;
        //     #60 rtr_io.cb.frame_n[0]=1;
        // end
        // second packet 
        begin
            // #375;
            #40 rtr_io.cb.din[1]<=0;
            #20 rtr_io.cb.din[1]<=1'bx;
            #20 rtr_io.cb.din[1]<=1'b0;
            #20 rtr_io.cb.din[1]<=1'b1;
            #20 rtr_io.cb.din[1]<=1'b1;
            #20 rtr_io.cb.din[1]<=1'b0;
            #20 rtr_io.cb.din[1]<=1'b1;
        end
        //din port0 control
        begin
            // #375;
            #40 rtr_io.cb.din[0]<=0;
            #20 rtr_io.cb.din[0]<=1'bx;
            #20 rtr_io.cb.din[0]<=1'b1;
            #20 rtr_io.cb.din[0]<=1'b0;
            #20 rtr_io.cb.din[0]<=1'b1;
            #20 rtr_io.cb.din[0]<=1'b1;
            #20 rtr_io.cb.din[0]<=1'b0;
        end
        // valid_n port 1 control
        begin
            // #375
            repeat(2) @(rtr_io.cb);
            rtr_io.cb.valid_n[1]<=1;
            repeat(5) @(rtr_io.cb);
            rtr_io.cb.valid_n[1]<=0;
        end
        //valid_n port 0 control
        begin
            // #375;
            #80 rtr_io.cb.valid_n[0]<=0;
            #20 rtr_io.cb.valid_n[0]<=1;
        end
        //frame_n port 1 control
        begin
            // #375;
            repeat(7) @(rtr_io.cb);
            rtr_io.cb.frame_n[1]<=0;
            #40 rtr_io.cb.frame_n[1]<=1;
        end
        //frame_n port 0
        begin
            #375;
            repeat(7) @(rtr_io.cb);
            rtr_io.cb.frame_n[0]<=0;
            #60 rtr_io.cb.frame_n[0]<=1;
        end
    join


endprogram

/* program automatic router_testbench(router_interface.tb rtr_io);

    logic [1:0] dout;
    initial begin
        reset();
        repeat(3) @(rtr_io.cb);
        rtr_io.reset_n = 1;
        fork

            repeat(100) @(rtr_io.cb) random();
            repeat(100) @(rtr_io.cb) check();
            begin
                #20
                control(2'b10, 2'b11);
                repeat(10) @(rtr_io.cb);
                control(2'b10, 2'b10);
                repeat(2) @(rtr_io.cb);
                control(2'b10, 2'b11);
                repeat(2) @(rtr_io.cb);
                control(2'b10, 2'b10);
                repeat(6) @(rtr_io.cb);
                control(2'b11, 2'b11);
                #20
                control(2'b01, 2'b11);
                repeat(10) @(rtr_io.cb);
                control(2'b01, 2'b01);
                repeat(2) @(rtr_io.cb);
                control(2'b01, 2'b00);
                repeat(2) @(rtr_io.cb);
                control(2'b01, 2'b01);
                repeat(6) @(rtr_io.cb);
                control(2'b11, 2'b11);
                #20
                control(2'b00, 2'b11);
                repeat(10) @(rtr_io.cb);
                control(2'b00, 2'b00);
                repeat(2) @(rtr_io.cb);
                control(2'b00, 2'b11);
                repeat(2) @(rtr_io.cb);
                control(2'b00, 2'b00);
                repeat(6) @(rtr_io.cb);
                control(2'b11, 2'b11);
            end

        join_any
    end

    task reset();
        rtr_io.reset_n = 0;
        rtr_io.cb.din <= 2'b00;
        rtr_io.cb.frame_n <= 2'b11;
        rtr_io.cb.valid_n <= 2'b11;
    endtask

    task random();
        rtr_io.cb.din <= $urandom_range(0, 3);
    endtask

    task control(input logic [1:0] frame, input logic [1:0] valid);
        rtr_io.cb.frame_n <= frame;
        rtr_io.cb.valid_n <= valid;
    endtask

    task check();
        if(rtr_io.cb.valido_n[0] == 0) begin
            $display("data receive at port[0]: %b at %t", rtr_io.cb.dout[0], $time);
        end
        else begin
            if(rtr_io.cb.valido_n[1] == 0) begin
                $display("data receive at port[1]: %b at %t", rtr_io.cb.dout[1], $time);
            end
        end
    endtask
endprogram 
*/