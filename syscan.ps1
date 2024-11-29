$isAdmin = (New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    try {
        $command = $MyInvocation.MyCommand.Definition
        Start-Process powershell -Verb RunAs -Wait -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command $command"
        return $null
    }
    catch {
        Write-Host "`n---ERROR!!---" -BackgroundColor Red;
        Write-Host -NoNewline "";
        Write-Host "You need admin rights to run this script.`n"
        return $null
    }
}

Clear-Host;
Write-Host "(1/4) Chkdsk" -BackgroundColor Green;
Write-Host "`n(2/4) SFC - 1st run" -BackgroundColor Green;
Write-Host "`n(3/4) DISM" -BackgroundColor DarkGreen;
Write-Host "`n(4/4) SFC - 2nd run" -BackgroundColor Green;
Write-Host "`n`n"
Pause
