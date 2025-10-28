#!/bin/bash

# List all the ips in the given network prefix
# /24 only

# Usage: bash IPList.bash 10.0.17
[ $# -ne 1 ] && echo "Usage: $0 <Prefix>" && exit 1

# Prefix is the first imput taken
prefix=$1

# Verify input length
[ ${#prefix} -lt 5 ] && \
printf "Prefix length is too short\nPrefix example: 10.0.17\n" &&\
exit 1

for i in {1..254}
do
    #using -q for a simple yes/no. We already know what ip is being
    #pinged so it seems cleaner to me?
    ping -c 1 $prefix.$i | grep -q '1 received' && echo $prefix.$i
done
