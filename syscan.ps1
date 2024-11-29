$isAdmin = (New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    try {
        $command = $MyInvocation.MyCommand.Definition
        Start-Process powershell -Verb RunAs -Wait -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command $command"
        exit
    }
    catch {
        Write-Host "`n---ERROR!!---" -ForegroundColor White -BackgroundColor Red;
        Write-Host "You need admin rights to run this script.`n"
        return 1
    }
}

Clear-Host;
Write-Host "(1/4) Chkdsk" -ForegroundColor Gray -BackgroundColor DarkGreen; chkdsk /scan;
Write-Host "`n(2/4) SFC - 1st run" -ForegroundColor Gray -BackgroundColor DarkGreen; sfc /scannow;
Write-Host "`n(3/4) DISM" -ForegroundColor Gray -BackgroundColor DarkGreen; DISM /Online /Cleanup-Image /RestoreHealth;
Write-Host "`n(4/4) SFC - 2nd run" -ForegroundColor DarkGreen; sfc /scannow;
Read-Host "`n`nPress Enter to Continue`n"
