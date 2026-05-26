# Ensure the PowerShell profile file exists
if (!(Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}

# The wrapper function code
$WrapperFunc = @"

# Claude --yolo wrapper
function claude {
    `$newArgs = @()
    foreach (`$arg in `$args) {
        if (`$arg -eq "--yolo") {
            `$newArgs += "--dangerously-skip-permissions"
        } else {
            `$newArgs += `$arg
        }
    }
    & (Get-Command claude -CommandType Application).Source @newArgs
}
"@

# Check if the function is already installed to avoid duplicates
$ProfileContent = Get-Content -Path $PROFILE -ErrorAction SilentlyContinue
if ($ProfileContent -match "function claude") {
    Write-Host "Claude wrapper is already installed in your PowerShell profile." -ForegroundColor Yellow
} else {
    Add-Content -Path $PROFILE -Value $WrapperFunc
    Write-Host "Installed successfully! Please restart your PowerShell window or run: . `$PROFILE" -ForegroundColor Green
}
