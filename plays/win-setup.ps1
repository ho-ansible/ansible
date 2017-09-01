## win-setup.ps1
# Windows PowerShell script

###### tinc VPN

$tincURL = 'https://www.tinc-vpn.org/packages/windows/tinc-1.1pre14-install.exe'
$tincEXE = 'tinc-install.exe'

# Install tinc
iwr -outfile "$tincEXE" "$tincURL"
".\$tincEXE" 
cd 'C:\Program Files\tinc'
tinc

# Install TAP adapter
cd tap-win64
addtap.bat
cd ..

# Configure the network interface and firewall
netsh interface set interface name = "Ethernet 2" newname = "TincVPN"
Set-NetConnectionProfile -InterfaceAlias TincVPN -NetworkCategory Private
netsh advfirewall firewall add rule name=tinc dir=in action=allow localport=655 protocol=UDP

###### Cygwin SSH

$cyg = 'C:\Cygwin64'
$cygEXE = 'https://cygwin.com/setup-x86_64.exe'
$cygURL = 'http://mirrors.kernel.org/sourceware/cygwin/'
$cygPkgs = 'wget,openssh,cygrunsrv,python'
  # vim-minimal,procps

# Install Cygwin
md "$cyg\pkg"
cd "$cyg\pkg"
iwr "$cygEXE"
.\setup-x86_64.exe -nq -R "$cyg" -l "$cyg\pkg" -s "$cygURL" -P "$cygPkgs"

# Configure ssh
"$cyg\usr\bin\ssh-host-config" -p 26 -y
netsh advfirewall firewall add rule name=ssh dir=in action=allow ^
  localport=26 protocol=TCP remoteip=10.100.1.0/24

