@echo off
echo FRCUpload v1.2 Copyright (c) 2014 Techwolf
echo.

if exist ftpcommand.dat (
echo Last upload did not complete successfully, cleaning up.
del ftpcommand.dat
)

set Workspace=%UserProfile%\Documents\WindRiverWorkspace
if not exist %workspace% (
echo Workspace not found! Press any key to exit.
pause > nul
exit
) else (
echo Your current project directory is: %Workspace%
dir %Workspace%
)

set /p ProjectName="What project would you like to upload to the robot? "

echo Preparing to upload...
echo user admin> ftpcommand.dat
echo admin>> ftpcommand.dat
echo cd /ni-rt/system/>> ftpcommand.dat
echo delete FRC_UserProgram.out>> ftpcommand.dat
echo bin>> ftpcommand.dat
echo put %workspace%\%ProjectName%\PPC603gnu\SimpleTemplate\Debug\SimpleTemplate.out>> ftpcommand.dat
echo rename SimpleTemplate.out FRC_UserProgram.out>> ftpcommand.dat
echo quit>> ftpcommand.dat

echo Uploading...
ftp -n -s:ftpcommand.dat 10.6.91.2

echo Cleaning up...
del ftpcommand.dat
echo Upload complete! Press any key to exit.
pause > nul
exit