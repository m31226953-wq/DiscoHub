# DiscoHub Installer with Assets
param([switch]$Uninstall)

$DiscoHubPath = "$env:APPDATA\DiscoHub"
$DiscordPath = "$env:LOCALAPPDATA\Discord"

if ($Uninstall) {
    Write-Host "Removing DiscoHub..." -ForegroundColor Yellow
    Remove-Item -Path $DiscoHubPath -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "DiscoHub removed!" -ForegroundColor Green
    pause
    exit
}

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "      DiscoHub - Custom Discord Patcher" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Create all folders
Write-Host "[1] Creating folders..." -ForegroundColor Yellow
$folders = @(
    "$DiscoHubPath\themes",
    "$DiscoHubPath\assets\icons",
    "$DiscoHubPath\assets\backgrounds",
    "$DiscoHubPath\assets\previews",
    "$DiscoHubPath\assets\wallpapers\anime",
    "$DiscoHubPath\assets\wallpapers\nature",
    "$DiscoHubPath\assets\wallpapers\cyberpunk",
    "$DiscoHubPath\assets\sounds",
    "$DiscoHubPath\fonts"
)

foreach ($folder in $folders) {
    New-Item -ItemType Directory -Force -Path $folder | Out-Null
}
Write-Host "[OK] Folders created" -ForegroundColor Green

# Copy themes
Write-Host "[2] Installing themes..." -ForegroundColor Yellow
if (Test-Path ".\themes\*.css") {
    Copy-Item ".\themes\*.css" -Destination "$DiscoHubPath\themes\" -Force
}
Write-Host "[OK] Themes installed" -ForegroundColor Green

# Copy assets
Write-Host "[3] Installing assets..." -ForegroundColor Yellow
if (Test-Path ".\assets\icons\*") {
    Copy-Item ".\assets\icons\*" -Destination "$DiscoHubPath\assets\icons\" -Force
}
if (Test-Path ".\assets\backgrounds\*") {
    Copy-Item ".\assets\backgrounds\*" -Destination "$DiscoHubPath\assets\backgrounds\" -Force
}
if (Test-Path ".\assets\previews\*") {
    Copy-Item ".\assets\previews\*" -Destination "$DiscoHubPath\assets\previews\" -Force
}
if (Test-Path ".\assets\wallpapers\*") {
    Copy-Item ".\assets\wallpapers\*" -Destination "$DiscoHubPath\assets\wallpapers\" -Recurse -Force
}
if (Test-Path ".\assets\sounds\*") {
    Copy-Item ".\assets\sounds\*" -Destination "$DiscoHubPath\assets\sounds\" -Force
}
if (Test-Path ".\fonts\*.ttf") {
    Copy-Item ".\fonts\*.ttf" -Destination "$DiscoHubPath\fonts\" -Force
}
Write-Host "[OK] Assets installed" -ForegroundColor Green

# Create config
Write-Host "[4] Creating config..." -ForegroundColor Yellow
@"
{
    "theme": "dark",
    "accent": "#6c5ce7",
    "backgroundImage": "assets/backgrounds/dark-bg.jpg",
    "wallpaper": "assets/wallpapers/cyberpunk/neon-city.jpg",
    "customFont": "",
    "features": {
        "customBackground": true,
        "friendCounter": true,
        "voiceVisualizer": true,
        "animatedStatus": false
    },
    "soundEnabled": true
}
"@ | Out-File -FilePath "$DiscoHubPath\config.json" -Encoding UTF8
Write-Host "[OK] Config created" -ForegroundColor Green

# Kill Discord
Write-Host "[5] Closing Discord..." -ForegroundColor Yellow
Get-Process "Discord" -ErrorAction SilentlyContinue | Stop-Process -Force
Start-Sleep -Seconds 2
Write-Host "[OK] Discord closed" -ForegroundColor Green

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "   DiscoHub INSTALLED WITH ASSETS!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Assets location: $DiscoHubPath\assets" -ForegroundColor Gray
Write-Host "Run .\dashboard.ps1 to configure" -ForegroundColor Yellow
Write-Host ""
pause