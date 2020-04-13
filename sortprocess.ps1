<#
.Synopsis
Sorts all th processes in the remotely connected client based on their start time
.Description
Sorts all th processes in the remotely connected client based on their start time
.Example
C:\powershell_scripts\sortprocess
#>

# code to remotely connect the client machine
Enter-PSSession client

#code to sort the processes based on start time
Get-Process | Select-Object -Property ID,CPU,StartTIme | 
    Sort-Object -Property StartTime