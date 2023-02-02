$interval = 5

while ($true)
{
    $cpuUsage = Get-Counter -Counter "\Processor(_Total)\% Processor Time" | Select-Object -ExpandProperty CounterSamples | Select-Object -ExpandProperty CookedValue
    $memoryUsage = Get-Counter -Counter "\Memory\Available MBytes" | Select-Object -ExpandProperty CounterSamples | Select-Object -ExpandProperty CookedValue
    $diskUsage = Get-Counter -Counter "\PhysicalDisk(_Total)\% Disk Time" | Select-Object -ExpandProperty CounterSamples | Select-Object -ExpandProperty CookedValue
    $networkUsage = Get-Counter -Counter "\Network Interface(*)\Bytes Total/sec" | Select-Object -ExpandProperty CounterSamples | Select-Object -ExpandProperty CookedValue

    Write-Output "CPU Usage: $cpuUsage %"
    Write-Output "Memory Usage: $memoryUsage MB"
    Write-Output "Disk Usage: $diskUsage %"
    Write-Output "Network Usage: $networkUsage Bytes/sec"

    Start-Sleep -Seconds $interval
}
