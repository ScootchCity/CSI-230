#!/bin/bash

logfile="/home/lucy/CSI-230/bash/email_access/fileaccesslog.txt"
emailfile="/home/lucy/CSI-230/bash/email_access/emailform.txt"

date=$(date)

echo "File Was Accessed $date" >> "$logfile"

echo "To:lloyd.ivester+csi230@mymail.champlain.edu" > "$emailfile"
echo "Subject:Sensitive File Access" >> "$emailfile"
echo "" >> "$emailfile"
cat "$logfile" >> "$emailfile"

cat "$emailfile" | ssmtp lloyd.ivester+csi230@mymail.champlain.edu
