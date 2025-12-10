#!/bin/bash

inFile="report.txt"
outFile="report.html"

#stuff before the table. took style/title from IOC.html
echo "<html><head><title>Access logs with IOC</title><style>table, th, td {border: 1px solid black;}</style></head><body><br></br> Access logs with IOC: <br></br><table>" > "$outFile"

#loop over report lines
while read -r ip date url; do 
    echo "<tr><td>$ip</td><td>$date</td><td>$url</td>" >> "$outFile"
done < "$inFile"

#close the top tags
echo "</table></body></html>" >> "$outFile"

#move the report to /var/www/html
sudo mv "$outFile" /var/www/html/
