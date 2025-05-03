function prompt {
    # Get last exit code (ignore startup errors)
    $realLastExit = if ($global:LASTEXITCODE -ne $null) { $global:LASTEXITCODE } else { 0 }

    # Get current path (replace home with ~)
    $currentPath = (Get-Location).Path.Replace($HOME, "~")

    # Check for Git branch
    $gitBranch = ""
    if (Get-Command git -ErrorAction SilentlyContinue) {
        $gitBranch = git branch --show-current 2>$null
    }

    # Colors
    $pathColor = "Green"
    $gitColor = "Yellow"
    $errorColor = "Red"

    # Print path (first line)
    Write-Host ""  # Ensures a line break
    Write-Host $currentPath -NoNewline -ForegroundColor $pathColor

    # Print Git branch (if any)
    if ($gitBranch) {
        Write-Host " [$gitBranch]" -NoNewline -ForegroundColor $gitColor
    }

    # Only show [X] if a command failed (and it's not startup noise)
    if ($realLastExit -ne 0) {
        Write-Host " [X]" -NoNewline -ForegroundColor $errorColor
    }

    # Reset $LASTEXITCODE to avoid persistence
    $global:LASTEXITCODE = 0

    # End with a newline and '>' on the next line    
    Write-Host ""  # Ensures a line break
    return "> "
}
