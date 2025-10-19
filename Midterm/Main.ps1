clear

#challenges 1 and 2 where wrapped in functions and formatting of the return was removed
#imports
. .\Challenge1.ps1
. .\Challenge2.ps1
. .\Challenge3.ps1

#data from other functions into vars
$IOC = Get-IOCs
$Logs = Get-Logs

$IOCMatches = Get-IOC-Matches -IOC $IOC -Logs $Logs

$IOCMatches | Format-Table