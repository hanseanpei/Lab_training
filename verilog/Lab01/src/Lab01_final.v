module SD(
	in_n0,
	in_n1, 
	in_n2, 
	in_n3, 
	mode,
	out_n
);
input [3:0] in_n0;   
input [3:0] in_n1;   
input [3:0] in_n2;   
input [3:0] in_n3;   
input mode;
   
output reg [3:0] out_n;

wire [3:0] swap_1_b,swap_1_s,swap_2_b,swap_2_s,swap_3_b,swap_3_s;
wire [3:0] swap_4_b,swap_4_s,swap_5_b,swap_5_s,swap_6_b,swap_6_s;
wire [4:0] q0,q1,q2;
wire [4:0] temp_q1,temp_q2,temp_q3;
wire [7:0] temp,div1,div2;
reg [3:0] n0,n1,n2,n3;
wire [3:0] Q;

//sorting
assign swap_1_b = (in_n0>in_n1)?in_n0:in_n1;
assign swap_1_s = (in_n0>in_n1)?in_n1:in_n0; 
assign swap_2_b = (in_n2>in_n3)?in_n2:in_n3;
assign swap_2_s = (in_n2>in_n3)?in_n3:in_n2;  
assign swap_3_b = (swap_1_s>swap_2_b)?swap_1_s:swap_2_b;
assign swap_3_s = (swap_1_s>swap_2_b)?swap_2_b:swap_1_s;
assign swap_4_b = (swap_1_b>swap_3_b)?swap_1_b:swap_3_b;
assign swap_4_s = (swap_1_b>swap_3_b)?swap_3_b:swap_1_b;
assign swap_5_b = (swap_3_s>swap_2_s)?swap_3_s:swap_2_s;
assign swap_5_s = (swap_3_s>swap_2_s)?swap_2_s:swap_3_s;
assign swap_6_b = (swap_4_s>swap_5_b)?swap_4_s:swap_5_b;
assign swap_6_s = (swap_4_s>swap_5_b)?swap_5_b:swap_4_s;

//sorting_result
always@*
begin
  n0 = swap_4_b;
  n1 = swap_6_b;
  n2 = swap_6_s;
  n3 = swap_5_s;
end   

assign temp = {4'b0,n0};
assign div1 = {temp[7:3]};   
assign div2 = {1'b0,n3};
assign temp_q3 = div1-div2;
assign temp_q2 = q2-div2;
assign temp_q1 = q1-div2;
assign q2 = (div1 >= div2)?{temp_q3[3:0],temp[2]}:{div1[3:0],temp[2]};
assign q1 = (q2 >= div2)?{temp_q2[3:0],temp[1]}:{q2[3:0],temp[1]};
assign q0 = (q1 >= div2)?{temp_q1[3:0],temp[0]}:{q1[3:0],temp[0]};
assign Q[3] = (div1 >= div2)?1:0;
assign Q[2] = (q2 >= div2)?1:0;
assign Q[1] = (q1 >= div2)?1:0;
assign Q[0] = (q0 >= div2)?1:0;


always@*
begin
  if(mode==0) begin
    out_n = Q;
  end
  else begin
    out_n = (n0-n1)+(n2-n3);    
  end
end




endmodule