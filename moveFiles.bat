@echo off
setlocal
pushd C:\temp\
@powershell Copy-Item '\\DC01\Files\Install_NxLog.bat' -Destination 'C:\temp\Install_NxLog.bat'
@powershell Copy-Item '\\DC01\Files\Install_Sysmon.bat' -Destination 'C:\temp\Install_Sysmon.bat'
:exit