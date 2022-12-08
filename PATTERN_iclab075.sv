`include "../00_TESTBED/pseudo_DRAM.sv"
`include "Usertype_FD.sv"

program automatic PATTERN(input clk, INF.PATTERN inf);
import usertype::*;
logic always_rst;
logic golden_valid;
logic [200:0] assign_rst ;
//================================================================
// parameters & integer
//================================================================
assign assign_rst[0]=0;
integer i, j;
assign assign_rst[1]=0;
integer i_pat, latency, total_latency;
assign assign_rst[2]=0;
parameter SEED = 67;
assign assign_rst[3]=0;
parameter PATNUM = 25000;
assign assign_rst[4]=0;
parameter DRAM_path = "../00_TESTBED/DRAM/dram.dat";
assign assign_rst[5]=0;
parameter base = 65536;
assign assign_rst[6]=0;
//================================================================
// wire & registers 
//================================================================
logic [7:0] golden_DRAM[base:base+2047];
assign assign_rst[7]=0;
Action golden_act;
assign assign_rst[8]=0;
Delivery_man_id golden_delivery_id;
assign assign_rst[9]=0;
Restaurant_id golden_res_id;
assign assign_rst[10]=0;
servings_of_food golden_fd_num;
assign assign_rst[11]=0;
limit_of_orders golden_limit_of_orders;
assign assign_rst[12]=0;
assign assign_rst[13]=0;
Customer_status golden_cust_status;
assign assign_rst[14]=0;
Food_id golden_food_id;
assign assign_rst[15]=0;
Error_Msg golden_err_msg;
assign assign_rst[16]=0;
logic [63:0] golden_out_info;
assign assign_rst[17]=0;
logic golden_complete;
assign assign_rst[18]=0;
D_man_Info golden_cur_d_man_info;
assign assign_rst[19]=0;
res_info golden_cur_res_info;
assign assign_rst[20]=0;
logic [8:0] food_sum;
assign assign_rst[21]=0;
//================================================================
// class random
//================================================================
class rand_gap;
    rand int para0;
    rand int gap;
    int para1;
    function new (int seed);
        this.srandom(seed);
    endfunction
    int para2;
    constraint limit {gap inside {[1:5]};}
    int para3;
endclass
assign assign_rst[22]=0;
class rand_delay;
    int para4;  
    rand int delay;
    int para5;
    function new (int seed);
        this.srandom(seed);
    endfunction
    int para6;
    constraint limit {delay inside {[2:10]};}
    int para7;
endclass
assign assign_rst[23]=0;
class rand_action;
    int para8;
    rand Action action;
    int para9;
    function new (int seed);
        this.srandom(seed);
    endfunction
    int para10;
    constraint limit {action inside {Take, Deliver, Order, Cancel};}
    int para11;
endclass
assign assign_rst[24]=0;
class rand_c_status;
    int para12;
    rand Customer_status c_status;
    int para13;
    function new (int seed);
        this.srandom(seed);
    endfunction
    int para14;
    constraint limit {c_status inside {Normal, VIP};}
    int para15;
endclass
assign assign_rst[25]=0;
class rand_food_id;
    int para16;
    rand Food_id food_id;
    int para17;
    function new (int seed);
        this.srandom(seed);
    endfunction
    int para18;
    constraint limit {food_id inside {FOOD1, FOOD2, FOOD3};}
    int para19;
endclass
assign assign_rst[26]=0;
class rand_d_id;
    int para20;
    rand Delivery_man_id d_id;
    int para21;
    function new (int seed);
        this.srandom(seed);
    endfunction
    int para22;
    constraint limit {d_id inside {[0:255]};}
    int para23;
endclass
assign assign_rst[27]=0;
class rand_r_id;
    int para24;
    rand Restaurant_id r_id;
    int para25;
    function new (int seed);
        this.srandom(seed);
    endfunction
    int para26;
    constraint limit {r_id inside {[0:255]};}
    int para27;
endclass
assign assign_rst[28]=0;
class rand_food_num;
    int para28;
    rand servings_of_food food_num;
    int para29;
    function new (int seed);
        this.srandom(seed);
    endfunction
    int para30;
    constraint limit {food_num inside {[1:15]};}
    int para31;
endclass
assign assign_rst[29]=0;
rand_gap r_gap = new(SEED);
assign assign_rst[30]=0;
rand_delay r_delay = new(SEED);
assign assign_rst[31]=0;
rand_action r_action = new(SEED);
assign assign_rst[32]=0;
rand_c_status r_c_status = new(SEED);
assign assign_rst[33]=0;
rand_food_id r_food_id = new(SEED);
assign assign_rst[34]=0;
rand_d_id r_d_id = new(SEED);
assign assign_rst[35]=0;
rand_r_id r_r_id = new(SEED);
assign assign_rst[36]=0;
rand_food_num r_food_num = new(SEED);
assign assign_rst[37]=0;
//================================================================
// initial
//================================================================
initial begin
    golden_valid_task ;
    always_rst=0;
    $readmemh(DRAM_path, golden_DRAM);
    golden_valid_task ;
    always_rst=0;
    latency = 0;
    golden_valid_task ;
    always_rst=0;
    total_latency = 0;
    golden_valid_task ;
    always_rst=0;
    reset_task;
    golden_valid_task ;
    always_rst=0;
    for(i_pat = 0; i_pat < PATNUM; i_pat = i_pat + 1)begin
        golden_valid_task ;
        always_rst=0;
        r_action.randomize();
        golden_valid_task ;
        always_rst=0;
        golden_act = r_action.action;
        golden_valid_task ;
        always_rst=0;
        if(golden_act == Take) begin
            golden_valid_task ;
            always_rst=0;
            input_take_task;
            golden_valid_task ;
            always_rst=0;
            compute_take_task;
            golden_valid_task ;
            always_rst=0;
        end
        else if(golden_act == Deliver)begin
            golden_valid_task ;
            always_rst=0;
            input_deliver_task;
            golden_valid_task ;
            always_rst=0;
            compute_deliver_task;
            golden_valid_task ;
            always_rst=0;
        end
        else if(golden_act == Order)begin
            golden_valid_task ;
            always_rst=0;
            input_order_task;
            golden_valid_task ;
            always_rst=0;
            compute_order_task;
            golden_valid_task ;
            always_rst=0;
        end
        else if(golden_act == Cancel)begin
            golden_valid_task ;
            always_rst=0;
            input_cancel_task;
            golden_valid_task ;
            always_rst=0;
            compute_cancel_task;
            golden_valid_task ;
            always_rst=0;
        end
        golden_valid_task ;
        always_rst=0;
        wait_out_valid_task;
        golden_valid_task ;
        always_rst=0;
        golden_valid_task ;
        check_output_task;
        golden_valid_task ;
        always_rst=0;
        //$display("\033[0;34mPASS PATTERN NO.%4d,\033[m \033[0;32mexecution cycle : %3d\033[m",i_pat ,latency);
        total_latency = total_latency + latency;
        golden_valid_task ;
        always_rst=0;
        delay_task;
        golden_valid_task ;
        always_rst=0;
    end
    YOU_PASS_task;
    golden_valid_task ;
    always_rst=0;
