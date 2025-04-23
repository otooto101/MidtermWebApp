# Variables
$source = "C:\Users\student\source\repos\MidtermWebApp"  # Path to your project
$publish = "$source\publish"
$blue = "C:\MidtermProject\blue"
$green = "C:\MidtermProject\green"
$prod = "C:\MidtermProject\prod"

# Publish the app (build the app and put it in the publish folder)
dotnet publish "$source\MidtermWebApp\MidtermWebApp.csproj" -o $publish

# Determine current deployment (which folder is active?)
# Check if the symbolic link exists and find the current deployment
if (Test-Path $prod) {
    $current = (Get-Item $prod).Target
} else {
    $current = $blue  # If prod doesn't exist, assume blue is the active environment
}

# Determine the next folder (blue or green)
if ($current -eq $blue) {
    $next = $green
} else {
    $next = $blue
}

# Clean and copy new version to the target folder (blue or green)
Remove-Item -Recurse -Force $next\*
Copy-Item -Recurse -Path $publish\* -Destination $next

# Simulate switching "prod" by pointing to the new version
# If prod doesn't exist, create the symbolic link for the first time
if (Test-Path $prod) {
    Remove-Item $prod
}

New-Item -ItemType SymbolicLink -Path $prod -Target $next

Write-Host "✅ Deployed to $next and switched 'prod' to point to it."
