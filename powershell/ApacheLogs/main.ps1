. .\Apache-Logs.ps1
. .\parsingLogs.ps1

$ips = Get-Apache-Logs -pageRef "index.html" -httpCode "200" -browser "chrome"

$ips

$tableRecords = ApacheLogs1

$tableRecords | Format-table -AutoSize -Wrap