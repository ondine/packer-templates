
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('http://192.168.1.4/depot/vmware/tools/latest/windows/x64/VMware-tools-10.0.5-3227872-x86_64.exe', 'C:\Windows\Temp\VMware-tools-10.0.5-3227872-x86_64.exe')" <NUL
cmd /c C:\Windows\Temp\VMware-tools-10.0.5-3227872-x86_64.exe /S /v"/qn REBOOT=R"
