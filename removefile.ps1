<#
.Synopsis
Removes a specific file from the remotely connected client machine
.Description
Removes a specific file from the remotely connected client machine
.Example
C:\powershell_scripts\removefile.ps1 "testfile.txt"
#>

param(
    [Parameter(Mandatory = $true)]
    $filename
)
# code to remotely connect the client machine
Enter-PSSession client

#concatenates the filename with the path
$removepath = 'C:\powershell_scripts\'+$filename

#remove the specific file from the remotely connected client machine
Remove-Item -Path $removepath

#displays the status of the directory
ls C:\powershell_scripts