end
assign assign_rst[38]=0;
task reset_task; begin
    golden_valid_task ;
    always_rst=0;
    inf.rst_n = 1'b1;
    golden_valid_task ;
    always_rst=0;
    inf.id_valid = 1'b0;
    golden_valid_task ;
    always_rst=0;
    inf.act_valid = 1'b0;
    golden_valid_task ;
    always_rst=0;
    inf.res_valid = 1'b0;
    golden_valid_task ;
    always_rst=0;
    inf.cus_valid = 1'b0;
    golden_valid_task ;
    always_rst=0;
    inf.food_valid = 1'b0;
    golden_valid_task ;
    always_rst=0;
    inf.D = 'bx;
    golden_valid_task ;
    always_rst=0;
    #8; inf.rst_n = 0;
    golden_valid_task ;
    always_rst=0;
    #8; inf.rst_n = 1;
    golden_valid_task ;
    always_rst=0;
    if(inf.out_valid!==1'b0 || inf.err_msg !== 'd0 || inf.complete !== 1'b0 || inf.out_info !== 'd0)begin
        //$display("************************************************************");   
        //$display("                          FAIL!                              ");   
        //$display("*  Output signal should be 0 after initial RESET  at %8t   *",$time);
        //$display("************************************************************");
        golden_valid_task ;
        always_rst=0;
        $finish;
    end    
end endtask
assign assign_rst[39]=0;
task delay_task; begin
    golden_valid_task ;
    always_rst=0;
    r_delay.randomize();
    golden_valid_task ;
    always_rst=0;
    repeat(r_delay.delay) @(negedge clk);
    golden_valid_task ;
    always_rst=0;
end endtask
assign assign_rst[40]=0;
task gap_task;begin
    golden_valid_task ;
    always_rst=0;
    r_gap.randomize();
    golden_valid_task ;
    always_rst=0;
    repeat(r_gap.gap) @(negedge clk);
    golden_valid_task ;
    always_rst=0;
end endtask
assign assign_rst[41]=0;
task input_take_task;begin
    golden_valid_task ;
    always_rst=0;
    r_d_id.randomize();
    golden_valid_task ;
    always_rst=0;
    golden_delivery_id = r_d_id.d_id;
    golden_valid_task ;
    always_rst=0;
    r_c_status.randomize();
    golden_valid_task ;
    always_rst=0;
    golden_cust_status = r_c_status.c_status;
    golden_valid_task ;
    always_rst=0;
    r_r_id.randomize();
    golden_valid_task ;
    always_rst=0;
    golden_res_id = r_r_id.r_id;
    golden_valid_task ;
    always_rst=0;
    r_food_id.randomize();
    golden_valid_task ;
    always_rst=0;
    golden_food_id = r_food_id.food_id;
    golden_valid_task ;
    always_rst=0;
    r_food_num.randomize();
    golden_valid_task ;
    always_rst=0;
    golden_fd_num = r_food_num.food_num;
    golden_valid_task ;
    always_rst=0;

    inf.act_valid = 1'b1;
    golden_valid_task ;
    always_rst=0;
    inf.D.d_act = golden_act;
    golden_valid_task ;
    always_rst=0;
    @(negedge clk);
    golden_valid_task ;
    always_rst=0;
    inf.act_valid = 1'b0;
    golden_valid_task ;
    always_rst=0;
    inf.D = 'bx;
    golden_valid_task ;
    always_rst=0;

    gap_task;
    golden_valid_task ;
    always_rst=0;

    inf.id_valid = 1'b1;
    golden_valid_task ;
    always_rst=0;
    inf.D.d_id = golden_delivery_id;
    golden_valid_task ;
    always_rst=0;
    @(negedge clk);
    golden_valid_task ;
    always_rst=0;
    inf.id_valid = 1'b0;
    golden_valid_task ;
    always_rst=0;
    inf.D = 'bx;
    golden_valid_task ;
    always_rst=0;

    gap_task;
    golden_valid_task ;
    always_rst=0;

    inf.cus_valid = 1'b1;
    golden_valid_task ;
    always_rst=0;
    inf.D.d_ctm_info = {golden_cust_status, golden_res_id, golden_food_id, golden_fd_num};
    golden_valid_task ;
    always_rst=0;
    @(negedge clk);
    golden_valid_task ;
    always_rst=0;
    inf.cus_valid = 1'b0;
    golden_valid_task ;
    always_rst=0;
    inf.D = 'bx;
    golden_valid_task ;
    always_rst=0;
end endtask
assign assign_rst[42]=0;
task input_deliver_task; begin
    golden_valid_task ;
    always_rst=0;
    r_d_id.randomize();
    golden_valid_task ;
    always_rst=0;
    golden_delivery_id = r_d_id.d_id;
    golden_valid_task ;
    always_rst=0;

    inf.act_valid = 1'b1;
    golden_valid_task ;
    always_rst=0;
    inf.D.d_act = golden_act;
    golden_valid_task ;
    always_rst=0;
    @(negedge clk);
    golden_valid_task ;
    always_rst=0;
    inf.act_valid = 1'b0;
    golden_valid_task ;
    always_rst=0;
    inf.D = 'bx;
    golden_valid_task ;
    always_rst=0;

    gap_task;
    golden_valid_task ;
    always_rst=0;

    inf.id_valid = 1'b1;
    golden_valid_task ;
    always_rst=0;
    inf.D.d_id = golden_delivery_id;
    golden_valid_task ;
    always_rst=0;
    @(negedge clk);
    golden_valid_task ;
    always_rst=0;
    inf.id_valid = 1'b0;
    golden_valid_task ;
    always_rst=0;
    inf.D = 'bx;
    golden_valid_task ;
    always_rst=0;
