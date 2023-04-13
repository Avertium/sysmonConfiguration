@echo off
setlocal
sc query "nxlog" | Find "RUNNING" >NUL
echo [+] Downloading NxLog Community Edition...
@powershell (new-object System.Net.WebClient).DownloadFile('https://github.com/TerraVerde/sysmonConfiguration/raw/master/nxlog-ce-3.1.2319.msi','nxlog-ce.3.1.2319.msi')	
echo [+] Installing NxLog Community Edition...
msiexec nxlog-ce-3.1.2319.msi /quiet
sc failure nxlog actions= restart/10000/restart/10000// reset= 120
@powershell Copy-Item "\\DC01\Files\nxlog.conf" -Destination "C:\Program Files (x86)\nxlog\conf\nxlog.conf"
echo [+] Starting NxLog Community Edition...
net start nxlog
:exit