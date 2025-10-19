Function Get-IOCs {

#i hosted the page on my apache server to use InvokeWebRequest since 10.0.17.47 wasnt working
$IOC = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.32/IOC-1.html

#select the td items
$table = $IOC.ParsedHtml.body.getElementsByTagName("td") | Select-Object innerText

$items = @()
#put the items into pscustomobjects
for ($i = 0; $i -lt $table.Count; $i += 2) {
    $newItem = [pscustomobject]@{
        "Pattern"     = $table[$i].innerText;
        "Explanation" = $table[$i+1].innerText;
    }
    $items += $newItem
}#end of for

return $items
}