end endtask
assign assign_rst[43]=0;
task input_order_task; begin
    golden_valid_task ;
    always_rst=0;
    r_r_id.randomize();
    golden_valid_task ;
    always_rst=0;
    golden_res_id = r_r_id.r_id;
    golden_valid_task ;
    always_rst=0;
    r_food_id.randomize();
    golden_valid_task ;
    always_rst=0;
    golden_food_id = r_food_id.food_id;
    golden_valid_task ;
    always_rst=0;
    r_food_num.randomize();
    golden_valid_task ;
    always_rst=0;
    golden_fd_num = r_food_num.food_num;
    golden_valid_task ;
    always_rst=0;

    inf.act_valid = 1'b1;
    golden_valid_task ;
    always_rst=0;
    inf.D.d_act = golden_act;
    golden_valid_task ;
    always_rst=0;
    @(negedge clk);
    golden_valid_task ;
    always_rst=0;
    inf.act_valid = 1'b0;
    golden_valid_task ;
    always_rst=0;
    inf.D = 'bx;
    golden_valid_task ;
    always_rst=0;

    gap_task;
    golden_valid_task ;
    always_rst=0;

    inf.res_valid = 1'b1;
    golden_valid_task ;
    always_rst=0;
    inf.D.d_res_id = golden_res_id;
    golden_valid_task ;
    always_rst=0;
    @(negedge clk);
    golden_valid_task ;
    always_rst=0;
    inf.res_valid = 1'b0;
    golden_valid_task ;
    always_rst=0;
    inf.D = 'bx;
    golden_valid_task ;
    always_rst=0;

    gap_task;
    golden_valid_task ;
    always_rst=0;

    inf.food_valid = 1'b1;
    golden_valid_task ;
    always_rst=0;
    inf.D.d_food_ID_ser = {golden_food_id, golden_fd_num};
    golden_valid_task ;
    always_rst=0;
    @(negedge clk);
    golden_valid_task ;
    always_rst=0;
    inf.food_valid = 1'b0;
    golden_valid_task ;
    always_rst=0;
    inf.D = 'bx;
    golden_valid_task ;
    always_rst=0;
