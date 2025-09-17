. (Join-Path $PSScriptRoot Lab2.ps1)
clear

#Get login and logoffs from the last 15 days
$loginoutsTable = Get-loginoutsTable -days 15
$loginoutsTable

#Get shut downs from the last 25 days
$shutdownsTable = Get-shutdownsTable -days 25
$shutdownsTable

#Get start ups from the last 25 days
$startupsTable = Get-startupsTable -days 25
$startupsTable