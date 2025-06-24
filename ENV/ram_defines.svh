
////////////////////////////////////////////////////////////////////////
//   File Name      : ram_defines.sv                                  //
//   Author         : Anshul_Pandya                                   //
//   Project Name   : Dual_Port_Ram                                   //
//   Description    : File contains all the macros that need to be    //
//                    defined for the project.                        //
////////////////////////////////////////////////////////////////////////

`ifndef RAM_DEFINES_SV
`define RAM_DEFINES_SV

`define ADDR_WIDTH 4
`define DATA_WIDTH 8
`define DEPTH 16


`define half_clk 2.5



`define ram_checker(ACT_DATA,EXP_DATA)\
  if (``ACT_DATA`` == ``EXP_DATA``) begin\
    success++;\
    $info("Pass");\
  end else begin\
    failure++;\
    $error("Failed");\
  end

typedef enum bit [1:0] {IDLE, READ, WRITE, SIM_RW} trans_kind;

`endif
