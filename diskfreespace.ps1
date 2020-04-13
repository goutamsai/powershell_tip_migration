<#
.Synopsis
Gives the amount of free space present in each drive of the remotely accessed client system
.Description
Gives the amount of free space present in each drive of the remotely accessed client system
.Example
C:\powershell_scripts\diskfreespace
#>

# code to remotely connect the client machine
Enter-PSSession client

#code to get the free space in every drive in the system
Get-CimInstance -Class Win32_LogicalDisk |
    Select-Object -Property Name, @{
        name='FreeSpace';
        expression={($_.FreeSpace/1GB).ToString('F2')}
    }