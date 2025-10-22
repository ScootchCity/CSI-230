. .\sraping.ps1

clear

$FullTable=daysTranslator(gatherClasses)


#list all the classes of instructor Furkan Paligu
#$FullTable | Select-Object "Class Code", Instructor, Location, Days, "Time Start", "Time End" |
#             Where-Object{$_."Instructor" -ilike "Furkan Paligu"}

#List all JOYC 310 classes on mondays, show only code and times
#sort by start time
#$FullTable | Where-Object {($_.Location -ilike "JOYC 310") -and ($_.days -contains "Monday")} |
#             Sort-Object "Time Start" |
#             Select-Object "Time Start", "Time End", "Class Code"

#make a list of all the instructors that teach at least 1 course in
#SYS, SEC, NET, FOR, CSI, DAT'
#Sort by name, make it unique

#$ITSInstructors = $FullTable | Where-Object { ($_."Class Code" -ilike "SYS*") -or
#                                              ($_."Class Code" -ilike "NET*") -or
#                                              ($_."Class Code" -ilike "SEC*") -or
#                                              ($_."Class Code" -ilike "FOR*") -or
#                                              ($_."Class Code" -ilike "CSI*") -or
#                                              ($_."Class Code" -ilike "DAT*") } `
#                             | Sort-Object "Instructor" `
#                             | Select-Object "Instructor" -Unique
#$ITSInstructors

#group all instructors by number of classes they teach
$FullTable | Where{$_.Instructor -in $ITSInstructors.Instructor}`
           | Group-Object "Instructor" | Select-Object Count, Name | Sort-Object Count -descending