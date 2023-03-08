module FaseAndSlicer(
    input               clock     ,
    input               i_reset   ,
    input               i_enable  , 
    input  signed [7:0] i_fir     ,
    input               i_valid   ,
    input         [1:0] i_selector,
    output              output_slicer 
    );

reg       firaux             ;    
reg [7:0] selector_fase [3:0];
wire      sal_mux            ;

always @(posedge clock) begin
    if (i_reset) begin
      selector_fase[0] <= 8'b00000000;
      selector_fase[1] <= 8'b00000000;
      selector_fase[2] <= 8'b00000000;
      selector_fase[3] <= 8'b00000000;
      firaux           <= 0          ;
   end else if (i_enable) begin
      selector_fase[3] <= i_fir           ;
      selector_fase[2] <= selector_fase[3];
      selector_fase[1] <= selector_fase[2];
      selector_fase[0] <= selector_fase[1];
      firaux           <= sal_mux         ;
   end
end
 
assign sal_mux = (i_selector == 2'b00 && i_valid) ? selector_fase[3][7]  : (i_selector == 2'b01 && i_valid) 
                                                  ? selector_fase[2][7]  : (i_selector == 2'b10 && i_valid) 
                                                  ? selector_fase[1][7]  :  selector_fase[0][7]; 
assign output_slicer = firaux;
endmodule
