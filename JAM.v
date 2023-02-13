module JAM (
           input CLK,
           input RST,
           output reg [2:0] W,
           output reg [2:0] J,
           input [6:0] Cost,
           output reg [3:0] MatchCount,
           output reg [9:0] MinCost,
           output reg Valid );

reg [2:0] dictionary [7:0];
reg [2:0] dictionary_tmp [7:0];
reg [2:0] ptr0;
reg [2:0] ptr1;
wire [2:0] dic_cmpl = dictionary[ptr0];
wire [2:0] dic_cmpr = dictionary[ptr0+3'd1];
wire is_r_bigger_l = dic_cmpr > dic_cmpl;
reg [2:0] replace_ptr;
wire [2:0] replace = dictionary[replace_ptr];
reg [2:0] min_num_ptr;
reg find_flg0,find_flg1, finish_flg;
reg [2:0] tran_ptr_max;
reg [2:0] tran_ptr_min;
wire [2:0] tran_cmp = tran_ptr_max - tran_ptr_min;
reg [9:0] TotalCost;

localparam FSM_FIND_DIC_IDLE = 0,
           FSM_FIND_DIC_1 = 1,
           FSM_FIND_DIC_2 = 2,
           FSM_FIND_DIC_3 = 3;
localparam FSM_COST_IDLE = 0,
           FSM_COST_1 = 1, //4
           FSM_COST_2 = 2, //5
           FSM_COST_3 = 3; //6
reg [1:0] cur_state0, nxt_state0;
reg [1:0] cur_state1, nxt_state1, cur_state_tmp1;
wire first_state = cur_state_tmp1!=cur_state1;
//FSM1先開始，如果算完，且fsm0_finish_flg==1則繼續，結束後fsm1_finish_flg==1
//FSM0當fsm1_finish_flg==1則開始，結束後fsm0_finish_flg==1

integer i;
//------------------
//      FSM Flag
//------------------
wire fsm0_1_flg = is_r_bigger_l==1;
wire fsm0_2_flg = finish_flg;
wire fsm0_3_flg = (tran_cmp==0) || (tran_cmp==1);
wire fsm1_1_flg = (find_flg1==1);
reg fsm0_finish_flg;
reg fsm1_finish_flg;
wire all_done = cur_state0==FSM_FIND_DIC_1 && ptr0==7;
//FSM1先開始，如果算完，且fsm0_finish_flg==1則繼續，結束後fsm1_finish_flg==1
//FSM0當fsm1_finish_flg==1則開始，結束後fsm0_finish_flg==1

always @(posedge CLK) begin
    if(RST) begin
        fsm0_finish_flg <= 1;
    end
    else begin
        case(cur_state0)
            FSM_FIND_DIC_1: begin
                fsm0_finish_flg <= 0;
            end
            FSM_FIND_DIC_3: begin
                if (fsm0_3_flg) begin
                    fsm0_finish_flg <= 1;
                end
            end
        endcase
    end
end

always @(posedge CLK) begin
    if(RST) begin
        fsm1_finish_flg <= 0;
    end
    else begin
        case(cur_state1)
            FSM_COST_1: begin
                fsm1_finish_flg <= 0;
            end
            FSM_COST_2: begin
                fsm1_finish_flg <= 1;
            end
        endcase
    end
end

//------------------
//      FSM
//------------------
always @(posedge CLK) begin
    if(RST) begin
        cur_state0 <= FSM_FIND_DIC_IDLE;
    end
    else begin
        cur_state0 <= nxt_state0;
    end
end
always @(*) begin
    case(cur_state0)
        FSM_FIND_DIC_IDLE: begin
            if(fsm1_finish_flg) begin
                nxt_state0 = FSM_FIND_DIC_1;
            end
            else begin
                nxt_state0 = FSM_FIND_DIC_IDLE;
            end
        end
        FSM_FIND_DIC_1: begin
            if(fsm0_1_flg) begin
                nxt_state0 = FSM_FIND_DIC_2;
            end
            else begin
                if(ptr0==7) begin
                    nxt_state0 = FSM_FIND_DIC_IDLE;
                end
                else begin
                    nxt_state0 = FSM_FIND_DIC_1;
                end
            end
        end
        FSM_FIND_DIC_2: begin
            if(fsm0_2_flg) begin
                nxt_state0 = FSM_FIND_DIC_3;
            end
            else begin
                nxt_state0 = FSM_FIND_DIC_2;
            end
        end
        FSM_FIND_DIC_3: begin
            if(fsm0_3_flg) begin
                nxt_state0 = FSM_FIND_DIC_IDLE;
            end
            else begin
                nxt_state0 = FSM_FIND_DIC_3;
            end
        end
        default begin
            nxt_state0 = FSM_FIND_DIC_IDLE;
        end
    endcase
end
always @(posedge CLK) begin
    if(RST) begin
        cur_state1 <= FSM_COST_IDLE;
    end
    else begin
        cur_state1 <= nxt_state1;
    end
end
always @(posedge CLK) begin
    cur_state_tmp1 <= cur_state1;
end


always @(*) begin
    case(cur_state1)
        FSM_COST_IDLE: begin
            if(fsm0_finish_flg)
                nxt_state1 = FSM_COST_1;
            else begin
                if(all_done) begin
                    nxt_state1 = FSM_COST_3;
                end
                else begin
                    nxt_state1 = FSM_COST_IDLE;
                end
            end
        end
        FSM_COST_1: begin
            if(fsm1_1_flg) begin
                nxt_state1 = FSM_COST_2;
            end
            else begin
                nxt_state1 = FSM_COST_1;
            end
        end
        FSM_COST_2: begin
            nxt_state1 = FSM_COST_IDLE;
        end
        FSM_COST_3: begin
            nxt_state1 = FSM_COST_IDLE;
        end
        default begin
            nxt_state1 = FSM_COST_IDLE;
        end
    endcase
end

//------------------
//      Dictionary
//------------------

always @(posedge CLK) begin
    if(RST) begin
        finish_flg<=0;
    end
    else begin
        case(cur_state0)
            FSM_FIND_DIC_2: begin
                if(ptr0==7)
                    finish_flg <= 1;
                else
                    finish_flg<=0;
            end
            default begin
                finish_flg<=0;
            end
        endcase
    end
end
always @(posedge CLK) begin
    if(RST) begin
        for(i=0; i<8; i=i+1) begin
            dictionary[i] <= i;
        end
    end
    else begin
        case(cur_state0)
            FSM_FIND_DIC_2: begin
                if(fsm0_2_flg) begin
                    if(find_flg0) begin
                        dictionary[replace_ptr] <= dictionary[min_num_ptr];
                        dictionary[min_num_ptr] <= dictionary[replace_ptr];
                    end
                end
            end
            FSM_FIND_DIC_3: begin
                dictionary[tran_ptr_max] <= dictionary[tran_ptr_min];
                dictionary[tran_ptr_min] <= dictionary[tran_ptr_max];
            end
            default begin
                if(all_done) begin
                    for(i=0; i<8; i=i+1) begin
                        dictionary[i] <= i;
                    end
                end
                else begin
                    for(i=0; i<8; i=i+1) begin
                        dictionary[i] <= dictionary[i];
                    end
                end
            end
        endcase
    end
end
always @(posedge CLK) begin
    if(RST) begin
        for(i=0; i<8; i=i+1) begin
            dictionary_tmp[i] <= i;
        end
    end
    else begin
        case(cur_state1)
            FSM_COST_IDLE: begin
                if(fsm0_finish_flg) begin
                    for(i=0; i<8; i=i+1) begin
                        dictionary_tmp[i] <= dictionary[i];
                    end
                end
            end
            default begin
            end
        endcase
    end
end
/*
reg [100:0] DEBUG_COUNTER;
always @(posedge CLK) begin
    if(RST) begin
        DEBUG_COUNTER <= 0;
    end
    else begin
        case(cur_state1)
            FSM_COST_1: begin
                if (cur_state1!= cur_state_tmp1)
                    DEBUG_COUNTER <= DEBUG_COUNTER + 1;
            end
            default begin
                DEBUG_COUNTER <=DEBUG_COUNTER;
            end
        endcase
    end
end
*/
//------------------
//      ptr
//------------------
always @(posedge CLK) begin
    if(RST) begin
        ptr0 <= 0;
    end
    else begin
        case(cur_state0)
            FSM_FIND_DIC_IDLE: begin
                ptr0 <= 6;
            end
            FSM_FIND_DIC_1: begin
                if(fsm0_1_flg)
                    ptr0 <= ptr0;
                else
                    ptr0 <= ptr0 - 1;
            end
            FSM_FIND_DIC_2: begin
                ptr0 <= ptr0 + 1;
            end
            FSM_FIND_DIC_3: begin
                ptr0 <= 0;
            end
            default begin
            end
        endcase
    end
end
always @(posedge CLK) begin
    if(RST) begin
        ptr1 <= 0;
    end
    else begin
        case(cur_state1)
            FSM_COST_IDLE: begin
                ptr1 <= 0;
            end
            FSM_COST_1: begin
                ptr1 <= ptr1 + 1;
            end
            FSM_COST_2: begin
                ptr1 <= 6;
            end
            default begin
            end
        endcase
    end
end
always @(posedge CLK) begin
    if(RST) begin
        replace_ptr <= 0;
    end
    else begin
        case(cur_state0)
            FSM_FIND_DIC_IDLE: begin
                replace_ptr <= 0;
            end
            FSM_FIND_DIC_1: begin
                if(fsm0_1_flg)
                    replace_ptr <= ptr0;
            end
            default begin
            end
        endcase
    end
end
always @(posedge CLK) begin
    if(RST) begin
        min_num_ptr <= 3'd0;
    end
    else begin
        case(cur_state0)
            FSM_FIND_DIC_IDLE: begin
                min_num_ptr <= 3'd0;
            end
            FSM_FIND_DIC_2: begin
                if ({1'b0,ptr0}+4'd1 <= 4'd7) begin
                    if (dictionary[ptr0+3'd1]>replace) begin
                        min_num_ptr <= ptr0+3'd1;
                    end
                end
            end
            default begin
            end
        endcase
    end
end
always @(posedge CLK) begin
    if(RST) begin
        find_flg0 <= 1'b0;
    end
    else begin
        case(cur_state0)
            FSM_FIND_DIC_IDLE: begin
                find_flg0 <= 1'b0;
            end
            FSM_FIND_DIC_2: begin
                if (dictionary[ptr0+3'd1]>replace) begin
                    find_flg0 <= 1'b1;
                end
            end
            FSM_FIND_DIC_3: begin
                find_flg0 <= 1'b0;
            end
            default begin
            end
        endcase
    end
end
always @(posedge CLK) begin
    if(RST) begin
        find_flg1 <= 1'b0;
    end
    else begin
        case(cur_state1)
            FSM_COST_IDLE: begin
                find_flg1 <= 1'b0;
            end
            FSM_COST_1: begin
                if (ptr1==7) begin
                    find_flg1 <= 1'b1;
                end
            end
            FSM_COST_2: begin
                find_flg1 <= 1'b0;
            end
            default begin
            end
        endcase
    end
end
always @(posedge CLK) begin
    if(RST) begin
        tran_ptr_max <= 3'd0;
        tran_ptr_min <= 3'd0;
    end
    else begin
        case(cur_state0)
            FSM_FIND_DIC_IDLE: begin
                tran_ptr_max <= 3'd0;
                tran_ptr_min <= 3'd0;
            end
            FSM_FIND_DIC_2: begin
                if(fsm0_2_flg) begin
                    tran_ptr_max <= 3'd7;
                    tran_ptr_min <= replace_ptr+3'd1;
                end
            end
            FSM_FIND_DIC_3: begin
                tran_ptr_max <= tran_ptr_max-3'd1;
                tran_ptr_min <= tran_ptr_min+3'd1;
            end
            default begin
            end
        endcase
    end
end

always @(posedge CLK) begin
    if(RST) begin
        W <= 3'd0;
        J <= 3'd0;
        TotalCost <= 10'd0;
    end
    else begin
        case(cur_state1)
            FSM_COST_1: begin
                W <= ptr1;
                J <= dictionary_tmp[ptr1];
                if(!first_state)
                    TotalCost <= TotalCost + {3'd0, Cost};
            end
            default begin
                W <= 3'd0;
                J <= 3'd0;
                TotalCost <= 10'd0;
            end
        endcase
    end
end

always @(posedge CLK) begin
    if(RST) begin
        MinCost <= {10{1'b1}};
        MatchCount <= 4'd0;
    end
    else begin
        case(cur_state1)
            FSM_COST_2: begin
                if(TotalCost == MinCost) begin
                    MatchCount <= MatchCount + 4'd1;
                end
                else if(TotalCost <= MinCost) begin
                    MatchCount <= 4'd1;
                    MinCost <= TotalCost;
                end
            end
            default begin
            end
        endcase
    end
end

always @(posedge CLK) begin
    if(RST) begin
        Valid <= 1'd0;
    end
    else begin
        if(all_done) begin
            Valid <= 1'd1;
        end
        else begin
            Valid <= 1'd0;
        end
    end
end

endmodule
