Start-Process PowerShell -ArgumentList "Write-Host '(1/4) Chkdsk' -ForegroundColor Gray -BackgroundColor DarkGreen; chkdsk /scan;
Write-Host '`n(2/4) SFC - 1st run' -ForegroundColor Gray -BackgroundColor DarkGreen; sfc /scannow;
Write-Host '`n(3/4) DISM' -ForegroundColor Gray -BackgroundColor DarkGreen; DISM /Online /Cleanup-Image /RestoreHealth;
Write-Host '`n(4/4) SFC - 2nd run' -ForegroundColor DarkGreen; sfc /scannow;
Read-Host '`n`nPress Enter to Continue'" -Verb runas