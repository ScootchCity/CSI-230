Function Get-Logs {
$unFormattedLogs = Get-Content -Path "access.log"

$tableRecords = @()

for($i = 0; $i -lt $unFormattedLogs.Count; $i++){
    #Split a string into words
    $words = $unFormattedLogs[$i].Split(" ");

    $tableRecords += [PSCustomObject]@{ "IP" = $words[0];
                                        "Time" = $words[3].Trim('[');
                                        "Method" = $words[5].Trim('"');
                                        "Page" = $words[6];
                                        "Protocol" = $words[7].Trim('"');
                                        "Response" = $words[8];
                                        "Referrer" = $words[10];
    }
}#end of for

return $tableRecords
}