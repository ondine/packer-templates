call c:\windows\system32\winrm quickconfig -q
call c:\windows\system32\winrm quickconfig -transport:http
call c:\windows\system32\winrm set winrm/config @{MaxTimeoutms="7200000"}
call c:\windows\system32\winrm set winrm/config/winrs @{MaxMemoryPerShellMB="0"}
call c:\windows\system32\winrm set winrm/config/winrs @{MaxProcessesPerShell="0"}
call c:\windows\system32\winrm set winrm/config/winrs @{MaxShellsPerUser="0"}
call c:\windows\system32\winrm set winrm/config/service @{AllowUnencrypted="true"}
call c:\windows\system32\winrm set winrm/config/service/auth @{Basic="true"}
call c:\windows\system32\winrm set winrm/config/client/auth @{Basic="true"}
call c:\windows\system32\winrm set winrm/config/listener?Address=*+Transport=HTTP @{Port="5985"}

netsh advfirewall firewall set rule group="remote administration" new enable=yes
netsh firewall add portopening TCP 5985 "Port 5985"
net stop winrm
sc.exe config winrm start= auto
net start winrm
