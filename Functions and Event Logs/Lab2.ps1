function Get-loginoutsTable {
param(
[int]$days
)

# Check System log for those specific Instance IDs
$loginouts = Get-EventLog System -Source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-$days)

$loginoutsTable = @() #Empty array
for($i=0; $i -lt $loginouts.Count; $i++){

#Create event property value
$event = ""
if($loginouts[$i].EventID -eq 7001) {$event="Logon"}
if($loginouts[$i].EventID -eq 7002) {$event="Logoff"}

#Create user property value
#Used "https://stackoverflow.com/questions/39472643/using-securityidentifier-classs-translate-method-to-find-domain-names-from-sid" 
#and added .Value to the end
$sid = $loginouts[$i].ReplacementStrings[1]
$user = (New-Object System.Security.Principal.SecurityIdentifier($sid)).Translate([System.Security.Principal.NTAccount]).Value


#Add each custom object to the array
$loginoutsTable += [PSCustomObject]@{"Time" = $loginouts[$i].TimeWritten
                                       "Id" = $loginouts[$i].EventID
                                    "Event" = $event;
                                     "User" = $user;
                                     }
} #End of for
$loginoutsTable
}

function Get-shutdownsTable {
param(
[int]$days
)

#Check System log for those specific Instance IDs
#Filter with Where-Object since Eventlog has more EventID's than we need
$shutdowns = Get-EventLog System -Source Eventlog -After (Get-Date).AddDays(-$days) | Where-Object {$_.EventID -eq 6006}

$shutdownsTable = @() #Empty array
for($i=0; $i -lt $shutdowns.Count; $i++){

#Create event property value
#Constant since we filter in the get
$event = "Shutdown"

#Create user property value
$user = "System"

#Add each custom object to the array
$shutdownsTable += [PSCustomObject]@{"Time" = $shutdowns[$i].TimeWritten
                                       "Id" = $shutdowns[$i].EventID
                                    "Event" = $event;
                                     "User" = $user;
                                     }
} #End of for
$shutdownsTable
}

function Get-startupsTable {
param(
[int]$days
)

#Check System log for those specific Instance IDs
#Filter with Where-Object since Eventlog has more EventID's than we need
$startups = Get-EventLog System -Source Eventlog -After (Get-Date).AddDays(-$days) | Where-Object {$_.EventID -eq 6005}

$startupsTable = @() #Empty array
for($i=0; $i -lt $startups.Count; $i++){

#Create event property value
#Constant since we filter in the get
$event = "Startup"

#Create user property value
$user = "System"

#Add each custom object to the array
$startupsTable += [PSCustomObject]@{"Time" = $startups[$i].TimeWritten
                                      "Id" = $startups[$i].EventID
                                   "Event" = $event;
                                    "User" = $user;
                                    }
} #End of for
$startupsTable
}