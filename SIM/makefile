RTL = ../RTL/ram_16x8.v
PKG = ../ENV/w_agent/ram_w_agt_pkg.sv ../ENV/r_agent/ram_r_agt_pkg.sv ../ENV/ram_env_pkg.sv ../TEST/ram_test_pkg.sv
TOP = ../TOP/ram_top.sv
INCDIR = +incdir+../ENV +incdir+../TEST +incdir+../ENV/w_agent +incdir+../ENV/r_agent
TOP_MOD = ram_top
COVERAGE = -c -do "coverage save -onexit -directive -cvg -codeall


vlog:
	vlog $(RTL) $(PKG) $(TOP) $(INCDIR)

qverilog :
	qverilog  $(RTL) $(PKG) $(TOP) $(INCDIR) -R +UVM_VERBOSITY=UVM_FULL +UVM_TESTNAME=$(TESTNAME)

vsim :
	vsim -voptargs=+acc $(TOP_MOD)
