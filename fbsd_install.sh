freebsd-update fetch
freebsd-update install

pkg_add -r sudo
pkg_add -r zsh
pkg_add -r py27-pip
pkg_add -f -r py27-arm

echo firewall_enable="YES" >> /etc/rc.conf
echo firewall_type="simple" >> /etc/rc.conf
echo firewall_script="/etc/ipfw.rules" >> /etc/rc.conf
echo firewall_logging="YES" >> /etc/rc.conf

pip install obfsproxy

echo "net.inet.ip.fw.dyn_max=65536" >> /etc/sysctl.conf

