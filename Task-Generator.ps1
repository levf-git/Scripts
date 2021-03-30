param 
([Parameter(Position=0)][string]$TaskName, [Parameter(Position=1)][int]$WaitSeconds)

Create-Task -TaskName $TaskName
Change-TaskStatus -WaitSeconds $WaitSeconds -TaskName $TaskName
Get-Alltask

function Create-Task([string]$TaskName) {

$action = New-ScheduledTaskAction -Execute 'powershell.exe'-Argument 'C:\scripts\mytask.ps1'
$trigger = New-ScheduledTaskTrigger -once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Seconds 60)
Register-ScheduledTask -Action $action -Trigger $trigger -TaskPath '\my_tasks' -TaskName $TaskName -Description 'test_task' -RunLevel Highest

    
    
}

function Change-TaskStatus ([int]$WaitSeconds,[string]$TaskName){
    Start-Sleep -Seconds $WaitSeconds
    Get-ScheduledTask $TaskName | Disable-ScheduledTask 
    
}

function Get-Alltask (){
    param(
        
    )

        Get-ScheduledTask  | Select-Object TaskName | Format-Table -HideTableHeaders -AutoSize
    
    
}

