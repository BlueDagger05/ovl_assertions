vlog=/mnt/c/questasim64_2020.1/win64/vlog.exe
vopt=/mnt/c/questasim64_2020.1/win64/vopt.exe
vsim=/mnt/c/questasim64_2020.1/win64/vsim.exe

TOP_NAME     = tb_fsm_controller
OPT_TOP_NAME = tb_fsm_controller_opt
DEFINE       = +define+OVL\
	       +define+OVL_ASSERT_ON\
	       +define+OVL_INIT_MSG\
	       +define+OVL_MAX_REPORT_ERROR=2\


VLOG_OPTIONS = +acc=rnc
VLOG_FILES   = $(DEFINE) -f ./files.lst
ELAB_OPTIONS = $(VLOG_OPTIONS) work.$(TOP_NAME) -o $(OPT_TOP_NAME)
SIM_OPTIONS  = work.$(OPT_TOP_NAME)  -do run.do
CLEAN_THESE  = *log ./work transcript *wlf


vlog_parse:
	$(vlog) $(VLOG_FILES)

elaborate:vlog_parse
	$(vopt) $(ELAB_OPTIONS) 

sim:elaborate
	$(vsim) $(SIM_OPTIONS)

clean:
	rm -rf $(CLEAN_THESE)
