<#
.Synopsis
Starts a service in the remotely connected client machine
.Description
Starts a service in the remotely connected client machine
.Example
C:\powershell_scripts\startservice.ps1 "BITS"
#>

param(
    [Parameter(Mandatory = $true)]
    $servicename
)
# code to remotely connect the client machine
Enter-PSSession client

#code to start a service
Start-Service $servicename

#code to display the status of service
Get-Service -Name $servicename