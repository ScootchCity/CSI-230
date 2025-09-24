#Apache-Logs function
function Get-Apache-Logs {
    param (
        [string]$pageRef,
        [string]$httpCode, 
        [string]$browser
    )
    $logs = Get-Content C:\xampp\apache\logs\access.log | 
       Select-String " $httpCode " | Select-String $pageRef | Select-String $browser

    #Define regex for IP's
    $regex = [regex] "\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}"

    #Get records that maths the regex
    $ipsUnorganized = $regex.Matches($Logs)

    #Get ip's as pscustomobject
    $ips = @()
    for($i=0; $i -lt $ipsUnorganized.Count; $i++){
        $ips += [PSCustomObject]@{ "IP" = $ipsUnorganized[$i].Value;}
    }

    #Count ips
    $ipsoftens = $ips | Where-Object { $_.IP -ilike "10.*" }
    $counts = $ipsoftens | Group-Object IP
    $counts | Select-Object Count, Name
}