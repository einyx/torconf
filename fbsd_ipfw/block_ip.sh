#!/bin/sh

echo "Blocking IP: $ip<br>";

/sbin/ipfw -q table 10 add $ip

echo "<br><br>Result:";
echo "<br><br><textarea cols=160 rows=60>";

/sbin/ipfw table 10 list

echo "</textarea>";

exit 0;
