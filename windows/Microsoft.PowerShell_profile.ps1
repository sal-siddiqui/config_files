function prompt {
    # Get current directory name only
    $currentDir = (Get-Item -Path ".\").Name
    $username = $env:USERNAME
    $computername = $env:COMPUTERNAME

    # ANSI escape codes for colors
    $green       = "$([char]27)[0;32m"    # Virtual env color
    $blueBold    = "$([char]27)[1;34m"    # Directory color
    $yellow      = "$([char]27)[0;33m"    # Git branch color
    $cyanBold    = "$([char]27)[1;36m"    # Bold cyan (username)
    $purpleBold  = "$([char]27)[1;35m"    # Bold purple (hostname)
    $reset       = "$([char]27)[0m"

    # Virtual environment (if any)
    $venv = ""
    if ($env:VIRTUAL_ENV -and $env:PATH -like "*$env:VIRTUAL_ENV*") {
        $venvName = Split-Path -Leaf $env:VIRTUAL_ENV
        $venv = "$green($venvName)$reset "
    }

    # Git branch (if any)
    $gitBranch = ""
    if (Get-Command git -ErrorAction SilentlyContinue) {
        $branch = git branch --show-current 2>$null
        if ($branch) {
            $gitBranch = " $yellow[$branch]$reset"
        }
    }

    # Display the prompt
    Write-Host ""
    Write-Host "$venv$cyanBold$username$reset at $purpleBold$computername$reset in $blueBold$currentDir$reset$gitBranch" -NoNewline

    # Reset LASTEXITCODE
    $global:LASTEXITCODE = 0

    # Final prompt character
    Write-Host ""
    return "> "
}
