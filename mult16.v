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