end endtask
assign assign_rst[44]=0;
task input_cancel_task; begin
    golden_valid_task ;
    always_rst=0;
    r_r_id.randomize();
    golden_valid_task ;
    always_rst=0;
    golden_res_id = r_r_id.r_id;
    golden_valid_task ;
    always_rst=0;
    r_food_id.randomize();
    golden_valid_task ;
    always_rst=0;
    golden_food_id = r_food_id.food_id;
    golden_valid_task ;
    always_rst=0;
    r_d_id.randomize();
    golden_valid_task ;
    always_rst=0;
    golden_delivery_id = r_d_id.d_id;
    golden_valid_task ;
    always_rst=0;
    r_food_num.randomize();
    golden_valid_task ;
    always_rst=0;
    golden_fd_num = r_food_num.food_num;
    golden_valid_task ;
    always_rst=0;

    inf.act_valid = 1'b1;
    golden_valid_task ;
    always_rst=0;
    inf.D.d_act = golden_act;
    golden_valid_task ;
    always_rst=0;
    @(negedge clk);
    golden_valid_task ;
    always_rst=0;
    inf.act_valid = 1'b0;
    golden_valid_task ;
    always_rst=0;
    inf.D = 'bx;
    golden_valid_task ;
    always_rst=0;

    gap_task;
    golden_valid_task ;
    always_rst=0;

    inf.res_valid = 1'b1;
    golden_valid_task ;
    always_rst=0;
    inf.D.d_res_id = golden_res_id;
    golden_valid_task ;
    always_rst=0;
    @(negedge clk);
    golden_valid_task ;
    always_rst=0;
    inf.res_valid = 1'b0;
    golden_valid_task ;
    always_rst=0;
    inf.D = 'bx;
    golden_valid_task ;
    always_rst=0;

    gap_task;
    golden_valid_task ;
    always_rst=0;

    inf.food_valid = 1'b1;
    golden_valid_task ;
    always_rst=0;
    inf.D.d_food_ID_ser = {golden_food_id, 4'd0};
    golden_valid_task ;
    always_rst=0;
    @(negedge clk);
    golden_valid_task ;
    always_rst=0;
    inf.food_valid = 1'b0;
    golden_valid_task ;
    always_rst=0;
    inf.D = 'bx;
    golden_valid_task ;
    always_rst=0;

    gap_task;
    golden_valid_task ;
    always_rst=0;

    inf.id_valid = 1'b1;
    golden_valid_task ;
    always_rst=0;
    inf.D.d_id = golden_delivery_id;
    golden_valid_task ;
    always_rst=0;
    @(negedge clk);
    golden_valid_task ;
    always_rst=0;
    inf.id_valid = 1'b0;
    golden_valid_task ;
    always_rst=0;
    inf.D = 'bx;
    golden_valid_task ;
    always_rst=0;
end endtask
assign assign_rst[45]=0;
task compute_take_task; begin
    golden_cur_res_info = {golden_DRAM[base+golden_res_id*8], golden_DRAM[base+golden_res_id*8+1], golden_DRAM[base+golden_res_id*8+2], golden_DRAM[base+golden_res_id*8+3]};
    golden_valid_task ;
    always_rst=0;
    golden_cur_d_man_info = {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5], golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]};
    golden_valid_task ;
    always_rst=0;
    if(golden_cur_d_man_info.ctm_info1.ctm_status!=None && golden_cur_d_man_info.ctm_info2.ctm_status!=None)begin
        golden_valid_task ;
        always_rst=0;
        golden_complete = 1'b0;
        golden_valid_task ;
        always_rst=0;
        golden_out_info = 'd0;
        golden_valid_task ;
        always_rst=0;
        golden_err_msg = D_man_busy;
        golden_valid_task ;
        always_rst=0;
    end
    else begin
        golden_valid_task ;
        always_rst=0;
        if(golden_food_id==FOOD1 && golden_cur_res_info.ser_FOOD1>=golden_fd_num)begin //check food enough?
        golden_valid_task ;
        always_rst=0;
            if(golden_cust_status == VIP)begin //VIP
            golden_valid_task ;
            always_rst=0;
                if(golden_cur_d_man_info.ctm_info1.ctm_status==Normal && golden_cur_d_man_info.ctm_info2.ctm_status==None)begin
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_d_man_info.ctm_info2 = golden_cur_d_man_info.ctm_info1;
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_d_man_info.ctm_info1 = {golden_cust_status, golden_res_id, golden_food_id, golden_fd_num};
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_res_info.ser_FOOD1 = golden_cur_res_info.ser_FOOD1-golden_fd_num;
                    golden_valid_task ;
                    always_rst=0;
                    golden_complete = 1'b1;
                    golden_valid_task ;
                    always_rst=0;
                    golden_out_info = {golden_cur_d_man_info, golden_cur_res_info};
                    golden_valid_task ;
                    always_rst=0;
                    golden_err_msg = No_Err;//
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_res_id*8], golden_DRAM[base+golden_res_id*8+1], golden_DRAM[base+golden_res_id*8+2], golden_DRAM[base+golden_res_id*8+3]} = golden_cur_res_info;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5]} = golden_cur_d_man_info.ctm_info1;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]} = golden_cur_d_man_info.ctm_info2;
                    golden_valid_task ;
                    always_rst=0;
                end
                else if(golden_cur_d_man_info.ctm_info1.ctm_status==VIP && golden_cur_d_man_info.ctm_info2.ctm_status==None)begin
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_d_man_info.ctm_info2 = {golden_cust_status, golden_res_id, golden_food_id, golden_fd_num};
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_res_info.ser_FOOD1 = golden_cur_res_info.ser_FOOD1-golden_fd_num;
                    golden_valid_task ;
                    always_rst=0;
                    golden_complete = 1'b1;
                    golden_valid_task ;
                    always_rst=0;
                    golden_out_info = {golden_cur_d_man_info, golden_cur_res_info};
                    golden_valid_task ;
                    always_rst=0;
                    golden_err_msg = No_Err;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_res_id*8], golden_DRAM[base+golden_res_id*8+1], golden_DRAM[base+golden_res_id*8+2], golden_DRAM[base+golden_res_id*8+3]} = golden_cur_res_info;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5]} = golden_cur_d_man_info.ctm_info1;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]} = golden_cur_d_man_info.ctm_info2;
                    golden_valid_task ;
                    always_rst=0;
                end
                else begin
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_d_man_info.ctm_info1 = {golden_cust_status, golden_res_id, golden_food_id, golden_fd_num};
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_res_info.ser_FOOD1 = golden_cur_res_info.ser_FOOD1-golden_fd_num;
                    golden_valid_task ;
                    always_rst=0;
                    golden_complete = 1'b1;
                    golden_valid_task ;
                    always_rst=0;
                    golden_out_info = {golden_cur_d_man_info, golden_cur_res_info};
                    golden_valid_task ;
                    always_rst=0;
                    golden_err_msg = No_Err;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_res_id*8], golden_DRAM[base+golden_res_id*8+1], golden_DRAM[base+golden_res_id*8+2], golden_DRAM[base+golden_res_id*8+3]} = golden_cur_res_info;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5]} = golden_cur_d_man_info.ctm_info1;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]} = golden_cur_d_man_info.ctm_info2;
                    golden_valid_task ;
                    always_rst=0;
                end
            end
            else begin
                golden_valid_task ;
                always_rst=0;
                if(golden_cur_d_man_info.ctm_info1.ctm_status==None)begin
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_d_man_info.ctm_info1 = {golden_cust_status, golden_res_id, golden_food_id, golden_fd_num};
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_res_info.ser_FOOD1 = golden_cur_res_info.ser_FOOD1-golden_fd_num;
                    golden_valid_task ;
                    always_rst=0;
                    golden_complete = 1'b1;
                    golden_valid_task ;
                    always_rst=0;
                    golden_out_info = {golden_cur_d_man_info, golden_cur_res_info};
                    golden_valid_task ;
                    always_rst=0;
                    golden_err_msg = No_Err;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_res_id*8], golden_DRAM[base+golden_res_id*8+1], golden_DRAM[base+golden_res_id*8+2], golden_DRAM[base+golden_res_id*8+3]} = golden_cur_res_info;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5]} = golden_cur_d_man_info.ctm_info1;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]} = golden_cur_d_man_info.ctm_info2;
                    golden_valid_task ;
                    always_rst=0;
                end
                else if(golden_cur_d_man_info.ctm_info2.ctm_status==None)begin
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_d_man_info.ctm_info2 = {golden_cust_status, golden_res_id, golden_food_id, golden_fd_num};
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_res_info.ser_FOOD1 = golden_cur_res_info.ser_FOOD1-golden_fd_num;
                    golden_valid_task ;
                    always_rst=0;
                    golden_complete = 1'b1;
                    golden_valid_task ;
                    always_rst=0;
                    golden_out_info = {golden_cur_d_man_info, golden_cur_res_info};
                    golden_valid_task ;
                    always_rst=0;
                    golden_err_msg = No_Err;
                    golden_valid_task ;
                    always_rst=0;
                    
                    {golden_DRAM[base+golden_res_id*8], golden_DRAM[base+golden_res_id*8+1], golden_DRAM[base+golden_res_id*8+2], golden_DRAM[base+golden_res_id*8+3]} = golden_cur_res_info;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5]} = golden_cur_d_man_info.ctm_info1;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]} = golden_cur_d_man_info.ctm_info2;
                    golden_valid_task ;
                    always_rst=0;
                end
                else begin
                    golden_valid_task ;
                    always_rst=0;
                    golden_valid_task ;
                    golden_complete = 1'b0;
                    golden_valid_task ;
                    always_rst=0;
                    golden_out_info = 'd0;
                    golden_valid_task ;
                    always_rst=0;
                    golden_err_msg = D_man_busy;
                    golden_valid_task ;
                    always_rst=0;
                end
            end
        end
        else if(golden_food_id==FOOD2 && golden_cur_res_info.ser_FOOD2>=golden_fd_num)begin
            golden_valid_task ;
            always_rst=0;
            if(golden_cust_status == VIP)begin //VIP
            golden_valid_task ;
            always_rst=0;
                if(golden_cur_d_man_info.ctm_info1.ctm_status==Normal && golden_cur_d_man_info.ctm_info2.ctm_status==None)begin
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_d_man_info.ctm_info2 = golden_cur_d_man_info.ctm_info1;
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_d_man_info.ctm_info1 = {golden_cust_status, golden_res_id, golden_food_id, golden_fd_num};
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_res_info.ser_FOOD2 = golden_cur_res_info.ser_FOOD2-golden_fd_num;
                    golden_valid_task ;
                    always_rst=0;
                    golden_complete = 1'b1;
                    golden_valid_task ;
                    always_rst=0;
                    golden_out_info = {golden_cur_d_man_info, golden_cur_res_info};
                    golden_valid_task ;
                    always_rst=0;
                    golden_err_msg = No_Err;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_res_id*8], golden_DRAM[base+golden_res_id*8+1], golden_DRAM[base+golden_res_id*8+2], golden_DRAM[base+golden_res_id*8+3]} = golden_cur_res_info;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5]} = golden_cur_d_man_info.ctm_info1;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]} = golden_cur_d_man_info.ctm_info2;
                    golden_valid_task ;
                    always_rst=0;
                end
                else if(golden_cur_d_man_info.ctm_info1.ctm_status==VIP && golden_cur_d_man_info.ctm_info2.ctm_status==None)begin
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_d_man_info.ctm_info2 = {golden_cust_status, golden_res_id, golden_food_id, golden_fd_num};
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_res_info.ser_FOOD2 = golden_cur_res_info.ser_FOOD2-golden_fd_num;
                    golden_valid_task ;
                    always_rst=0;
                    golden_complete = 1'b1;
                    golden_valid_task ;
                    always_rst=0;
                    golden_out_info = {golden_cur_d_man_info, golden_cur_res_info};
                    golden_valid_task ;
                    always_rst=0;
                    golden_err_msg = No_Err;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_res_id*8], golden_DRAM[base+golden_res_id*8+1], golden_DRAM[base+golden_res_id*8+2], golden_DRAM[base+golden_res_id*8+3]} = golden_cur_res_info;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5]} = golden_cur_d_man_info.ctm_info1;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]} = golden_cur_d_man_info.ctm_info2;
                    golden_valid_task ;
                    always_rst=0;
                end
                else begin
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_d_man_info.ctm_info1 = {golden_cust_status, golden_res_id, golden_food_id, golden_fd_num};
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_res_info.ser_FOOD2 = golden_cur_res_info.ser_FOOD2-golden_fd_num;
                    golden_valid_task ;
                    always_rst=0;
                    golden_complete = 1'b1;
                    golden_valid_task ;
                    always_rst=0;
                    golden_out_info = {golden_cur_d_man_info, golden_cur_res_info};
                    golden_valid_task ;
                    always_rst=0;
                    golden_err_msg = No_Err;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_res_id*8], golden_DRAM[base+golden_res_id*8+1], golden_DRAM[base+golden_res_id*8+2], golden_DRAM[base+golden_res_id*8+3]} = golden_cur_res_info;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5]} = golden_cur_d_man_info.ctm_info1;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]} = golden_cur_d_man_info.ctm_info2;
                    golden_valid_task ;
                    always_rst=0;
                end
            end
            else begin
                golden_valid_task ;
                always_rst=0;
                if(golden_cur_d_man_info.ctm_info1.ctm_status==None)begin
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_d_man_info.ctm_info1 = {golden_cust_status, golden_res_id, golden_food_id, golden_fd_num};
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_res_info.ser_FOOD2 = golden_cur_res_info.ser_FOOD2-golden_fd_num;
                    golden_valid_task ;
                    always_rst=0;
                    golden_valid_task ;
                    golden_complete = 1'b1;
                    golden_valid_task ;
                    always_rst=0;
                    golden_out_info = {golden_cur_d_man_info, golden_cur_res_info};
                    golden_valid_task ;
                    always_rst=0;
                    golden_err_msg = No_Err;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_res_id*8], golden_DRAM[base+golden_res_id*8+1], golden_DRAM[base+golden_res_id*8+2], golden_DRAM[base+golden_res_id*8+3]} = golden_cur_res_info;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5]} = golden_cur_d_man_info.ctm_info1;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]} = golden_cur_d_man_info.ctm_info2;
                    golden_valid_task ;
                    always_rst=0;
                end
                else if(golden_cur_d_man_info.ctm_info2.ctm_status==None)begin
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_d_man_info.ctm_info2 = {golden_cust_status, golden_res_id, golden_food_id, golden_fd_num};
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_res_info.ser_FOOD2 = golden_cur_res_info.ser_FOOD2-golden_fd_num;
                    golden_valid_task ;
                    always_rst=0;
                    golden_complete = 1'b1;
                    golden_valid_task ;
                    always_rst=0;
                    golden_out_info = {golden_cur_d_man_info, golden_cur_res_info};
                    golden_valid_task ;
                    always_rst=0;
                    golden_err_msg = No_Err;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_res_id*8], golden_DRAM[base+golden_res_id*8+1], golden_DRAM[base+golden_res_id*8+2], golden_DRAM[base+golden_res_id*8+3]} = golden_cur_res_info;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5]} = golden_cur_d_man_info.ctm_info1;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]} = golden_cur_d_man_info.ctm_info2;
                    golden_valid_task ;
                    always_rst=0;
                end
                else begin
                    golden_valid_task ;
                    always_rst=0;
                    golden_complete = 1'b0;
                    golden_valid_task ;
                    always_rst=0;
                    golden_out_info = 'd0;
                    golden_valid_task ;
                    always_rst=0;
                    golden_err_msg = D_man_busy;
                    golden_valid_task ;
                    always_rst=0;
                end
            end
        end
        else if(golden_food_id==FOOD3 && golden_cur_res_info.ser_FOOD3>=golden_fd_num)begin
            golden_valid_task ;
            always_rst=0;
            if(golden_cust_status == VIP)begin //VIP
            golden_valid_task ;
            always_rst=0;
                if(golden_cur_d_man_info.ctm_info1.ctm_status==Normal && golden_cur_d_man_info.ctm_info2.ctm_status==None)begin
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_d_man_info.ctm_info2 = golden_cur_d_man_info.ctm_info1;
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_d_man_info.ctm_info1 = {golden_cust_status, golden_res_id, golden_food_id, golden_fd_num};
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_res_info.ser_FOOD3 = golden_cur_res_info.ser_FOOD3-golden_fd_num;
                    golden_valid_task ;
                    always_rst=0;
                    golden_complete = 1'b1;
                    golden_valid_task ;
                    always_rst=0;
                    golden_out_info = {golden_cur_d_man_info, golden_cur_res_info};
                    golden_valid_task ;
                    always_rst=0;
                    golden_err_msg = No_Err;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_res_id*8], golden_DRAM[base+golden_res_id*8+1], golden_DRAM[base+golden_res_id*8+2], golden_DRAM[base+golden_res_id*8+3]} = golden_cur_res_info;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5]} = golden_cur_d_man_info.ctm_info1;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]} = golden_cur_d_man_info.ctm_info2;
                    golden_valid_task ;
                    always_rst=0;
                end
                else if(golden_cur_d_man_info.ctm_info1.ctm_status==VIP && golden_cur_d_man_info.ctm_info2.ctm_status==None)begin
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_d_man_info.ctm_info2 = {golden_cust_status, golden_res_id, golden_food_id, golden_fd_num};
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_res_info.ser_FOOD3 = golden_cur_res_info.ser_FOOD3-golden_fd_num;
                    golden_valid_task ;
                    always_rst=0;
                    golden_complete = 1'b1;
                    golden_valid_task ;
                    always_rst=0;
                    golden_out_info = {golden_cur_d_man_info, golden_cur_res_info};
                    golden_valid_task ;
                    always_rst=0;
                    golden_err_msg = No_Err;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_res_id*8], golden_DRAM[base+golden_res_id*8+1], golden_DRAM[base+golden_res_id*8+2], golden_DRAM[base+golden_res_id*8+3]} = golden_cur_res_info;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5]} = golden_cur_d_man_info.ctm_info1;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]} = golden_cur_d_man_info.ctm_info2;
                    golden_valid_task ;
                    always_rst=0;
                end
                else begin
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_d_man_info.ctm_info1 = {golden_cust_status, golden_res_id, golden_food_id, golden_fd_num};
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_res_info.ser_FOOD3 = golden_cur_res_info.ser_FOOD3-golden_fd_num;
                    golden_valid_task ;
                    always_rst=0;
                    golden_complete = 1'b1;
                    golden_valid_task ;
                    always_rst=0;
                    golden_out_info = {golden_cur_d_man_info, golden_cur_res_info};
                    golden_valid_task ;
                    always_rst=0;
                    golden_err_msg = No_Err;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_res_id*8], golden_DRAM[base+golden_res_id*8+1], golden_DRAM[base+golden_res_id*8+2], golden_DRAM[base+golden_res_id*8+3]} = golden_cur_res_info;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5]} = golden_cur_d_man_info.ctm_info1;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]} = golden_cur_d_man_info.ctm_info2;
                    golden_valid_task ;
                    always_rst=0;
                end
            end
            else begin
                if(golden_cur_d_man_info.ctm_info1.ctm_status==None)begin
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_d_man_info.ctm_info1 = {golden_cust_status, golden_res_id, golden_food_id, golden_fd_num};
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_res_info.ser_FOOD3 = golden_cur_res_info.ser_FOOD3-golden_fd_num;
                    golden_valid_task ;
                    always_rst=0;
                    golden_complete = 1'b1;
                    golden_valid_task ;
                    always_rst=0;
                    golden_out_info = {golden_cur_d_man_info, golden_cur_res_info};
                    golden_valid_task ;
                    always_rst=0;
                    golden_err_msg = No_Err;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_res_id*8], golden_DRAM[base+golden_res_id*8+1], golden_DRAM[base+golden_res_id*8+2], golden_DRAM[base+golden_res_id*8+3]} = golden_cur_res_info;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5]} = golden_cur_d_man_info.ctm_info1;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]} = golden_cur_d_man_info.ctm_info2;
                    golden_valid_task ;
                    always_rst=0;
                end
                else if(golden_cur_d_man_info.ctm_info2.ctm_status==None)begin
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_d_man_info.ctm_info2 = {golden_cust_status, golden_res_id, golden_food_id, golden_fd_num};
                    golden_valid_task ;
                    always_rst=0;
                    golden_cur_res_info.ser_FOOD3 = golden_cur_res_info.ser_FOOD3-golden_fd_num;
                    golden_valid_task ;
                    always_rst=0;
                    golden_complete = 1'b1;
                    golden_valid_task ;
                    always_rst=0;
                    golden_out_info = {golden_cur_d_man_info, golden_cur_res_info};
                    golden_valid_task ;
                    always_rst=0;
                    golden_err_msg = No_Err;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_res_id*8], golden_DRAM[base+golden_res_id*8+1], golden_DRAM[base+golden_res_id*8+2], golden_DRAM[base+golden_res_id*8+3]} = golden_cur_res_info;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5]} = golden_cur_d_man_info.ctm_info1;
                    golden_valid_task ;
                    always_rst=0;
                    {golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]} = golden_cur_d_man_info.ctm_info2;
                    golden_valid_task ;
                    always_rst=0;
                end
                else begin
                    golden_valid_task ;
                    always_rst=0;
                    golden_complete = 1'b0;
                    golden_valid_task ;
                    always_rst=0;
                    golden_out_info = 'd0;
                    golden_valid_task ;
                    always_rst=0;
                    golden_err_msg = D_man_busy;
                    golden_valid_task ;
                    always_rst=0;
                end
            end
        end
        else begin //no food
        golden_valid_task ;
        always_rst=0;
            golden_complete = 1'b0;
            golden_valid_task ;
            always_rst=0;
            golden_out_info = 'd0;
            golden_valid_task ;
            always_rst=0;
            golden_err_msg = No_Food;
            golden_valid_task ;
            always_rst=0;
        end
    end
