function prompt {
    # Get current directory name only (last part of the path)
    $currentDir = (Get-Location).Path.Split('\')[-1]

    # Check for Git branch (if Git is installed)
    $gitBranch = ""
    if (Get-Command git -ErrorAction SilentlyContinue) {
        $gitBranch = git branch --show-current 2>$null
    }

    # Colors
    $dirColor = "Green"
    $gitColor = "Yellow"

    # Print directory (first line)
    Write-Host ""  # Ensures a line break
    Write-Host $currentDir -NoNewline -ForegroundColor $dirColor

    # Print Git branch (if any)
    if ($gitBranch) {
        Write-Host " [$gitBranch]" -NoNewline -ForegroundColor $gitColor
    }

    # Reset $LASTEXITCODE to avoid persistence (optional cleanup)
    $global:LASTEXITCODE = 0

    # End with a newline and '>' on the next line    
    Write-Host ""  # Ensures a line break
    return "> "
}
