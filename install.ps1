#Requires -Version 5.1
<#
.SYNOPSIS
    Install AI SDLC Workflows globally.

.DESCRIPTION
    Clones or updates the AI SDLC Workflows repository to a global location.
    After installation, use setup.ps1 to configure individual projects.

.EXAMPLE
    .\install.ps1
    Installs to default location: $env:USERPROFILE\.ai-sdlc-workflows

.EXAMPLE
    $env:AI_SDLC_HOME = "D:\tools\ai-sdlc"; .\install.ps1
    Installs to custom location.
#>

$ErrorActionPreference = "Stop"

$InstallDir = if ($env:AI_SDLC_HOME) { $env:AI_SDLC_HOME } else { "$env:USERPROFILE\.ai-sdlc-workflows" }
$RepoUrl = "https://github.com/qwickapps/ai-sdlc-workflows.git"

Write-Host "╔════════════════════════════════════════╗" -ForegroundColor Blue
Write-Host "║   AI SDLC Workflows - Installation     ║" -ForegroundColor Blue
Write-Host "╚════════════════════════════════════════╝" -ForegroundColor Blue
Write-Host ""

# Check for git
try {
    $null = Get-Command git -ErrorAction Stop
} catch {
    Write-Host "Error: git is required but not installed." -ForegroundColor Red
    Write-Host "Please install git and try again."
    exit 1
}

# Clone or update
if (Test-Path $InstallDir) {
    Write-Host "Existing installation found at $InstallDir" -ForegroundColor Yellow
    Write-Host "Updating..."

    Push-Location $InstallDir
    try {
        # Check for local changes
        $status = git status --porcelain 2>$null
        if ($status) {
            Write-Host "Warning: Local changes detected. Stashing..." -ForegroundColor Yellow
            git stash --quiet
        }

        git pull --ff-only origin main
        Write-Host "Updated to latest version." -ForegroundColor Green
    } finally {
        Pop-Location
    }
} else {
    Write-Host "Installing to: $InstallDir"
    git clone $RepoUrl $InstallDir
    Write-Host "Cloned successfully." -ForegroundColor Green
}

# Get version info
Push-Location $InstallDir
$Version = git describe --tags 2>$null
if (-not $Version) { $Version = git rev-parse --short HEAD }
Pop-Location

Write-Host ""
Write-Host "Installation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Version: $Version"
Write-Host "Location: $InstallDir"
Write-Host ""
Write-Host "Supported AI CLIs:" -ForegroundColor Blue
Write-Host "  - Claude Code (.claude/)"
Write-Host "  - Cursor (.cursor/)"
Write-Host "  - Windsurf (.cascade/)"
Write-Host "  - Aider (.aider/)"
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Blue
Write-Host "  1. Navigate to your project directory"
Write-Host "  2. Run setup for your preferred CLI(s):"
Write-Host ""
Write-Host "     $InstallDir\setup.ps1 -Claude" -ForegroundColor Green
Write-Host "     $InstallDir\setup.ps1 -Cursor" -ForegroundColor Green
Write-Host "     $InstallDir\setup.ps1 -Windsurf" -ForegroundColor Green
Write-Host "     $InstallDir\setup.ps1 -Aider" -ForegroundColor Green
Write-Host "     $InstallDir\setup.ps1 -All" -ForegroundColor Green
Write-Host ""
Write-Host "  3. Customize the generated config files for your project"
Write-Host ""
Write-Host "To update later:" -ForegroundColor Blue
Write-Host "     $InstallDir\update.ps1"
Write-Host ""
