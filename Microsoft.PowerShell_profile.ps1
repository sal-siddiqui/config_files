function prompt {
    # Get current directory name only (last part of the path)
    $currentDir = (Get-Location).Path.Split('\')[-1]
    
    # Check for Git branch (if Git is installed)
    $gitBranch = ""
    if (Get-Command git -ErrorAction SilentlyContinue) {
        $gitBranch = git branch --show-current 2>$null
    }
    
    # ANSI escape codes for bold blue text
    $blueBold = "$([char]27)[1;34m"  # 1=bold, 34=blue
    $reset = "$([char]27)[0m"        # Reset formatting
    
    # Print directory (first line) in bold blue
    Write-Host ""  # Ensures a line break
    Write-Host "$blueBold$currentDir$reset" -NoNewline
    
    # Print Git branch (if any) in regular yellow (not bold, not blue)
    if ($gitBranch) {
        Write-Host " [$gitBranch]" -NoNewline -ForegroundColor Yellow
    }
    
    # Reset $LASTEXITCODE to avoid persistence
    $global:LASTEXITCODE = 0
    
    # End with a newline and '>' on the next line    
    Write-Host ""  # Ensures a line break
    return "> "
}
