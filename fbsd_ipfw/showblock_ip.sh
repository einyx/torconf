#!/bin/sh

/sbin/ipfw table 10 list | sed 's/\/32 0//g'

exit 0;
