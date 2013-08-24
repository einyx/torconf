#!/bin/sh

echo "Unblocking IP: $ip<br>";

/sbin/ipfw -q table 10 delete $ip

exit 0;
