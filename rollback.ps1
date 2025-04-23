# Set environment paths
$blue = "C:\MidtermProject\blue"
$green = "C:\MidtermProject\green"
$prod = "C:\MidtermProject\prod"

# Check if prod symbolic link exists
if (!(Test-Path $prod)) {
    Write-Host "Cannot rollback. 'prod' symbolic link does not exist."
    exit 1
}

# Get current prod target
$current = (Get-Item $prod).Target

# Decide rollback target
if ($current -eq $blue) {
    $rollback = $green
} else {
    $rollback = $blue
}

# Perform the rollback by switching prod link
Remove-Item $prod
New-Item -ItemType SymbolicLink -Path $prod -Target $rollback

Write-Host "Rolled back to $rollback"
