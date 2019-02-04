@echo off
set xv_path=C:\\Xilinx15\\Vivado\\2015.4\\bin
call %xv_path%/xsim Test_behav -key {Behavioral:sim_1:Functional:Test} -tclbatch Test.tcl -view C:/Users/negfi/Documents/AUT/5thSemester/DigitalDesignAutomation/Phaze4/Phaze4/Test_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
