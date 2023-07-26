function Get-Uptime {
    $os = Get-WmiObject win32_operatingsystem
    $uptime = (Get-Date) - ($os.ConvertToDateTime($os.lastbootuptime))
    
    [pscustomobject]@{
        Days = $Uptime.Days
        Hours = $uptime.Hours
        Minutes = $uptime.Minutes
        
    }
 }

 $uptime = Get-Uptime

if ($uptime.Hours -gt 3) {
    Write-Output "Uptime is more than 3 hours"
    exit 1
}
else{
    Write-Output "Uptime is OK!"
    exit 0
}