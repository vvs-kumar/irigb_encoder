`timescale 1ns / 1ps

module mult_try(input clk,rst,EnI,output reg manch,output reg temp);
    integer i,j;
    integer index;
    integer index_1;
    reg En1;
    wire [6:0]sec;
    wire [6:0]min;
    wire [5:0]hrs;
    wire [9:0]days;
    wire [7:0]yrs;
    wire [16:0]sbs;
    wire [31:0]hts,mts;
    reg value;
    integer ind;
    wire [7:0]sec8;
    wire [8:0]min9,hrs9,yrs9,days9_1,days9_2;
    wire [17:0]sbs18;
    wire [88:0]en1;
      wire [100:0]en2;
      wire [0:100]arr;
      assign null=1'b0;
    assign sec = 7'h42, min = 7'h18, hrs = 6'h21,days=10'h173,yrs=8'h03;
    
        assign sec8 = {sec[0],sec[1],sec[2],sec[3],1'b0,sec[4],sec[5],sec[6]};
        assign min9 = {min[0],min[1],min[2],min[3],1'b0,min[4],min[5],min[6],1'b0};
        assign hrs9 = {hrs[0],hrs[1],hrs[2],hrs[3],1'b0,hrs[4],hrs[5],2'b00};
        assign days9_1 = {days[0],days[1],days[2],days[3],1'b0,days[4],days[5],days[6],days[7]};
        assign days9_2 = {days[8],days[9],7'h00};
        assign yrs9 = {yrs[0],yrs[1],yrs[2],yrs[3],1'b0,yrs[4],yrs[5],yrs[6],yrs[7]};
        
           
    mult16 m1(hts,{10'b0,hrs},16'd3600);
    mult16 m2(mts,{11'b0,min},16'd60);
    assign sbs = hts+mts+sec;
    assign sbs18 = {sbs[0],sbs[1],sbs[2],sbs[3],sbs[4],sbs[5],sbs[6],sbs[7],sbs[8],sbs[9],sbs[10],sbs[11],sbs[12],sbs[13],sbs[14],sbs[15],sbs[16],1'b0};
//         integer i, j, k;
//         reg [6:0]index;
//         reg temp,tempp;
//         wire LED;
         assign en1 = {sec8,min9,hrs9,days9_1,days9_2,yrs9,18'h00000,sbs18};
        assign en2 = {null,sec8,null,min9,null,hrs9,null,days9_1,null,days9_2,null,yrs9,null,20'h00000,sbs18,null,null};
        assign arr=en2;
    //assign LED=temp;
    always @(posedge(clk) or negedge(rst))
    begin
        if(!rst)
            begin//begining and setting the values of i,index and temp
                i<=0;
                index<=0;
                index_1<=1;
               temp<=1'b0;
               En1<=1'b0;
               j<=0;
               manch<=1'b0;
            end
            
        else if(EnI==1'b1)
            begin
                   if(En1==1'b0)
                            begin   
                                           
                                            if(i<400000)//runs the loop if value of i is less than 10k untill 20Us in real time
                                                begin
                                                    i<=i+1;
                                                   temp<=1'b1;
                                                end
                                            
                                            else if((i>=400000)&&(i<500000))//untill 80us the i value incremenets and temp is set to 0
                                                begin
                                                  i<=i+1;
                                                  temp<=1'b0;
                                                end
                                             else if (i==500000)
                                                begin
                                                    i<=1;
                                                    temp<=1'b0;
                                                    // temp<=1'b0;
                                                   index<=1;
                                                   //index_1<=((index+1'b1)%4'd10)+1'b1;
                                                 En1<=1'b1;
                                                end 
                                        
                           end
                   if(En1==1'b1)            
                        begin
                                 value<=arr[index];
                                 ind=index;
                                
                                 if(arr[index]==1'b0)//if(b1==1'b0)
                                        begin                //10 - 20000   1 -2000
                                                             // 100000 - 2ms
                                                             // 500000 - 10ms
                                                             // 50000  - 1ms
                                        
                                                            if(i<100000)//runs the loop if value of i is less than 10k untill 20Us in real time
                                                                begin
                                                                    i<=i+1;
                                                                    temp<=1'b1;
                                                                    if(j<5000)//runs the loop if value of i is less than 10k untill 20Us in real time
                                                                        begin
                                                                            j<=j+1;
                                                                           manch<=1'b0;
                                                                        end
                                                                    else if((j>=5000)&&(j<9999))//untill 80us the i value incremenets and temp is set to 0
                                                                        begin
                                                                          j<=j+1;
                                                                          manch<=1'b1;
                                                                        end
                                                                     else if (j==9999)
                                                                        begin
                                                                            j<=1;
                                                                            //manch<=1'b1;
                                                                        end 
                                                                end
                                                            
                                                            else if((i>=100000)&&(i<500000))//untill 80us the i value incremenets and temp is set to 0
                                                                begin
                                                                    i<=i+1;
                                                                    temp<=1'b0;
                                                                    if(j<5000)//runs the loop if value of i is less than 10k untill 20Us in real time
                                                                        begin
                                                                            j<=j+1;
                                                                           manch<=1'b1;
                                                                        end
                                                                    else if((j>=5000)&&(j<9999))//untill 80us the i value incremenets and temp is set to 0
                                                                        begin
                                                                          j<=j+1;
                                                                          manch<=1'b0;
                                                                        end
                                                                     else if (j==9999)
                                                                        begin
                                                                            j<=1;
                                                                            manch<=1'b0;
                                                                        end 
                                                                end
                                                                
                                                            else if (i==500000)//At completion of one bit the value is reset.
                                                                begin
                                                                   i<=1;
                                                                    temp<=1'b0;
                                                                    index<=index+1;
                                                                     index_1<=index+2;
                                                                     manch<=1'b0;
                                                              //   index<=(index+1);
                                                                end
                                                                 
                                        end
                        
                       
                                               
                                if(arr[index]==1'b1)//else if(b1==1'b1)
                                        begin
                                            ind=index;
                                            value<=arr[index];
                                                            if(i<250000)
                                                                begin
                                                                      i<=i+1;
                                                                      temp<=1'b1;
                                                                      if(j<5000)//runs the loop if value of i is less than 10k untill 20Us in real time
                                                                        begin
                                                                            j<=j+1;
                                                                           manch<=1'b0;
                                                                        end
                                                                    else if((j>=5000)&&(j<9999))//untill 80us the i value incremenets and temp is set to 0
                                                                        begin
                                                                          j<=j+1;
                                                                          manch<=1'b1;
                                                                        end
                                                                     else if (j==9999)
                                                                        begin
                                                                            j<=1;
                                                                            manch<=1'b1;
                                                                        end 
                                                                end
                                                                
                                                            else if((i>=250000)&&(i<500000))
                                                                begin
                                                                    i<=i+1;
                                                                    temp<=1'b0;
                                                                    if(j<5000)//runs the loop if value of i is less than 10k untill 20Us in real time
                                                                        begin
                                                                            j<=j+1;
                                                                           manch<=1'b1;
                                                                        end
                                                                    else if((j>=5000)&&(j<9999))//untill 80us the i value incremenets and temp is set to 0
                                                                        begin
                                                                          j<=j+1;
                                                                          manch<=1'b0;
                                                                        end
                                                                     else if (j==9999)
                                                                        begin
                                                                            j<=1;
                                                                            manch<=1'b0;
                                                                        end 
                                                                end
                                                                
                                                            else if (i==500000)
                                                                    begin
                                                                        i<=1;
                                                                         temp<=1'b0;
                                                                        index<=index+1;
                                                                        index_1<=index+2;
                                                                        manch<=1'b0;
                                                                      // index<=(index+1);
                                                                    end                    
                                                        
                                            end
                                           
                               if(index_1%10==0)//else if(b1==1'b1)
                                begin                      
                                
                                            value<=arr[index];
                                            ind=index;         
                                            if(i<400000)//runs the loop if value of i is less than 10k untill 20Us in real time
                                                begin//10 - 20000   1 -2000
                                                    i<=i+1;
                                                   temp<=1'b1;
                                                   if(j<5000)//runs the loop if value of i is less than 10k untill 20Us in real time
                                                                        begin
                                                                            j<=j+1;
                                                                           manch<=1'b0;
                                                                        end
                                                                    else if((j>=5000)&&(j<9999))//untill 80us the i value incremenets and temp is set to 0
                                                                        begin
                                                                          j<=j+1;
                                                                          manch<=1'b1;
                                                                        end
                                                                     else if (j==9999)
                                                                        begin
                                                                            j<=1;
                                                                            manch<=1'b1;
                                                                        end 
                                                end
                                            
                                            else if((i>=400000)&&(i<500000))//untill 80us the i value incremenets and temp is set to 0
                                                begin
                                                  i<=i+1;
                                                  temp<=1'b0;
                                                  if(j<5000)//runs the loop if value of i is less than 10k untill 20Us in real time
                                                                        begin
                                                                            j<=j+1;
                                                                           manch<=1'b1;
                                                                        end
                                                                    else if((j>=5000)&&(j<9999))//untill 80us the i value incremenets and temp is set to 0
                                                                        begin
                                                                          j<=j+1;
                                                                          manch<=1'b0;
                                                                        end
                                                                     else if (j==9999)
                                                                        begin
                                                                            j<=1;
                                                                            manch<=1'b0;
                                                                        end 
                                                end
                                             else if (i==500000)
                                                begin
                                                    i<=1;
                                                    temp<=1'b0;
                                                    // temp<=1'b0;
                                                   index<=index+1;
                                                   index_1<=index+2;
                                                   manch<=1'b0;
                                                 
                                                end 
                                end                
                        end
                        
               
            end                    
    end
endmodule

module mult16(product,multiplier,multiplicand);
   input [15:0]  multiplier, multiplicand;
   output        product;
   reg [31:0]    product;
   reg [4:0]i;

   always @( multiplier or multiplicand )

     begin
        product[31:16] = 16'd0;
        product[15:0] = multiplier;
        //c=1'b0;
        for(i=0;(~(i[4]==1));i=i+1)
        begin
        product[31:16] = product[0]?product[31:16] + multiplicand:product[31:16];
        product[31:0] = {1'b0,product[31:1]};
        end
        end    

endmodule
