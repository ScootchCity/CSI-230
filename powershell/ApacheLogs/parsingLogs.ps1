function ApacheLogs1(){
$logsnotformatted = Get-Content C:\xampp\apache\logs\access.log
$tableRecords = @()

for($i = 0; $i -lt $logsnotformatted.Count; $i++){
    #Split a string into words
    $words = $logsnotformatted[$i].Split(" ");

    $tableRecords += [PSCustomObject]@{ "IP" = $words[0];
                                        "Time" = $words[3];#.Trim('['); had to remove this as it was giving me formatting problems that i cant figure out
                                        "Method" = $words[5].Trim('"');
                                        "Page" = $words[6];
                                        "Protocol" = $words[7];
                                        "Response" = $words[8];
                                        "Referrer" = $words[10];
                                        "Client" = $words[11..($words.Length-1)];
    }
}
return $tableRecords | Where-Object { $_.IP -ilike "10.*" }
}