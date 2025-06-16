RTL = ..\RTL\ram_16x8.v
PKG = ..\TEST\ram_pkg.sv
TOP = ..\TOP\ram_top.sv
INCDIR = +incdir+..\ENV +incdir+..\TEST
TOP_MOD = ram_top
COVERAGE = -c -do "coverage save -onexit -directive -cvg -codeall


vlog:
	vlog $(RTL) $(PKG) $(TOP) $(INCDIR)

qverilog :
	qverilog  $(RTL) $(PKG) $(TOP) $(INCDIR)

vsim :
	vsim -novopt $(TOP_MOD)
