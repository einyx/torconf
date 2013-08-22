## Tune tcp perf
sysctl -w net.core.rmem_max = 33554432
sysctl -w net.core.wmem_max = 33554432
sysctl -w net.ipv4.tcp_rmem = 4096 87380 33554432
sysctl -w net.ipv4.tcp_wmem = 4096 65536 33554432
sysctl -w net.core.rmem_default = 524287
sysctl -w net.core.wmem_default = 524287
sysctl -w net.core.optmem_max = 524287
sysctl -w net.core.netdev_max_backlog = 300000
sysctl -w net.ipv4.tcp_mem = 33554432 33554432 33554432
sysctl -w net.ipv4.tcp_max_orphans = 300000
sysctl -w net.ipv4.tcp_max_syn_backlog = 300000
sysctl -w net.ipv4.tcp_fin_timeout = 4
sysctl -w vm.min_free_kbytes = 65536
sysctl -w net.ipv4.ip_conntrack_max = 655360
sysctl -w net.netfilter.nf_conntrack_tcp_timeout_established = 7200
sysctl -w net.netfilter.nf_conntrack_checksum = 0
sysctl -w net.netfilter.nf_conntrack_max = 655380
sysctl -w net.netfilter.nf_conntrack_tcp_timeout_syn_sent = 15
sysctl -w net.nf_conntrack_max = 655360
sysctl -w net.ipv4.tcp_keepalive_time = 60
sysctl -w net.ipv4.tcp_keepalive_intvl = 10
sysctl -w net.ipv4.tcp_keepalive_probes = 3
sysctl -w net.ipv4.ip_local_port_range = 1025 65530
sysctl -w net.core.somaxconn = 30720
sysctl -w net.ipv4.tcp_max_tw_buckets = 2000000
sysctl -w net.ipv4.tcp_timestamps = 0
## Filter annoying people
iptables -A OUTPUT -m opendpi --edonkey --gadugadu --fasttrack --gnutella --directconnect --bittorrent --winmx --soulseek -j REJECT
iptables -A OUTPUT -p tcp -m state –state NEW -m geoip –dst-cc IT -j REJECT
iptables -A OUTPUT -p tcp -m state –state NEW -m geoip –dst-cc SW -j REJECT

## load
modprobe aesni_intel
## make permanent
echo aesni_intel >> /etc/modules

DIST=`lsb_release -sc`
# add tor sources
echo "deb     http://deb.torproject.org/torproject.org $DIST main" >> /etc/apt/sources.list.d/torproject.list
echo "deb     http://deb.torproject.org/torproject.org experimental-$DIST main" >> /etc/apt/sources.list.d/torproject.list
apt-key adv --recv-keys --keyserver keys.gnupg.net 886DDD89
aptitude update
apt-get install deb.torproject.org-keyring


