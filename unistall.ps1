# DiscoHub Uninstaller
Write-Host "Removing DiscoHub..." -ForegroundColor Yellow

$DiscoHubPath = "$env:APPDATA\DiscoHub"

if (Test-Path $DiscoHubPath) {
    Remove-Item -Path $DiscoHubPath -Recurse -Force
    Write-Host "[OK] DiscoHub removed" -ForegroundColor Green
} else {
    Write-Host "[OK] DiscoHub not found" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Discord is unchanged. Restart Discord if needed." -ForegroundColor Gray
pause