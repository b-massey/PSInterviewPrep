Function ListRunningServices() {
    $ComputerName = "$env:COMPUTERNAME"
    $ServiceState = "running"
    $csvFileName = "servicesList.csv"

    Get-WmiObject -Class Win32_Service -ComputerName $ComputerName | 
        Where-Object State -EQ $ServiceState | 
        Select-Object DisplayName, StartName, State |
        Export-Csv $csvFileName -NoTypeInformation



}


ListRunningServices