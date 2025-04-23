# Variables
$url = "http://localhost:5000"  # Change if your app runs on a different port
$log = "C:\MidtermProject\health.log"
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Try to send request
try {
    $response = Invoke-WebRequest -Uri $url -UseBasicParsing -TimeoutSec 5
    if ($response.StatusCode -eq 200) {
        "$timestamp App is UP (200 OK)" | Out-File -FilePath $log -Append
    } else {
        "$timestamp App responded with status: $($response.StatusCode)" | Out-File -FilePath $log -Append
    }
}
catch {
    "$timestamp App is DOWN or not reachable." | Out-File -FilePath $log -Append
}
