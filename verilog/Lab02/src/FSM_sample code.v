//***********************************			  
// parameter	  
//***********************************	  
parameter IDLE       =  3'd0;
parameter INPUT      =  3'd1;
parameter CHECK_INV	 =  3'd2;
parameter CHECK_DEC  =  3'd3;
parameter OUTPUT_1   =  3'd4;
parameter OUTPUT_2   =  3'd5;
parameter OUTPUT_3   =  3'd6;		


//****************************************
//Reg Daclaration		  
//****************************************
reg [2:0]cstate;
reg [2:0]nstate;			  			  
	    .
	    .
	    .
	    .
	    .

//************************************
//		  FSM_sample code
//************************************
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n) 
		cstate <= IDLE;
	else
		cstate <= nstate;
end

always@(*)
begin
	if(!rst_n) 
		nstate = IDLE;
	else
		begin
			case(cstate)
			IDLE:
				nstate = (in_valid)? INPUT:IDLE; 
				
			INPUT:
				nstate = (??????) ? INPUT:CHECK_INV;	  
				
			CHECK_INV:
				begin
					if(??????) 
						nstate = CHECK_DEC;
					else if(??????) 
						nstate = OUTPUT_3;
					else 
						nstate = CHECK_INV;
				end 
			CHECK_DEC:
				begin	
					if(??????) 
						nstate = OUTPUT_1;
					else if(??????) 
						nstate = OUTPUT_2;
					else 
						nstate = CHECK_DEC;
				end
			OUTPUT_1:
				nstate =  (??????) ? OUTPUT_1:IDLE;
				
			OUTPUT_2:
				nstate =  (??????) ? OUTPUT_2:IDLE;
				
			OUTPUT_3:
				nstate =  (??????) ? OUTPUT_3:IDLE;
			
			default nstate = IDLE;		 
			endcase
		end
end
