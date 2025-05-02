function Get-GitBranch {
    try {
        $branch = git rev-parse --abbrev-ref HEAD 2>$null
        if ($branch -eq "HEAD") {
            $branch = git rev-parse --short HEAD 2>$null
        }
        return $branch
    }
    catch {
        return $null
    }
}

function prompt {
    # Check for .venv and activate if exists
    $venvPath = Join-Path (Get-Location) ".venv"
    $activateScript = Join-Path $venvPath "Scripts\Activate.ps1"
    
    if (Test-Path $venvPath -PathType Container) {
        if (-not $env:VIRTUAL_ENV -and (Test-Path $activateScript -PathType Leaf)) {
            & $activateScript
        }
    }

    # Escape character
    $esc = [char]27

    # Virtual environment indicator
    $venv = ""
    if ($env:VIRTUAL_ENV) {
        $venvName = Split-Path $env:VIRTUAL_ENV -Leaf
        $venv = "${esc}[1;33m($venvName)${esc}[0m "
    }

    # User (red)
    $user = "${esc}[1;91m$env:USERNAME${esc}[0m"

    # "at" (white)
    $at = "${esc}[1;37mat${esc}[0m"

    # Host (green)
    $hostname = "${esc}[1;32m$env:COMPUTERNAME${esc}[0m"

    # "in" (white)
    $in = "${esc}[1;37min${esc}[0m"

    # Current directory (green)
    $dir = "${esc}[1;32m$(Split-Path -Leaf (Get-Location))${esc}[0m"

    # Git branch (yellow if exists)
    $branch = Get-GitBranch
    $onBranch = ""
    if ($branch) {
        $onBranch = " ${esc}[1;37mon${esc}[0m ${esc}[1;33m$branch${esc}[0m"
    }

    # Build the prompt
    $promptString = "`n${user} ${at} ${hostname} ${in} ${dir}${onBranch}`n${esc}[1;37m`$${esc}[0m "

    return $promptString
}
