@echo off

REM To run this batch file, please rename this file from nvt_run_mp_tests_get_samples_no_csv.txt to nvt_run_mp_tests_get_samples_no_csv.bat

FOR /F "tokens=1-3 delims=/ " %%a IN ("%date%") DO (SET _MyDate=%%a%%b%%c)
FOR /F "tokens=1-4 delims=:." %%a IN ("%time%") DO (SET _MyTime=%%a%%b%%c)
SET _MyTime=%_MyTime: =0%
set myDIR=Samples
IF not exist %myDIR% (mkdir %myDIR%)
echo ====== Run Selftesting ... ======
adb shell cat /proc/nvt_selftest > .\Samples\Selftest_Result_Data_"%_MyDate%%_MyTime%".txt
echo ====== Run Selftest Done. ======
adb shell dmesg > .\Samples\dmesg_"%_MyDate%%_MyTime%".txt

echo ====== Get selftest result data file in %myDIR% folder finished. ======
echo Press any key to exit...
pause