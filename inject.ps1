# DiscoHub CSS Injector
param([string]$Theme = "dark")

$DiscoHubPath = "$env:APPDATA\DiscoHub"
$configPath = "$DiscoHubPath\config.json"
$themePath = "$DiscoHubPath\themes\$Theme.css"

if (-not (Test-Path $themePath)) {
    Write-Host "[ERROR] Theme '$Theme' not found" -ForegroundColor Red
    Write-Host "Available themes:" -ForegroundColor Yellow
    Get-ChildItem "$DiscoHubPath\themes\*.css" | ForEach-Object { Write-Host "  - $($_.BaseName)" }
    exit
}

$css = Get-Content $themePath -Raw
$config = Get-Content $configPath | ConvertFrom-Json

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   DiscoHub CSS Injector" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "[OK] Theme: $Theme" -ForegroundColor Green
Write-Host "[OK] Accent: $($config.accent)" -ForegroundColor Green
Write-Host ""

# Save CSS for manual injection
$css = $css -replace "#6c5ce7", $config.accent
$css | Out-File -FilePath "$DiscoHubPath\current.css"

Write-Host "[INFO] CSS saved to: $DiscoHubPath\current.css" -ForegroundColor Yellow
Write-Host ""
Write-Host "To apply theme:" -ForegroundColor White
Write-Host "1. Install Vencord (only external tool allowed)" -ForegroundColor Gray
Write-Host "2. Or use any CSS injector extension" -ForegroundColor Gray
Write-Host ""