end endtask
assign assign_rst[46]=0;
task compute_deliver_task; begin
    golden_valid_task ;
    always_rst=0;
    golden_cur_d_man_info = {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5], golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]};
    golden_valid_task ;
    always_rst=0;
    if(golden_cur_d_man_info.ctm_info1.ctm_status[1:0] == None)begin //no customer
    golden_valid_task ;
    always_rst=0;
        golden_complete = 1'b0;
        golden_valid_task ;
        always_rst=0;
        golden_out_info = 'd0;
        golden_valid_task ;
        always_rst=0;
        golden_err_msg = No_customers;
        golden_valid_task ;
        always_rst=0;
    end
    else begin
        golden_valid_task ;
        always_rst=0;
        golden_cur_d_man_info.ctm_info1 = golden_cur_d_man_info.ctm_info2;
        golden_valid_task ;
        always_rst=0;
        golden_cur_d_man_info.ctm_info2 = 'd0;
        golden_valid_task ;
        always_rst=0;
        golden_complete = 1'b1;
        golden_valid_task ;
        always_rst=0;
        golden_out_info = {golden_cur_d_man_info, 32'd0};
        golden_valid_task ;
        always_rst=0;
        golden_err_msg = No_Err;
        golden_valid_task ;
        always_rst=0;
        {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5]} = golden_cur_d_man_info.ctm_info1;
        golden_valid_task ;
        always_rst=0;
        {golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]} = golden_cur_d_man_info.ctm_info2;
        golden_valid_task ;
        always_rst=0;
    end
    golden_valid_task ;
    always_rst=0;
