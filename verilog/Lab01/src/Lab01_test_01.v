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

reg [3:0] n0,n1,n2,n3;
reg [3:0] Q;
reg [4:0] div1,div2,q;
reg [7:0] temp;


always@*
begin
  if( in_n0>=in_n1 && in_n1>=in_n2 && in_n2>=in_n3 )begin
    n0 = in_n0;
	n1 = in_n1;
	n2 = in_n2;
	n3 = in_n3;
  end
  else if( in_n0>=in_n1 && in_n1>=in_n3 && in_n3>=in_n2 )begin
    n0 = in_n0;
	n1 = in_n1;
	n2 = in_n3;
	n3 = in_n2;
  end
  else if( in_n0>=in_n2 && in_n2>=in_n1 && in_n1>=in_n3 )begin
    n0 = in_n0;
	n1 = in_n2;
	n2 = in_n1;
	n3 = in_n3;
  end
  else if( in_n0>=in_n2 && in_n2>=in_n3 && in_n3>=in_n1 )begin
    n0 = in_n0;
	n1 = in_n2;
	n2 = in_n3;
	n3 = in_n1;
  end
  else if( in_n0>=in_n3 && in_n3>=in_n1 && in_n1>=in_n2 )begin
    n0 = in_n0;
	n1 = in_n3;
	n2 = in_n1;
	n3 = in_n2;
  end
  else if( in_n0>=in_n3 && in_n3>=in_n2 && in_n2>=in_n1 )begin
    n0 = in_n0;
	n1 = in_n3;
	n2 = in_n2;
	n3 = in_n1;
  end  
  
  else if( in_n1>=in_n0 && in_n0>=in_n2 && in_n2>=in_n3 )begin
    n0 = in_n1;
	n1 = in_n0;
	n2 = in_n2;
	n3 = in_n3;
  end
  else if( in_n1>=in_n0 && in_n0>=in_n3 && in_n3>=in_n2 )begin
    n0 = in_n1;
	n1 = in_n0;
	n2 = in_n3;
	n3 = in_n2;
  end   
  else if( in_n1>=in_n2 && in_n2>=in_n0 && in_n0>=in_n3 )begin
    n0 = in_n1;
	n1 = in_n2;
	n2 = in_n0;
	n3 = in_n3;
  end
  else if( in_n1>=in_n2 && in_n2>=in_n3 && in_n3>=in_n0 )begin
    n0 = in_n1;
	n1 = in_n2;
	n2 = in_n3;
	n3 = in_n0;
  end   
  else if( in_n1>=in_n3 && in_n3>=in_n0 && in_n0>=in_n2 )begin
    n0 = in_n1;
	n1 = in_n3;
	n2 = in_n0;
	n3 = in_n2;
  end
  else if( in_n1>=in_n3 && in_n3>=in_n2 && in_n2>=in_n0 )begin
    n0 = in_n1;
	n1 = in_n3;
	n2 = in_n2;
	n3 = in_n0;
  end   
  
  else if( in_n2>=in_n0 && in_n0>=in_n1 && in_n1>=in_n3 )begin
    n0 = in_n2;
	n1 = in_n0;
	n2 = in_n1;
	n3 = in_n3;
  end 
  else if( in_n2>=in_n0 && in_n0>=in_n3 && in_n3>=in_n1 )begin
    n0 = in_n2;
	n1 = in_n0;
	n2 = in_n3;
	n3 = in_n1;
  end 
  else if( in_n2>=in_n1 && in_n1>=in_n0 && in_n0>=in_n3 )begin
    n0 = in_n2;
	n1 = in_n1;
	n2 = in_n0;
	n3 = in_n3;
  end
  else if( in_n2>=in_n1 && in_n1>=in_n3 && in_n3>=in_n0 )begin
    n0 = in_n2;
	n1 = in_n1;
	n2 = in_n3;
	n3 = in_n0;
  end
  else if( in_n2>=in_n3 && in_n3>=in_n0 && in_n0>=in_n1 )begin
    n0 = in_n2;
	n1 = in_n3;
	n2 = in_n0;
	n3 = in_n1;
  end
  else if( in_n2>=in_n3 && in_n3>=in_n1 && in_n1>=in_n0 )begin
    n0 = in_n2;
	n1 = in_n3;
	n2 = in_n1;
	n3 = in_n0;
  end
  
  else if( in_n3>=in_n0 && in_n0>=in_n1 && in_n1>=in_n2 )begin
    n0 = in_n3;
	n1 = in_n0;
	n2 = in_n1;
	n3 = in_n2;
  end
  else if( in_n3>=in_n0 && in_n0>=in_n2 && in_n2>=in_n1 )begin
    n0 = in_n3;
	n1 = in_n0;
	n2 = in_n2;
	n3 = in_n1;
  end
  else if( in_n3>=in_n1 && in_n1>=in_n0 && in_n0>=in_n2 )begin
    n0 = in_n3;
	n1 = in_n1;
	n2 = in_n0;
	n3 = in_n2;
  end
  else if( in_n3>=in_n1 && in_n1>=in_n2 && in_n2>=in_n0 )begin
    n0 = in_n3;
	n1 = in_n1;
	n2 = in_n2;
	n3 = in_n0;
  end
  else if( in_n3>=in_n2 && in_n2>=in_n0 && in_n0>=in_n1 )begin
    n0 = in_n3;
	n1 = in_n2;
	n2 = in_n0;
	n3 = in_n1;
  end
  else begin
    n0 = in_n3;
	n1 = in_n2;
	n2 = in_n1;
	n3 = in_n0;
  end
  
end


   
always@(*) 
begin   
   temp = {4'b0,n0};
   div1 = {temp[7:3]};   
   div2 = {1'b0,n3};
   if(mode==0) begin
    //Q[3]
	q = div1-div2;
	if(q[4]==1)begin
	 Q[3] = 0;
	 div1 = {div1[3:0],temp[2]};
	end
	else begin
	 Q[3] = 1;
	 div1 = {q[3:0],temp[2]};
    end
	//Q[2]
	q = div1-div2;
	if(q[4]==1)begin
	 Q[2] = 0;
	 div1 = {div1[3:0],temp[1]};
	end
	else begin
	 Q[2] = 1;
	 div1 = {q[3:0],temp[1]};
    end
	//Q[1]
	q = div1-div2;
	if(q[4]==1)begin
	 Q[1] = 0;
	 div1 = {div1[3:0],temp[0]};
	end
	else begin
	 Q[1] = 1;
	 div1 = {q[3:0],temp[0]};
    end
	//Q[0]
	q = div1-div2;
	if(q[4]==1)begin
	 Q[0] = 0;
	end
	else begin
	 Q[0] = 1;
    end
   
    out_n = Q;
   end 
   else begin
    out_n = (n0-n1)+(n2-n3);    
   end
end   

endmodule