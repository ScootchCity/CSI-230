#!/bin/bash

file="/var/log/apache2/access.log"

function page2s(){
results=$(cat "$file" | cut -d' ' -f1,7 | tr -d "/" | grep page2)
}

function pageCount(){
counts=$(cat "$file" | cut -d' ' -f7 | sort | uniq -c)
}

function countingCurlAccess(){
curlCount=$(cat "$file" | cut -d' ' -f1,12 | grep curl | sort | uniq -c)
}

#pageCount
#echo "$counts"

countingCurlAccess
echo "$curlCount"
