:: Author: Steven Chavez
:: Email: steven.chavez@avertium.com
:: Date: 4/10/2024
:: Version: 1.0.0
::
:: Summary: Used to install sysmon on computers using Avertiums custom sysmon config.
:: 			Everytime the script is run the current config is pulled and installed

:: NEEDS TO CHANGE PER CLIENT - Update the below variable path below to the location of where the sysmon.exe file is shared
set sysmon_path="\\DC01\SysmonEngTest\Sysmon.exe"

:: Variables to create a temp directory and pull and store the config in
set url="https://raw.githubusercontent.com/Avertium/sysmonConfiguration/master/sysmon-export.xml"
set temp_path="C:\temp-sysmon"
set sysmon_config="sysmon_config.xml"

:: Creates temp directory
mkdir %temp_path%

:: Change directory to temp directory
cd %temp_path%

:: Pull and store the current sysmon config from GitHub
curl %url% --output %sysmon_config%

:: Copy the sysmon.exe to the temp directory from share
copy %sysmon_path% %temp_path%\

:: Install sysmon using Avertium's config
cmd.exe /c "Sysmon.exe -accepteula -i %sysmon_config%"

:: Delete temp directory
cd ..
rd /s /q %temp_path%
