module Checker(input clk, INF.CHECKER inf);
import usertype::*;

//declare other cover group
covergroup Spec1 @(posedge clk && inf.id_valid);
   	coverpoint inf.D.d_id[0] 
    {
   		option.at_least=1;
   		option.auto_bin_max=256;
   	}
endgroup:Spec1

covergroup Spec2 @(posedge clk && inf.act_valid);
   	coverpoint inf.D.d_act[0] 
    {
   		option.at_least=10;
   		bins b[] = (Take, Order, Deliver, Cancel => Take, Order, Deliver, Cancel) ;
   	}
endgroup:Spec2

covergroup Spec3 @(negedge clk && inf.out_valid);
	coverpoint inf.complete 
    {
		option.at_least=200;
		bins b1={0};
		bins b2={1};
	}
endgroup:Spec3

covergroup Spec4 @(negedge clk && inf.out_valid);
	coverpoint inf.err_msg 
    {
		option.at_least=20;
		bins b1={No_Food};
		bins b2={D_man_busy};
		bins b3={No_customers};
		bins b4={Res_busy};
        bins b5={Wrong_cancel};
		bins b6={Wrong_res_ID};
		bins b7={Wrong_food_ID};
	}
endgroup : Spec4

Spec1 cov_inst_1 = new();
Spec2 cov_inst_2 = new();
Spec3 cov_inst_3 = new();
Spec4 cov_inst_4 = new();

//************************************ below assertion is to check your pattern ***************************************** 
//                                          Please finish and hand in it
// This is an example assertion given by TA, please write the required assertions below
//  assert_interval : assert property ( @(posedge clk)  inf.out_valid |=> inf.id_valid == 0 [*2])
//  else
//  begin
//  	$display("Assertion X is violated");
//  	$fatal; 
//  end
wire #(0.5) rst_reg = inf.rst_n;
//write other assertions
Action act ;
always_ff @(posedge clk or negedge inf.rst_n)  begin
	if (!inf.rst_n)				act <= No_action ;
	else begin 
		if (inf.act_valid==1) 	act <= inf.D.d_act[0] ;
	end
end

// Assertion 1 ( All outputs signals (including FD.sv and bridge.sv) should be zero after reset.)
/*
always @(negedge inf.rst_n) begin
	#1;
	assert_1_FD : assert ((inf.out_valid===0)&&(inf.err_msg===No_Err)&&(inf.complete===0)&&(inf.out_info===0)&&
						(inf.C_addr===0) && (inf.C_data_w===0) && (inf.C_in_valid===0) && (inf.C_r_wb===0))
	else begin
		$display("Assertion 1 is violated");
		$fatal; 
	end
end
always @(negedge inf.rst_n) begin
	#1;
	assert_1_bridge : assert ((inf.C_out_valid ===0) && (inf.C_data_r ===0) && (inf.AR_VALID ===0) && (inf.AR_ADDR === 0) && (inf.B_READY ===0)&&
								(inf.R_READY === 0) && (inf.AW_VALID ===0 ) &&(inf.AW_ADDR === 0) && (inf.W_VALID ===0) && (inf.W_DATA === 0))
	else begin
		$display("Assertion 1 is violated");
		$fatal; 
	end
end
*/
always_ff @(negedge rst_reg) begin
	assert_1_FD : assert ((inf.out_valid===0)&&(inf.err_msg===No_Err)&&(inf.complete===0)&&(inf.out_info===0)&&
						(inf.C_addr===0) && (inf.C_data_w===0) && (inf.C_in_valid===0) && (inf.C_r_wb===0))
	else begin
		$display("Assertion 1 is violated");
		$fatal; 
	end
end
always_ff @(negedge rst_reg) begin
	assert_1_bridge : assert ((inf.C_out_valid ===0) && (inf.C_data_r ===0) && (inf.AR_VALID ===0) && (inf.AR_ADDR === 0) && (inf.B_READY ===0)&&
								(inf.R_READY === 0) && (inf.AW_VALID ===0 ) &&(inf.AW_ADDR === 0) && (inf.W_VALID ===0) && (inf.W_DATA === 0))
	else begin
		$display("Assertion 1 is violated");
		$fatal; 
	end
end
// Assertion 2  If action is completed, err_msg should be 4’b0.

assert_2 : assert property ( @(posedge clk) ((inf.out_valid==1) && inf.complete===1) |-> (inf.err_msg===No_Err) )
 else
 begin
 	$display("Assertion 2 is violated");
 	$fatal; 
 end

// Assertion 3  If action is not completed, out_info should be 64’b0.

assert_3 : assert property ( @(posedge clk) ((inf.out_valid==1) &&(inf.complete===0)) |-> (inf.out_info===0) )
 else
 begin
 	$display("Assertion 3 is violated");
 	$fatal; 
 end

