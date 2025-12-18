#Requires -Version 5.1
<#
.SYNOPSIS
    Set up AI SDLC Workflows for a project.

.DESCRIPTION
    Creates symlinks (or copies as fallback) from the global installation
    to the current project directory for the specified AI CLI tools.

.PARAMETER Claude
    Set up Claude Code (.claude/)

.PARAMETER Cursor
    Set up Cursor (.cursor/)

.PARAMETER Windsurf
    Set up Windsurf (.cascade/)

.PARAMETER Aider
    Set up Aider (.aider/)

.PARAMETER All
    Set up all supported CLIs

.PARAMETER Target
    Target directory (default: current directory)

.PARAMETER Force
    Overwrite existing symlinks

.EXAMPLE
    .\setup.ps1 -Claude
    Sets up Claude Code in the current directory.

.EXAMPLE
    .\setup.ps1 -Claude -Windsurf
    Sets up Claude Code and Windsurf.

.EXAMPLE
    .\setup.ps1 -All -Target "C:\Projects\MyApp"
    Sets up all CLIs in the specified directory.
#>

param(
    [switch]$Claude,
    [switch]$Cursor,
    [switch]$Windsurf,
    [switch]$Aider,
    [switch]$All,
    [string]$Target = $PWD.Path,
    [switch]$Force
)

$ErrorActionPreference = "Stop"

$InstallDir = if ($env:AI_SDLC_HOME) { $env:AI_SDLC_HOME } else { "$env:USERPROFILE\.ai-sdlc-workflows" }

# Determine which tools to set up
$Tools = @()
if ($All) {
    $Tools = @('claude', 'cursor', 'windsurf', 'aider')
} else {
    if ($Claude) { $Tools += 'claude' }
    if ($Cursor) { $Tools += 'cursor' }
    if ($Windsurf) { $Tools += 'windsurf' }
    if ($Aider) { $Tools += 'aider' }
}

if ($Tools.Count -eq 0) {
    Write-Host "No CLI specified. Defaulting to Claude Code." -ForegroundColor Yellow
    Write-Host "Use -Claude, -Cursor, -Windsurf, -Aider, or -All"
    Write-Host ""
    $Tools = @('claude')
}

# Verify installation exists
if (-not (Test-Path $InstallDir)) {
    Write-Host "Error: AI SDLC Workflows not installed." -ForegroundColor Red
    Write-Host ""
    Write-Host "Install first with:"
    Write-Host "  Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/qwickapps/ai-sdlc-workflows/main/install.ps1' -OutFile install.ps1; .\install.ps1"
    exit 1
}

# Verify target directory exists
if (-not (Test-Path $Target)) {
    Write-Host "Error: Target directory does not exist: $Target" -ForegroundColor Red
    exit 1
}

# Check if we can create symlinks
$CanSymlink = $false
try {
    $testTarget = Join-Path $env:TEMP "ai-sdlc-test-target-$(Get-Random)"
    $testLink = Join-Path $env:TEMP "ai-sdlc-test-link-$(Get-Random)"
    New-Item -ItemType File -Path $testTarget -Force | Out-Null
    New-Item -ItemType SymbolicLink -Path $testLink -Target $testTarget -ErrorAction Stop | Out-Null
    $CanSymlink = $true
    Remove-Item $testLink, $testTarget -Force -ErrorAction SilentlyContinue
} catch {
    Write-Host "Warning: Cannot create symlinks. Files will be copied instead." -ForegroundColor Yellow
    Write-Host "Enable Developer Mode or run as Administrator for symlinks." -ForegroundColor Yellow
    Write-Host ""
}

# Function to create symlink with fallback
function Create-Link {
    param(
        [string]$Source,
        [string]$TargetPath
    )

    $Name = Split-Path $TargetPath -Leaf

    # Skip if local override exists (not a symlink)
    if ((Test-Path $TargetPath) -and -not (Get-Item $TargetPath).LinkType) {
        Write-Host "  - $Name (local override exists)" -ForegroundColor Yellow
        return
    }

    # Handle existing symlink
    if (Test-Path $TargetPath) {
        $item = Get-Item $TargetPath
        if ($item.LinkType) {
            if ($Force) {
                Remove-Item $TargetPath -Force
            } else {
                # Check if already pointing to correct location
                if ($item.Target -eq $Source) {
                    Write-Host "  + $Name (already linked)" -ForegroundColor Cyan
                    return
                }
                Remove-Item $TargetPath -Force
            }
        }
    }

    # Create link or copy
    if ($CanSymlink) {
        New-Item -ItemType SymbolicLink -Path $TargetPath -Target $Source -Force | Out-Null
        Write-Host "  + $Name" -ForegroundColor Green
    } else {
        Copy-Item $Source $TargetPath -Force
        Set-Content -Path "$TargetPath.ai-sdlc-source" -Value $Source
        Write-Host "  + $Name (copied)" -ForegroundColor Yellow
    }
}

