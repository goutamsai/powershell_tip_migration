<#
.Synopsis
Renames the remotely connected client machine
.Description
Renames the remotely connected client machine
.Example
C:\powershell_scripts\renameclient
#>

param(
    [Parameter(Mandatory = $true)]
    $newclientname
)
# code to remotely connect the client machine
Enter-PSSession client

#code to rename the client machine
Rename-Computer -NewName $newclientname

#code to restart the computer
Restart-Computer -Force