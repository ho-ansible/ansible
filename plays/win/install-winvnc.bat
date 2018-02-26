: : # VNC Server on Windows
: : + TigerVNC better than TightVNC on Linux
: : + TigerVNC's WinVNC is neglected
: : + TightVNC's WinVNC can use DFMirage mirror driver
: : + UltraVNC provides no benefit, not well maintained
: : + RealVNC requires free license

: : Download tightvnc-VER-setup-64bit.msi
: : Download dfmirage-setup-VER.exe
: : Run: install-winvnc.bat <vnc-msi> <dfmirage-exe>

%2 /verysilent /norestart

msiexec /quiet /norestart /i %1 ^
  ADDLOCAL=Server ^
  SERVER_ADD_FIREWALL_EXCEPTION=0 ^
  VIEWER_ADD_FIREWALL_EXCEPTION=0 ^
       SET_ACCEPTHTTPCONNECTIONS=1 ^
  VALUE_OF_ACCEPTHTTPCONNECTIONS=0 ^
       SET_IPACCESSCONTROL=1 ^
  VALUE_OF_IPACCESSCONTROL="10.100.1.0-10.100.1.255:0,0.0.0.0-255.255.255.255:1" ^
       SET_LOGLEVEL=0 ^
  VALUE_OF_LOGLEVEL=0 ^
       SET_REMOVEWALLPAPER=1 ^
  VALUE_OF_REMOVEWALLPAPER=0 ^
       SET_RUNCONTROLINTERFACE=1 ^
  VALUE_OF_RUNCONTROLINTERFACE=0 ^
       SET_USEVNCAUTHENTICATION=1 ^
  VALUE_OF_USEVNCAUTHENTICATION=0 ^
       SET_PASSWORD=1 ^
  VALUE_OF_PASSWORD="pass__96" ^
       SET_USECONTROLAUTHENTICATION=1 ^
  VALUE_OF_USECONTROLAUTHENTICATION=1 ^
       SET_CONTROLPASSWORD=1 ^
  VALUE_OF_CONTROLPASSWORD="pass__96" ^

netsh advfirewall firewall del rule name=vnc 
netsh advfirewall firewall add rule name=vnc ^
  dir=in protocol=tcp localport=5900-5910 ^
  profile=domain,private remoteip=10.100.1.0/24 ^
  action=allow
