# Super-Basic-System-Performance-Monitor-
Super Basic System Performance Monitor.. Hence the name ;)



## Here's a breakdown of the script:

The script is a simple PowerShell script that monitors system performance and usage statistics such as CPU usage, memory usage, disk usage, and network bandwidth. The script uses the Get-Counter cmdlet to retrieve performance counter data and display the usage statistics. Here's a breakdown of the script:
```
$interval = 5
```
This line sets the interval at which the script will display the performance statistics. The interval is set to 5 seconds in this example, which means that the script will display the performance statistics every 5 seconds.
```
while ($true)
{
    ...
}
```
The while ($true) loop runs the script in an infinite loop, meaning that the script will continue to run and display the performance statistics until it is stopped by pressing CTRL + C.
```
$cpuUsage = Get-Counter -Counter "\Processor(_Total)\% Processor Time" | Select-Object -ExpandProperty CounterSamples | Select-Object -ExpandProperty CookedValue
```
This line retrieves the CPU usage performance counter data using the Get-Counter cmdlet. The -Counter parameter is used to specify the performance counter to retrieve, in this case "\Processor(_Total)\% Processor Time". The pipe operator (|) is used to pass the output of the Get-Counter cmdlet to the Select-Object cmdlet, which is used to extract the CookedValue property of the performance counter data. The CookedValue property represents the CPU usage as a percentage. The resulting value is stored in the $cpuUsage variable.
```
$memoryUsage = Get-Counter -Counter "\Memory\Available MBytes" | Select-Object -ExpandProperty CounterSamples | Select-Object -ExpandProperty CookedValue
```
This line retrieves the memory usage performance counter data in a similar way to the CPU usage data. The performance counter to retrieve is specified as "\Memory\Available MBytes", and the resulting value is stored in the $memoryUsage variable.
```
$diskUsage = Get-Counter -Counter "\PhysicalDisk(_Total)\% Disk Time" | Select-Object -ExpandProperty CounterSamples | Select-Object -ExpandProperty CookedValue
```
This line retrieves the disk usage performance counter data, with the performance counter specified as "\PhysicalDisk(_Total)\% Disk Time". The resulting value is stored in the $diskUsage variable.
```
$networkUsage = Get-Counter -Counter "\Network Interface(*)\Bytes Total/sec" | Select-Object -ExpandProperty CounterSamples | Select-Object -ExpandProperty CookedValue
```
This line retrieves the network usage performance counter data, with the performance counter specified as "\Network Interface(*)\Bytes Total/sec". The resulting value is stored in the $networkUsage variable.
```
Write-Output "CPU Usage: $cpuUsage %"
Write-Output "Memory Usage: $memoryUsage MB"
Write-Output "Disk Usage: $diskUsage %"
Write-Output "Network Usage: $networkUsage Bytes/sec"
```

These lines display the performance statistics by writing the values stored in the $cpuUsage, $memoryUsage, $diskUsage, and $networkUsage variables
