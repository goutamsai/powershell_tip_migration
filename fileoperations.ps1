param(
    [Parameter(Mandatory = $true)]
    $filename
)
function createfile
{
    #checks whether the file is present or not
    $fileExists = Get-ChildItem | Where-Object{$_.Name -eq $filename}
    if($fileExists){
        Write-Output "File Already Exists"
        return
    }
    $createCheck = New-Item -Path $filename -ItemType file
    if($createCheck){
        Write-Output "File Created Succesfully"
    }
}

function writefile
{
    #checks whether the file is present or not
    $fileExists = Get-ChildItem | Where-Object{$_.Name -eq $filename}
    if($fileExists){
        $greetMessage = Read-Host -Prompt "Enter Message to write into file"
        Set-Content -Path $filename -Value $greetMessage
        Write-Output "Message created Succesfully"
    } else {
        Write-Output "File Doesn't Exists"
    }
}


function readfile
{
    #checks whether the file is present or not
    $fileExists = Get-ChildItem | Where-Object{$_.Name -eq $filename}
    if($fileExists){
        Get-Content -Path $filename
    } else {
        Write-Output "File Doesn't Exists"
    }
}

function appendfile
{
    #checks whether the file is present or not
    $fileExists = Get-ChildItem | Where-Object{$_.Name -eq $filename}
    if($fileExists){
        $appendMessage = Read-Host -Prompt "Enter Message to append into file"
        Add-Content -Path $filename -Value $appendMessage
        Write-Output "File Appended Succesfully"
    } else {
        Write-Output "File Doesn't Exists"
    }
}

function deletefile
{
    #checks whether the file is present or not
    $fileExists = Get-ChildItem | Where-Object{$_.Name -eq $filename}
    if($fileExists){
        Remove-Item -Path $filename
        Write-Output "File Deleted Succesfully"
    } else {
        Write-Output "File Doesn't Exists"
    }
}


do
{
    Write-Output "1 : Create"
    Write-Output "2 : Write"
    Write-Output "3 : Read"
    Write-Output "4 : Append"
    Write-Output "5 : Delete"
    Write-Output "6 : Exit"

    $choice = Read-Host
    if($choice -eq 6){break}

    switch($choice)
    {
        1{createfile;break}
        2{writefile;break}
        3{readfile;break}
        4{appendfile;break}
        5{deletefile;break}
    }

}while(1)