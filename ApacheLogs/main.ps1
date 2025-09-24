. .\Apache-Logs.ps1

$ips = Get-Apache-Logs -pageRef "index.html" -httpCode "200" -browser "chrome"

$ips