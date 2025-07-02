function prompt {
    # Get current directory name only
    $currentDir = (Get-Item -Path ".\").Name
    $username = $env:USERNAME
    $computername = $env:COMPUTERNAME

    # ANSI escape codes for colors
    $blueBold    = "$([char]27)[1;34m"    # Directory color
    $yellow      = "$([char]27)[0;33m"    # Git branch color
    $cyanBold    = "$([char]27)[1;36m"    # Bold cyan (username)
    $purpleBold  = "$([char]27)[1;35m"    # Bold purple (hostname)
    $reset       = "$([char]27)[0m"


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
    Write-Host "$cyanBold$username$reset at $purpleBold$computername$reset in $blueBold$currentDir$reset$gitBranch" -NoNewline

    # Reset LASTEXITCODE
    $global:LASTEXITCODE = 0

    # Final prompt character
    Write-Host ""
    return "> "
}
