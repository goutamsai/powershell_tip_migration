$session = New-PSSession -ComputerName client

Invoke-Command -Session $session {Get-Service | Where-Object{$_.status -eq "Running"}}