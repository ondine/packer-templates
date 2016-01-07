powershell -Command "(New-Object System.Net.WebClient).DownloadFile('http://192.168.1.4/depot/microsoft/powershell/wmf5/Win8.1AndW2K12R2-KB3066437-x64.msu', 'C:\Windows\Temp\Win8.1AndW2K12R2-KB3066437-x64.msu')" <NUL

START /WAIT wusa.exe C:\Windows\Temp\Win8.1AndW2K12R2-KB3066437-x64.msu  /quiet /norestart
