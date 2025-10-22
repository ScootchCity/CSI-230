clear

$configPath = "configuration.txt"

$menu = "Please choose your operation:`n"
$menu += "1 - Show Configuration`n"
$menu += "2 - Change Configuration`n"
$menu += "3 - Exit`n"

function Show-Config {
    $content = Get-Content -Path $configPath
    $configObject = [PSCustomObject]@{
        Days = $content[0]
        ExecutionTime = $content[1]
    }
    $configObject
}

function Change-Config {
    $days = Days-Verification
    if(-not $days) { #return to menu if invalid case
        return
    }

    $time = Time-Verification
    if(-not $time) { #return to menu if invalid case
        return
    }

    $newConfigContent = @( #put content into an array to be written to config file
        $days,
        $time
    )

    Set-Content -Path $configPath -Value $newConfigContent
    Write-Host "Configuration Changed`n"
}

function Choice-Verification { #make sure input is 1,2,3 otherwise output message and return to loop
    $choice = Read-Host
    if($choice -match '^[123]$') {
        $choice
    }
    else {
        Write-Host "Invalid Choice`n"
    }
}

function Days-Verification {
    $days = Read-Host "Enter the number of days for which the logs will be obtained "
    if($days -match '^\d+$') { # verify days is a digit (\d), and one or more are allowed (+)
        $days
    }
    else {
        Write-Host "Invalid input. Days must be a digit."
        return
    }
}

function Time-Verification {
    $time = Read-Host "Enter the daily execution time of the script "
    if($time -match '(1[0-2]|\d):[0-5]\d\s[AP]M') {
        $time
    }
    else {
        Write-Host "Invalid input. Time must be in the form digit:digitdigit AM/PM"
        return
    }
}

$operation = $true #menu loop conditional

while($operation){
    Write-Host $menu
    $choice = Choice-Verification
    
    if($choice -eq "3"){
        $operation = $false #loop will close
    }
    if($choice -eq "1"){
        Show-Config | Format-Table
    }
    if($choice -eq "2"){
        Change-Config
    }
}