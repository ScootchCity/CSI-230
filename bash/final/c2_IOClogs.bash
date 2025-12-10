#!/bin/bash

iocFile="$1"
logFile="$2"

#first grep using patterns from IOC file
#cut just the fields we need
#sed the bracket away

grep -f "$iocFile" "$logFile" | cut -d ' ' -f1,4,7 | \
sed 's/\[//' > report.txt
