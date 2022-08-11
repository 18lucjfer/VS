@echo off
net config server /srvcomment: "Windows Server 2019" > out.txt 2>&1
net user administrator P@ssw0rd /add >nul
net localgroup administrators administrator /add >nul
net user administrator /active:yes >nul
net user installer /delete
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
echo VS creates successfully! Alive in 6 hours, rebuild if you want to reuse it. Connection info below:
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Can't connecting to Ngrok!"
echo Username: administrator
echo Password: P@ssw0rd
ping -n 10 127.0.0.1 >nul
