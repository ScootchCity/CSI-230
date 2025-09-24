clear

#Get logs with 404 into $notfounds
$notfounds = Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 '

#Define regex for IP's
$regex = [regex] "\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}"

#Get notfounds records that maths the regex
$ipsUnorganized = $regex.Matches($notfounds)

#Get ip's as pscustomobject
$ips = @()
for($i=0; $i -lt $ipsUnorganized.Count; $i++){
  $ips += [PSCustomObject]@{ "IP" = $ipsUnorganized[$i].Value;}
}

#Count ips
$ipsoftens = $ips | Where-Object { $_.IP -ilike "10.*" }
$counts = $ipsoftens | Group-Object IP
$counts | Select-Object Count, Name