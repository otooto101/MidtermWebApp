choco install dotnet-sdk --version 8.0.100 -y
choco install vscode -y
choco install python -y
choco install nodejs -y

mkdir C:\\MidtermProject\\logs
mkdir C:\\MidtermProject\\deploy
mkdir C:\\MidtermProject\\src

# Copy project files
Copy-Item -Path "C:\\Users\\student\\source\\repos\\MidtermWebApp\\*" -Destination "C:\\MidtermProject\\src" -Recurse -Force
