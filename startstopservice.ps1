param(
    [Parameter(Mandatory = $true)]
    $servicename
)

function startservice
{
    $status = Get-Service -Name $servicename | Select-Object -Property Status
    if($status.Status -eq "Running"){
        Write-Output "Service Already Running"
        Write-Output "Restarting Service"
        Restart-Service -Name $servicename

    }else{
        Start-Service -Name $servicename
        Write-Output "Service Started Succesfully"
    }
}

function stopservice
{
    $status = Get-Service -Name $servicename | Select-Object -Property Status
    if($status.Status -ne "Stopped"){
        Stop-Service -Name $servicename
        Write-Output "Service Stoped Succesfully"
    }else{
        Write-Output "Service Already Stoped"
    }
}

do
{
    Write-Output "1 : Start"
    Write-Output "2 : Stop"
    Write-Output "3 : Exit"

    $choice = Read-Host
    if($choice -eq 3){break}

    switch($choice)
    {
        1{startservice;break}
        2{stopservice;break}
    }

}while(1)