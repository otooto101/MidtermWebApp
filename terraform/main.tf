terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

provider "local" {}

# Generate install script
resource "local_file" "install_script" {
  content = <<-EOT
    choco install dotnet-sdk --version 8.0.100 -y
    choco install vscode -y
    choco install python -y
    choco install nodejs -y

    mkdir C:\\MidtermProject\\logs
    mkdir C:\\MidtermProject\\deploy
    mkdir C:\\MidtermProject\\src

    # Copy project files
    Copy-Item -Path "C:\\Users\\student\\source\\repos\\MidtermWebApp\\*" -Destination "C:\\MidtermProject\\src" -Recurse -Force
  EOT
  filename = "install.ps1"
}

# Execute the install script
resource "null_resource" "run_installer" {
  provisioner "local-exec" {
    command = "powershell.exe -ExecutionPolicy Bypass -File install.ps1"
  }

  depends_on = [local_file.install_script]
}
