////////////////////////////////////////////////
//
// Name:   Shubhi Agrawal
// Design: APB2 Protocol Top Module
// Date:   13-06-2021
//
///////////////////////////////////////////////




`include "master.v"
`include "slave1.v"
`include "slave2.v"



`timescale 1ns/1ns



module APB_Protocol(
                 input PCLK,PRESETn,transfer,READ_WRITE,
                 input [8:0] apb_write_paddr,
		 input [7:0]apb_write_data,
		 input [8:0] apb_read_paddr,
		 output PSLVERR, 
                 output [7:0] apb_read_data_out
          );

       wire [7:0]PWDATA,PRDATA,PRDATA1,PRDATA2;
       wire [8:0]PADDR;

       wire PREADY,PREADY1,PREADY2,PENABLE,PSEL1,PSEL2,PWRITE;
    
      
     //  assign PREADY = READ_WRITE ? (apb_read_paddr[8] ? PREADY2 : PREADY1) : (apb_write_paddr[8] ? PREADY2 : PREADY1);
        assign PREADY = PADDR[8] ? PREADY2 : PREADY1 ;
        assign PRDATA = READ_WRITE ? (PADDR[8] ? PRDATA2 : PRDATA1) : 8'dx ;
       // assign PRDATA = READ_WRITE ? (apb_read_paddr[8] ? PRDATA2 : PRDATA1) : 16'dx;

       master_bridge dut_mas(
	             apb_write_paddr,
		     apb_read_paddr,
		     apb_write_data,
		     PRDATA,         
	             PRESETn,
		     PCLK,
		     READ_WRITE,
		     transfer,
		     PREADY,
	             PSEL1,
		     PSEL2,
		     PENABLE,
	             PADDR,
	             PWRITE,
	             PWDATA,
		     apb_read_data_out,
		     PSLVERR
	               ); 


      slave1 dut1(  PCLK,PRESETn, PSEL1,PENABLE,PWRITE, PADDR[7:0],PWDATA, PRDATA1, PREADY1 );

      slave2 dut2(  PCLK,PRESETn, PSEL2,PENABLE,PWRITE, PADDR[7:0],PWDATA, PRDATA2, PREADY2 );
      


endmodule