# Function to add gitignore entries
function Add-GitignoreEntries {
    param([string]$Dir)

    $gitignore = Join-Path $Dir ".gitignore"
    $entries = @(
        "# AI SDLC Workflows - local files"
        ".claude/engineering/"
        ".claude/settings.local.json"
        ".cursor/engineering/"
        ".cascade/engineering/"
        ".windsurf/engineering/"
        ".aider/engineering/"
        "*.ai-sdlc-source"
    )

    if (-not (Test-Path $gitignore)) {
        New-Item -ItemType File -Path $gitignore -Force | Out-Null
    }

    $content = Get-Content $gitignore -ErrorAction SilentlyContinue
    foreach ($entry in $entries) {
        if ($content -notcontains $entry) {
            Add-Content -Path $gitignore -Value $entry
        }
    }
}

# ============================================================================
# CLAUDE CODE SETUP
# ============================================================================
function Setup-Claude {
    $targetDir = Join-Path $Target ".claude"
    Write-Host "--- Claude Code ---" -ForegroundColor Blue

    # Create directories
    @("commands", "templates", "rules", "agents", "validators", "engineering") | ForEach-Object {
        $dir = Join-Path $targetDir $_
        if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
    }

    # Commands
    Write-Host "Commands:" -ForegroundColor Cyan
    Get-ChildItem "$InstallDir\claude\.claude\commands\*.md" -ErrorAction SilentlyContinue | ForEach-Object {
        Create-Link $_.FullName (Join-Path $targetDir "commands\$($_.Name)")
    }

    # Templates
    Write-Host "Templates:" -ForegroundColor Cyan
    Get-ChildItem "$InstallDir\shared\templates\*.md" -ErrorAction SilentlyContinue | ForEach-Object {
        Create-Link $_.FullName (Join-Path $targetDir "templates\$($_.Name)")
    }

    # Rules
    Write-Host "Rules:" -ForegroundColor Cyan
    Get-ChildItem "$InstallDir\shared\rules\*.md" -ErrorAction SilentlyContinue | ForEach-Object {
        Create-Link $_.FullName (Join-Path $targetDir "rules\$($_.Name)")
    }

    # Agents
    Write-Host "Agents:" -ForegroundColor Cyan
    Get-ChildItem "$InstallDir\shared\agents\*.md" -ErrorAction SilentlyContinue | ForEach-Object {
        Create-Link $_.FullName (Join-Path $targetDir "agents\$($_.Name)")
    }

    # Validators
    Write-Host "Validators:" -ForegroundColor Cyan
    Get-ChildItem "$InstallDir\shared\validators\*.sh" -ErrorAction SilentlyContinue | ForEach-Object {
        Create-Link $_.FullName (Join-Path $targetDir "validators\$($_.Name)")
    }

    # CLAUDE.md
    $claudeMd = Join-Path $Target "CLAUDE.md"
    $template = Join-Path $InstallDir "claude\CLAUDE.md.template"
    if (-not (Test-Path $claudeMd)) {
        if (Test-Path $template) {
            Copy-Item $template $claudeMd
            Write-Host "Created CLAUDE.md from template" -ForegroundColor Green
        }
    } else {
        Write-Host "CLAUDE.md exists - not modified" -ForegroundColor Yellow
    }

    Write-Host "Claude Code setup complete" -ForegroundColor Green
}

# ============================================================================
# CURSOR SETUP
# ============================================================================
function Setup-Cursor {
    $targetDir = Join-Path $Target ".cursor"
    Write-Host "--- Cursor ---" -ForegroundColor Blue

    @("rules", "templates") | ForEach-Object {
        $dir = Join-Path $targetDir $_
        if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
    }

    # Rules (use .mdc extension)
    Write-Host "Rules:" -ForegroundColor Cyan
    Get-ChildItem "$InstallDir\shared\rules\*.md" -ErrorAction SilentlyContinue | ForEach-Object {
        $mdcName = $_.BaseName + ".mdc"
        Create-Link $_.FullName (Join-Path $targetDir "rules\$mdcName")
    }

    # Templates
    Write-Host "Templates:" -ForegroundColor Cyan
    Get-ChildItem "$InstallDir\shared\templates\*.md" -ErrorAction SilentlyContinue | ForEach-Object {
        Create-Link $_.FullName (Join-Path $targetDir "templates\$($_.Name)")
    }

    Write-Host "Cursor setup complete" -ForegroundColor Green
}

