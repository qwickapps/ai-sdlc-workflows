#Requires -Version 5.1
<#
.SYNOPSIS
    Update global AI SDLC Workflows installation.

.DESCRIPTION
    Pulls the latest changes from the repository.
    Projects using symlinks are automatically updated.

.EXAMPLE
    .\update.ps1
#>

$ErrorActionPreference = "Stop"

$InstallDir = if ($env:AI_SDLC_HOME) { $env:AI_SDLC_HOME } else { "$env:USERPROFILE\.ai-sdlc-workflows" }

Write-Host "╔════════════════════════════════════════╗" -ForegroundColor Blue
Write-Host "║   AI SDLC Workflows - Update           ║" -ForegroundColor Blue
Write-Host "╚════════════════════════════════════════╝" -ForegroundColor Blue
Write-Host ""

# Verify installation exists
if (-not (Test-Path $InstallDir)) {
    Write-Host "Error: Installation not found at $InstallDir" -ForegroundColor Red
    Write-Host ""
    Write-Host "Install first with:"
    Write-Host "  Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/qwickapps/ai-sdlc-workflows/main/install.ps1' -OutFile install.ps1; .\install.ps1"
    exit 1
}

Push-Location $InstallDir

try {
    # Get current version
    $OldVersion = git describe --tags 2>$null
    if (-not $OldVersion) { $OldVersion = git rev-parse --short HEAD }
    Write-Host "Current version: $OldVersion"

    # Check for local changes
    $status = git status --porcelain 2>$null
    if ($status) {
        Write-Host "Warning: Local changes detected. Stashing..." -ForegroundColor Yellow
        git stash --quiet
    }

    # Fetch and check for updates
    git fetch origin main --quiet

    $Local = git rev-parse HEAD
    $Remote = git rev-parse origin/main

    if ($Local -eq $Remote) {
        Write-Host "Already up to date." -ForegroundColor Green
    } else {
        Write-Host "Updating..."
        git pull --ff-only origin main

        $NewVersion = git describe --tags 2>$null
        if (-not $NewVersion) { $NewVersion = git rev-parse --short HEAD }
        Write-Host "Updated: $OldVersion -> $NewVersion" -ForegroundColor Green

        # Show what changed
        Write-Host ""
        Write-Host "Changes:" -ForegroundColor Blue
        git log --oneline "$Local..$Remote" | Select-Object -First 10
    }
} finally {
    Pop-Location
}

Write-Host ""
Write-Host "Update complete!" -ForegroundColor Green
Write-Host ""
Write-Host "All projects using symlinks are automatically updated."
Write-Host ""
Write-Host "Note: If you have projects with copied files (no symlinks)," -ForegroundColor Yellow
Write-Host "re-run setup.ps1 in those projects to get updates:"
Write-Host "  $InstallDir\setup.ps1 -Claude -Force"
Write-Host ""
