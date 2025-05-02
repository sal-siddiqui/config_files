function prompt {
    "PS @ $(Get-Location | Split-Path -Leaf) > "
}

# Automatically activate virtual environment if it exists
if (Test-Path ".\.venv\Scripts\Activate.ps1") {
    .\.venv\Scripts\Activate.ps1
}