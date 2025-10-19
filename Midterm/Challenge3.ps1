Function Get-IOC-Matches {
    param(
        [array]$IOC,
        [array]$Logs
    )

    $patterns = $IOC.Pattern
    #put all the patterns into one big regex with ors
    $regex = $patterns -join '|'

    #filter by matching pages
    $matches = $Logs | Where-Object {$_.Page -match $regex}

    return $matches
}