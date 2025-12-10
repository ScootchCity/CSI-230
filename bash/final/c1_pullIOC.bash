#!/bin/bash

iocPage="http://10.0.17.17/IOC.html"


#[^<]* matches any number of charachters that are not <
#sed uses a similar <[^>]*> to remove any tag. /g does for all instances
#sed the tabs out too
#awk to get every other line 
curl "$iocPage" | grep '<td>[^<]*</td>' | \
sed 's/<[^>]*>//g' | sed 's/\t//g' | \
awk 'NR%2' > IOC.txt

# could make this a one liner, but whatever