end endtask
assign assign_rst[47]=0;
task compute_order_task; begin
    golden_valid_task ;
    always_rst=0;
    golden_valid_task ;
    always_rst=0;
    golden_cur_res_info = {golden_DRAM[base+golden_res_id*8], golden_DRAM[base+golden_res_id*8+1], golden_DRAM[base+golden_res_id*8+2], golden_DRAM[base+golden_res_id*8+3]};
    golden_valid_task ;
    always_rst=0;
    if(golden_food_id==FOOD1)begin
        golden_valid_task ;
        always_rst=0;
        if({1'b0, golden_cur_res_info.limit_num_orders} >= {1'b0, golden_cur_res_info.ser_FOOD1}+{1'b0, golden_cur_res_info.ser_FOOD2}+{1'b0, golden_cur_res_info.ser_FOOD3}+golden_fd_num)begin
            golden_valid_task ;
            always_rst=0;
            golden_cur_res_info.ser_FOOD1 = golden_cur_res_info.ser_FOOD1 + golden_fd_num;
            golden_valid_task ;
            always_rst=0;
            golden_complete = 1'b1; 
            golden_valid_task ;
            always_rst=0;
            golden_out_info = {32'd0, golden_cur_res_info};
            golden_valid_task ;
            always_rst=0;
            golden_err_msg = No_Err;
            golden_valid_task ;
            always_rst=0;
            {golden_DRAM[base+golden_res_id*8], golden_DRAM[base+golden_res_id*8+1], golden_DRAM[base+golden_res_id*8+2], golden_DRAM[base+golden_res_id*8+3]} = golden_cur_res_info;
            golden_valid_task ;
            always_rst=0;
        end
        else begin
            golden_valid_task ;
            always_rst=0;
            golden_complete = 1'b0;
            golden_valid_task ;
            always_rst=0;
            golden_err_msg = Res_busy;
            golden_valid_task ;
            always_rst=0;
            golden_out_info = 'd0;
            golden_valid_task ;
            always_rst=0;
        end
    end
    else if(golden_food_id==FOOD2)begin
        golden_valid_task ;
        always_rst=0;
        if({1'b0, golden_cur_res_info.limit_num_orders} >= {1'b0, golden_cur_res_info.ser_FOOD1}+{1'b0, golden_cur_res_info.ser_FOOD2}+{1'b0, golden_cur_res_info.ser_FOOD3}+golden_fd_num)begin
            golden_valid_task ;
            always_rst=0;
            golden_cur_res_info.ser_FOOD2 = golden_cur_res_info.ser_FOOD2 + golden_fd_num;
            golden_valid_task ;
            always_rst=0;
            golden_complete = 1'b1; 
            golden_valid_task ;
            always_rst=0;
            golden_out_info = {32'd0, golden_cur_res_info};
            golden_valid_task ;
            always_rst=0;
            golden_err_msg = No_Err;
            golden_valid_task ;
            always_rst=0;
            {golden_DRAM[base+golden_res_id*8], golden_DRAM[base+golden_res_id*8+1], golden_DRAM[base+golden_res_id*8+2], golden_DRAM[base+golden_res_id*8+3]} = golden_cur_res_info;
            golden_valid_task ;
            always_rst=0;
        end
        else begin
            golden_valid_task ;
            always_rst=0;
            golden_complete = 1'b0;
            golden_valid_task ;
            always_rst=0;
            golden_err_msg = Res_busy;
            golden_valid_task ;
            always_rst=0;
            golden_out_info = 'd0;
            golden_valid_task ;
            always_rst=0;
        end
    end
    else if(golden_food_id==FOOD3)begin
        golden_valid_task ;
        always_rst=0;
        if({1'b0, golden_cur_res_info.limit_num_orders} >= {1'b0, golden_cur_res_info.ser_FOOD1}+{1'b0, golden_cur_res_info.ser_FOOD2}+{1'b0, golden_cur_res_info.ser_FOOD3}+golden_fd_num)begin
            golden_valid_task ;
            always_rst=0;
            golden_cur_res_info.ser_FOOD3 = golden_cur_res_info.ser_FOOD3 + golden_fd_num;
            golden_valid_task ;
            always_rst=0;
            golden_complete = 1'b1;
            golden_valid_task ;
            always_rst=0;
            golden_out_info = {32'd0, golden_cur_res_info};
            golden_valid_task ;
            always_rst=0;
            golden_err_msg = No_Err;
            golden_valid_task ;
            always_rst=0;
            {golden_DRAM[base+golden_res_id*8], golden_DRAM[base+golden_res_id*8+1], golden_DRAM[base+golden_res_id*8+2], golden_DRAM[base+golden_res_id*8+3]} = golden_cur_res_info;
            golden_valid_task ;
            always_rst=0;
        end
        else begin
            golden_valid_task ;
            always_rst=0;
            golden_complete = 1'b0;
            golden_valid_task ;
            always_rst=0;
            golden_err_msg = Res_busy;
            golden_valid_task ;
            always_rst=0;
            golden_out_info = 'd0;
            golden_valid_task ;
            always_rst=0;
        end
    end
end endtask
assign assign_rst[48]=0;
task compute_cancel_task; begin
    golden_valid_task ;
    always_rst=0;
    golden_cur_d_man_info = {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5], golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]};
    golden_valid_task ;
    always_rst=0;
    if(golden_cur_d_man_info.ctm_info1.ctm_status[1:0]!=None )begin
        golden_valid_task ;
        always_rst=0;
        if(golden_cur_d_man_info.ctm_info1.res_ID[7:0]==golden_res_id && golden_cur_d_man_info.ctm_info2.res_ID[7:0]==golden_res_id)begin
            golden_valid_task ;
            always_rst=0;
            if(golden_cur_d_man_info.ctm_info1.food_ID[1:0]==golden_food_id && golden_cur_d_man_info.ctm_info2.food_ID[1:0]==golden_food_id)begin
                golden_valid_task ;
                always_rst=0;
                golden_cur_d_man_info = 'd0;
                golden_valid_task ;
                always_rst=0;
                golden_complete = 1'b1;
                golden_valid_task ;
                always_rst=0;
                golden_out_info = {golden_cur_d_man_info, 32'd0};
                golden_valid_task ;
                always_rst=0;
                golden_err_msg = No_Err;
                golden_valid_task ;
                always_rst=0;
                {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5]} = golden_cur_d_man_info.ctm_info1;
                golden_valid_task ;
                always_rst=0;
                {golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]} = golden_cur_d_man_info.ctm_info2;
                golden_valid_task ;
                always_rst=0;
            end
            else if(golden_cur_d_man_info.ctm_info1.food_ID[1:0]==golden_food_id)begin
                golden_valid_task ;
                always_rst=0;
                golden_cur_d_man_info.ctm_info1 = golden_cur_d_man_info.ctm_info2;
                golden_valid_task ;
                always_rst=0;
                golden_cur_d_man_info.ctm_info2 = 'd0;
                golden_valid_task ;
                always_rst=0;
                golden_complete = 1'b1;
                golden_valid_task ;
                always_rst=0;
                golden_out_info = {golden_cur_d_man_info, 32'd0};
                golden_valid_task ;
                always_rst=0;
                golden_err_msg = No_Err;
                golden_valid_task ;
                always_rst=0;
                {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5]} = golden_cur_d_man_info.ctm_info1;
                golden_valid_task ;
                always_rst=0;
                {golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]} = golden_cur_d_man_info.ctm_info2;
                golden_valid_task ;
                always_rst=0;
            end
            else if(golden_cur_d_man_info.ctm_info2.food_ID[1:0]==golden_food_id)begin
                golden_valid_task ;
                always_rst=0;
                golden_cur_d_man_info.ctm_info2 = 'd0;
                golden_valid_task ;
                always_rst=0;
                golden_complete = 1'b1;
                golden_valid_task ;
                always_rst=0;
                golden_out_info = {golden_cur_d_man_info, 32'd0};
                golden_valid_task ;
                always_rst=0;
                golden_err_msg = No_Err;
                golden_valid_task ;
                always_rst=0;
                {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5]} = golden_cur_d_man_info.ctm_info1;
                golden_valid_task ;
                always_rst=0;
                {golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]} = golden_cur_d_man_info.ctm_info2;
                golden_valid_task ;
                always_rst=0;
            end
            else begin
                golden_valid_task ;
                always_rst=0;
                golden_complete = 1'b0;
                golden_valid_task ;
                always_rst=0;
                golden_out_info = 'd0;
                golden_valid_task ;
                always_rst=0;
                golden_err_msg = Wrong_food_ID;
                golden_valid_task ;
                always_rst=0;
            end
        end
        else if(golden_cur_d_man_info.ctm_info1.res_ID[7:0]==golden_res_id)begin
            golden_valid_task ;
            always_rst=0;
            if(golden_cur_d_man_info.ctm_info1.food_ID[1:0]==golden_food_id)begin
                golden_valid_task ;
                always_rst=0;
                golden_cur_d_man_info.ctm_info1 = golden_cur_d_man_info.ctm_info2;
                golden_valid_task ;
                always_rst=0;
                golden_cur_d_man_info.ctm_info2 = 'd0;
                golden_valid_task ;
                always_rst=0;
                golden_complete = 1'b1;
                golden_valid_task ;
                always_rst=0;
                golden_out_info = {golden_cur_d_man_info, 32'd0};
                golden_valid_task ;
                always_rst=0;
                golden_err_msg = No_Err;
                golden_valid_task ;
                always_rst=0;
                {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5]} = golden_cur_d_man_info.ctm_info1;
                golden_valid_task ;
                always_rst=0;
                {golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]} = golden_cur_d_man_info.ctm_info2;
                golden_valid_task ;
                always_rst=0;
            end
            else begin
                golden_valid_task ;
                always_rst=0;
                golden_complete = 1'b0;
                golden_valid_task ;
                always_rst=0;
                golden_out_info = 'd0;
                golden_valid_task ;
                always_rst=0;
                golden_err_msg = Wrong_food_ID;
                golden_valid_task ;
                always_rst=0;
            end 
        end
        else if(golden_cur_d_man_info.ctm_info2.res_ID[7:0]==golden_res_id)begin
            golden_valid_task ;
            always_rst=0;
            if(golden_cur_d_man_info.ctm_info2.food_ID[1:0]==golden_food_id)begin
                golden_valid_task ;
                always_rst=0;
                golden_cur_d_man_info.ctm_info2 = 'd0;
                golden_valid_task ;
                always_rst=0;
                golden_complete = 1'b1;
                golden_valid_task ;
                always_rst=0;
                golden_out_info = {golden_cur_d_man_info, 32'd0};
                golden_valid_task ;
                always_rst=0;
                golden_err_msg = No_Err;
                golden_valid_task ;
                always_rst=0;
                {golden_DRAM[base+golden_delivery_id*8+4], golden_DRAM[base+golden_delivery_id*8+5]} = golden_cur_d_man_info.ctm_info1;
                golden_valid_task ;
                always_rst=0;
                {golden_DRAM[base+golden_delivery_id*8+6], golden_DRAM[base+golden_delivery_id*8+7]} = golden_cur_d_man_info.ctm_info2;
                golden_valid_task ;
                always_rst=0;
            end
            else begin
                golden_valid_task ;
                always_rst=0;
                golden_complete = 1'b0;
                golden_valid_task ;
                always_rst=0;
                golden_out_info = 'd0;
                golden_valid_task ;
                always_rst=0;
                golden_err_msg = Wrong_food_ID;
                golden_valid_task ;
                always_rst=0;
            end
        end
        else begin
            golden_valid_task ;
            always_rst=0;
            golden_complete = 1'b0;
            golden_valid_task ;
            always_rst=0;
            golden_out_info = 'd0;
            golden_valid_task ;
            always_rst=0;
            golden_err_msg = Wrong_res_ID;
            golden_valid_task ;
            always_rst=0;
        end
    end
    else begin
        golden_valid_task ;
        always_rst=0;
        golden_complete = 1'b0;
        golden_valid_task ;
        always_rst=0;
        golden_out_info = 'd0;
        golden_valid_task ;
        always_rst=0;
        golden_err_msg = Wrong_cancel;
        golden_valid_task ;
        always_rst=0;
    end
end endtask
assign assign_rst[49]=0;
task wait_out_valid_task; begin
    golden_valid_task ;
    always_rst=0;
    latency = 0;
    golden_valid_task ;
    always_rst=0;
    while(inf.out_valid !== 1'b1)begin
        golden_valid_task ;
        always_rst=0;
        latency = latency + 1;
        golden_valid_task ;
        always_rst=0;
        golden_valid_task ;
        always_rst=0;
        @(negedge clk);
    end
end endtask
assign assign_rst[50]=0;
task check_output_task; begin
    golden_valid_task ;
    always_rst=0;
        if(inf.complete !== golden_complete)begin
            golden_valid_task ;
            always_rst=0;
            $display ("Wrong Answer");
            golden_valid_task ;
            always_rst=0;
            $finish;
        end
        if(inf.out_info !== golden_out_info)begin
            golden_valid_task ;
            always_rst=0;
            $display ("Wrong Answer");
            golden_valid_task ;
            always_rst=0;
        
            $finish;
        end
        if(inf.err_msg !== golden_err_msg)begin
            golden_valid_task ;
            always_rst=0;
            $display ("Wrong Answer");
            golden_valid_task ;
            always_rst=0;
        
            $finish;
        end
end endtask
assign assign_rst[51]=0;
task YOU_PASS_task;   begin
    golden_valid_task ;
    always_rst=0;
    //$display ("pass");
    golden_valid_task ;
    always_rst=0;
    $finish;
end endtask
assign assign_rst[52]=0;

task golden_valid_task;begin
    if(always_rst == 1) 
        golden_valid = 0;
    else 
        golden_valid = 1;
end endtask



endprogram