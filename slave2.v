////////////////////////////////////////////////
//
// Name:   Shubhi Agrawal
// Design: APB2 Protocol Slave-2
// Date:   13-06-2021
//
///////////////////////////////////////////////






`timescale 1ns/1ns



module slave2(
         input PCLK,PRESETn,
         input PSEL,PENABLE,PWRITE,
         input [7:0]PADDR,PWDATA,
        output [7:0]PRDATA2,
        output reg PREADY );
    
     reg [7:0]reg_addr;

     reg [7:0] mem2 [0:63];

    assign PRDATA2 =  mem2[reg_addr];



    always @(*)
       begin
         if(!PRESETn)
              PREADY = 0;
          else
	  if(PSEL && !PENABLE && !PWRITE)
	     begin PREADY = 0; end
	         
	  else if(PSEL && PENABLE && !PWRITE)
	     begin  PREADY = 1;
                    reg_addr =  PADDR; 
	       end
          else if(PSEL && !PENABLE && PWRITE)
	     begin  PREADY = 0; end

	  else if(PSEL && PENABLE && PWRITE)
	     begin  PREADY = 1;
	            mem2[PADDR] = PWDATA; end

           else PREADY = 0;
        end
    endmodule
 /*  reg [7:0]mem[0:63];
  
 integer i;
 
  initial
    begin
     for(i=0;i<64;i=i+1)
     begin  mem[i] = {$random};
             #1;
     end
   end
       // repeat(100)
       // begin #50 mem[$random] = {$random}; end
  
*/
   // assign PRDATA2 = (PSEL && PENABLE && PWRITE) ? mem[reg_addr] : 8'dz;
   // ram dhy(PRDATA2,PWDATA,P,PWRITE,PREADY);
/*
module ram(data_out, data_in,addr,PWRITE,PREADY);
 
 parameter ddr_size = 8, word_size = 8, memory_size = 64;

 input [7:0]addr;
 input PWRITE,PREADY;
 input [7:0] data_in;
 output [7:0]data_out;

reg [7:0] mem [0:63];

assign data_out = PREADY ? mem[addr] : 8'bz;

always @(PWRITE,PREADY)
 if(PWRITE) mem[addr] = data_in;

endmodule*/
/*
module RAM_test;

 reg [7:0]address;
 wire [7:0] data_out;
 reg [7:0] data_in;
 reg write,select;
integer k,myseed;
ram rgd(data_out, data_in,address,write,select);

 initial
   begin
     for(k=0; k<= 63; k=k+1)
         begin
           data_in = (k + k)%256;
            write =1; select=1;
           #2 write=0; select=0;
        end
initial myseed = 35;

endmodule */
/*    always @(PWRITE,PREADY)
          if(PWRITE & PREADY) mem[PADDR] = PWDATA;

  always @(posedge PCLK)
  begin
	  if(!PRESETn)
		  state <= IDLE;
	  else
               state <= next_state;
       end

       always @(posedge PCLK)
       begin
	       case(state)
		       IDLE: begin
			       if(PSEL & PWRITE)
			       begin PREADY =0;
			       next_state = s_WRITE; end

                               else if(PSEL & !PWRITE)
			       begin PREADY=0;
			       next_state = s_READ; end
                               else
				begin PREADY =0;
	                              next_state = IDLE;  end			       
		              end
		       
		    s_WRITE: begin
			       if(PSEL & PWRITE & PENABLE)
			       begin   PREADY = 1;
			               mem[PADDR] = PWDATA;
				       next_state = IDLE; end
			       else next_state = IDLE ;
		             end

		    s_READ: begin
			       if(PSEL & !PWRITE & PENABLE)
			       begin   PREADY = 1;
			               reg_addr = PADDR;
				       next_state = IDLE; end
			       else next_state = IDLE;
			    end
		    default: begin PREADY=0; 
		                   next_state=IDLE; end
	          endcase
	end


	endmodule
*/

        
