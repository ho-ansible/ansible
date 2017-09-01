#Requires -Version 3.0
# win-setup.ps1
# PowerShell script: 
# On ansible control host: pip install "pywinrm>=0.2.2"

$fw = 'netsh advfirewall firewall'
$vpnonly = 'localip=10.100.1.0/24 remoteip=10.100.1.0/24'

###### tinc VPN

$tincURL = 'https://www.tinc-vpn.org/packages/windows/tinc-1.1pre14-install.exe'
$tincEXE = 'tinc-install.exe'

# Install tinc
iwr -outfile "$tincEXE" "$tincURL"
".\$tincEXE" 
cd 'C:\Program Files\tinc'

# Install TAP adapter
cd tap-win64
addtap.bat
cd ..

# Configure the network interface and firewall
netsh interface set interface name = "Ethernet 2" newname = "TincVPN"
Set-NetConnectionProfile -InterfaceAlias TincVPN -NetworkCategory Private
$fw add rule name=tinc dir=in action=allow localport=655 protocol=UDP

# Configure service
tinc
Start-Service -Name tinc

###### Enable PowerShell Remoting
# http://docs.ansible.com/ansible/latest/intro_windows.html
# https://github.com/ansible/ansible/blob/devel/examples/scripts/ConfigureRemotingForAnsible.ps1
Enable-PSRemoting -Force -SkipNetworkProfileCheck -ErrorAction Stop

$psrule = 'rule name="Allow WinRM HTTPS"'
$fwrule = $fw show $psrule
If ($fwrule.count -ge 5) {
  $fw del $psrule
}
$fw add $psrule dir=in action=allow localport=5986 protocol=TCP $vpnonly

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
$fw add rule name=ssh dir=in action=allow localport=26 protocol=TCP $vpnonly

