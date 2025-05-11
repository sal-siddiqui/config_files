function prompt {
    # Get current directory name only
    $currentDir = (Get-Location).Path.Split('\')[-1]

    # ANSI escape codes
    $green      = "$([char]27)[0;32m"
    $blueBold   = "$([char]27)[1;34m"
    $yellow     = "$([char]27)[0;33m"
    $reset      = "$([char]27)[0m"

    # Virtual environment (if any)
    $venv = ""
    if ($env:VIRTUAL_ENV) {
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
    Write-Host "$venv$blueBold$currentDir$reset$gitBranch" -NoNewline

    # Reset LASTEXITCODE
    $global:LASTEXITCODE = 0

    # Final prompt character
    Write-Host ""
    return "> "
}