# ============================================================================
# WINDSURF SETUP
# ============================================================================
function Setup-Windsurf {
    $targetDir = Join-Path $Target ".cascade"
    Write-Host "--- Windsurf ---" -ForegroundColor Blue

    @("rules", "templates", "workflows", "agents", "engineering") | ForEach-Object {
        $dir = Join-Path $targetDir $_
        if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
    }

    # Rules
    Write-Host "Rules:" -ForegroundColor Cyan
    Get-ChildItem "$InstallDir\shared\rules\*.md" -ErrorAction SilentlyContinue | ForEach-Object {
        Create-Link $_.FullName (Join-Path $targetDir "rules\$($_.Name)")
    }

    # Templates
    Write-Host "Templates:" -ForegroundColor Cyan
    Get-ChildItem "$InstallDir\shared\templates\*.md" -ErrorAction SilentlyContinue | ForEach-Object {
        Create-Link $_.FullName (Join-Path $targetDir "templates\$($_.Name)")
    }

    # Workflows
    $workflowsSource = "$InstallDir\windsurf\.cascade\workflows"
    if (Test-Path $workflowsSource) {
        Write-Host "Workflows:" -ForegroundColor Cyan
        Get-ChildItem "$workflowsSource\*.yml" -ErrorAction SilentlyContinue | ForEach-Object {
            Create-Link $_.FullName (Join-Path $targetDir "workflows\$($_.Name)")
        }
    }

    # Agents (YAML)
    Write-Host "Agents:" -ForegroundColor Cyan
    Get-ChildItem "$InstallDir\shared\agents\*.yml" -ErrorAction SilentlyContinue | ForEach-Object {
        Create-Link $_.FullName (Join-Path $targetDir "agents\$($_.Name)")
    }

    # Config
    $configSource = "$InstallDir\windsurf\.cascade\config.yml"
    $configTarget = Join-Path $targetDir "config.yml"
    if ((Test-Path $configSource) -and -not (Test-Path $configTarget)) {
        Copy-Item $configSource $configTarget
        Write-Host "Created config.yml" -ForegroundColor Green
    }

    Write-Host "Windsurf setup complete" -ForegroundColor Green
}

# ============================================================================
# AIDER SETUP
# ============================================================================
function Setup-Aider {
    $targetDir = Join-Path $Target ".aider"
    Write-Host "--- Aider ---" -ForegroundColor Blue

    @("rules", "templates") | ForEach-Object {
        $dir = Join-Path $targetDir $_
        if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
    }

    # Rules
    Write-Host "Rules:" -ForegroundColor Cyan
    Get-ChildItem "$InstallDir\shared\rules\*.md" -ErrorAction SilentlyContinue | ForEach-Object {
        Create-Link $_.FullName (Join-Path $targetDir "rules\$($_.Name)")
    }

    # Templates
    Write-Host "Templates:" -ForegroundColor Cyan
    Get-ChildItem "$InstallDir\shared\templates\*.md" -ErrorAction SilentlyContinue | ForEach-Object {
        Create-Link $_.FullName (Join-Path $targetDir "templates\$($_.Name)")
    }

    # CONVENTIONS.md
    $conventions = Join-Path $Target "CONVENTIONS.md"
    $conventionsSource = "$InstallDir\aider\CONVENTIONS.md"
    if (-not (Test-Path $conventions) -and (Test-Path $conventionsSource)) {
        Copy-Item $conventionsSource $conventions
        Write-Host "Created CONVENTIONS.md" -ForegroundColor Green
    } elseif (Test-Path $conventions) {
        Write-Host "CONVENTIONS.md exists - not modified" -ForegroundColor Yellow
    }

    # .aider.conf.yml
    $aiderConf = Join-Path $Target ".aider.conf.yml"
    $aiderConfSource = "$InstallDir\aider\.aider.conf.yml"
    if (-not (Test-Path $aiderConf) -and (Test-Path $aiderConfSource)) {
        Copy-Item $aiderConfSource $aiderConf
        Write-Host "Created .aider.conf.yml" -ForegroundColor Green
    } elseif (Test-Path $aiderConf) {
        Write-Host ".aider.conf.yml exists - not modified" -ForegroundColor Yellow
    }

    Write-Host "Aider setup complete" -ForegroundColor Green
}

# ============================================================================
# MAIN EXECUTION
# ============================================================================

Write-Host "╔════════════════════════════════════════╗" -ForegroundColor Blue
Write-Host "║   AI SDLC Workflows - Project Setup    ║" -ForegroundColor Blue
Write-Host "╚════════════════════════════════════════╝" -ForegroundColor Blue
Write-Host ""
Write-Host "Target: $Target" -ForegroundColor Cyan
Write-Host "Source: $InstallDir" -ForegroundColor Cyan
Write-Host ""

foreach ($tool in $Tools) {
    switch ($tool) {
        'claude' { Setup-Claude }
        'cursor' { Setup-Cursor }
        'windsurf' { Setup-Windsurf }
        'aider' { Setup-Aider }
    }
    Write-Host ""
}

# Add gitignore entries
Add-GitignoreEntries $Target
Write-Host "Updated .gitignore" -ForegroundColor Green

Write-Host ""
Write-Host "╔════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║           Setup Complete!              ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Blue
Write-Host "  1. Customize project config files (CLAUDE.md, etc.)"
Write-Host "  2. Add project-specific commands/templates as needed"
Write-Host "  3. Start using workflows: /feature, /bug, /plan, etc."
Write-Host ""
Write-Host "To update the framework:" -ForegroundColor Blue
Write-Host "  $InstallDir\update.ps1"
Write-Host ""
