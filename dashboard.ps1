# DiscoHub Dashboard
$DiscoHubPath = "$env:APPDATA\DiscoHub"
$configPath = "$DiscoHubPath\config.json"

function Show-Menu {
    Clear-Host
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "        DiscoHub DASHBOARD" -ForegroundColor Cyan
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1. Change theme"
    Write-Host "2. Change accent color"
    Write-Host "3. Set background image"
    Write-Host "4. Toggle features"
    Write-Host "5. Inject current theme"
    Write-Host "6. Restart Discord"
    Write-Host "0. Exit"
    Write-Host ""
}

function Change-Theme {
    Write-Host "`n[Available themes]:" -ForegroundColor Yellow
    $themes = Get-ChildItem "$DiscoHubPath\themes\*.css" | ForEach-Object { $_.BaseName }
    for ($i = 0; $i -lt $themes.Count; $i++) {
        Write-Host "$($i+1). $($themes[$i])"
    }
    $choice = Read-Host "Select theme number"
    $selected = $themes[[int]$choice - 1]
    
    $config = Get-Content $configPath | ConvertFrom-Json
    $config.theme = $selected
    $config | ConvertTo-Json | Out-File $configPath
    Write-Host "[OK] Theme changed to: $selected" -ForegroundColor Green
}

function Change-Accent {
    Write-Host "`n[Enter HEX color (example: #6c5ce7)]:" -ForegroundColor Yellow
    $color = Read-Host "Color"
    
    $config = Get-Content $configPath | ConvertFrom-Json
    $config.accent = $color
    $config | ConvertTo-Json | Out-File $configPath
    Write-Host "[OK] Accent changed to: $color" -ForegroundColor Green
}

function Inject-Theme {
    $config = Get-Content $configPath | ConvertFrom-Json
    & "$PSScriptRoot\inject.ps1" -Theme $config.theme
}

function Restart-Discord {
    Write-Host "[Restarting Discord...]" -ForegroundColor Yellow
    Get-Process "Discord" -ErrorAction SilentlyContinue | Stop-Process -Force
    Start-Sleep -Seconds 2
    Start-Process "Discord"
    Write-Host "[OK] Discord restarted" -ForegroundColor Green
}

do {
    Show-Menu
    $choice = Read-Host "Choice"
    
    switch ($choice) {
        "1" { Change-Theme }
        "2" { Change-Accent }
        "3" { Write-Host "[TODO] Background picker coming soon" -ForegroundColor Yellow }
        "4" { Write-Host "[TODO] Feature toggles coming soon" -ForegroundColor Yellow }
        "5" { Inject-Theme }
        "6" { Restart-Discord }
        "0" { Write-Host "Goodbye!" -ForegroundColor Green }
        default { Write-Host "Invalid choice!" -ForegroundColor Red }
    }
    if ($choice -ne "0") { Read-Host "`nPress Enter" }
} while ($choice -ne "0")