// Assertion 4  The gap between each input valid is at least 1 cycle and at most 5 cycles.

assert_4_1_1 : assert property ( @(posedge clk) ((inf.D.d_act[0]===Take) && (inf.act_valid===1)) |=>!inf.id_valid && !inf.cus_valid ##[1:5] (inf.id_valid || inf.cus_valid) )
else
begin
 	$display("Assertion 4 is violated");
 	$fatal; 
end

assert_4_1_2 : assert property ( @(posedge clk) ((act==Take) && (inf.id_valid===1)) |=> !inf.cus_valid ##[1:5] ( inf.cus_valid===1 ) )
else
begin
 	$display("Assertion 4 is violated");
 	$fatal; 
end

assert_4_2_1 : assert property ( @(posedge clk) ((inf.D.d_act[0]===Deliver) && (inf.act_valid===1)) |=>!inf.id_valid  ##[1:5] ( inf.id_valid) )
else
begin
 	$display("Assertion 4 is violated");
 	$fatal; 
end



assert_4_3_1 : assert property ( @(posedge clk) ((inf.D.d_act[0]===Order) && (inf.act_valid===1)) |=>!inf.res_valid && !inf.food_valid ##[1:5] ( inf.res_valid || inf.food_valid) )
else
begin
 	$display("Assertion 4 is violated");
 	$fatal; 
end


assert_4_3_2 : assert property ( @(posedge clk) ((act==Order) && (inf.res_valid===1)) |=> !inf.food_valid ##[1:5]  ( inf.food_valid===1) )
else
begin
 	$display("Assertion 4 is violated");
 	$fatal; 
end



assert_4_4_1 : assert property ( @(posedge clk) ((inf.D.d_act[0]===Cancel) && (inf.act_valid===1)) |=> !inf.res_valid  ##[1:5] ( inf.res_valid) )
else
begin
 	$display("Assertion 4 is violated");
 	$fatal; 
end


assert_4_4_2 : assert property ( @(posedge clk) ((act==Cancel) && (inf.res_valid===1)) |=>!inf.food_valid ##[1:5] ( inf.food_valid===1) )
else
begin
 	$display("Assertion 4 is violated");
 	$fatal; 
end


assert_4_4_3 : assert property ( @(posedge clk) ((act==Cancel) && (inf.food_valid===1)) |=>!inf.id_valid ##[1:5] ( inf.id_valid===1) )
else
begin
 	$display("Assertion 4 is violated");
 	$fatal; 
end

// Assertion 5   All input valid signals won’t overlap with each other.

logic no_lap;
assign no_lap = !( inf.id_valid || inf.act_valid || inf.cus_valid || inf.res_valid || inf.food_valid ) ;
assert_5 :assert property ( @(posedge clk)   $onehot({ inf.id_valid, inf.act_valid, inf.res_valid, inf.cus_valid , inf.food_valid , no_lap}) )  
else
begin
 	$display("Assertion 5 is violated");
 	$fatal; 
end

// Assertion 6   Out_valid can only be high for exactly one cycle

assert_6 : assert property ( @(posedge clk)  (inf.out_valid===1) |=> (inf.out_valid===0) )
else
begin
	$display("Assertion 6 is violated");
	$fatal; 
end

// Assertion 7    Next operation will be valid 2-10 cycles after out_valid fall


assert_7:assert property ( @(posedge clk) (inf.out_valid==1)  |-> ##[2:10] ( inf.act_valid===1) )  
else 
begin
 	$display("Assertion 7 is violated");
 	$fatal; 
end



// Assertion 8    Latency should be less than 1200 cycles for each operation.

assert_8_1 : assert property( @(posedge clk) ((act == Take) && (inf.cus_valid===1)) |-> (##[1:1200] inf.out_valid===1))
else 
begin
    $display("Assertion 8 is violated");
 	$fatal; 
end

assert_8_2 : assert property( @(posedge clk) ((act == Deliver) && (inf.id_valid===1)) |-> (##[1:1200] inf.out_valid===1))
else 
begin
    $display("Assertion 8 is violated");
 	$fatal; 
end
assert_8_3 : assert property( @(posedge clk) ((act == Order) && (inf.food_valid===1)) |-> (##[1:1200] inf.out_valid===1))
else 
begin
    $display("Assertion 8 is violated");
 	$fatal; 
end
assert_8_4 : assert property( @(posedge clk) ((act == Cancel) && (inf.id_valid===1)) |-> (##[1:1200] inf.out_valid===1))
else 
begin
    $display("Assertion 8 is violated");
 	$fatal; 
end


endmodule