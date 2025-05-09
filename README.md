# Midterm Web Application

## Project Description
This is a simplified DevOps pipeline implementation project for a .NET MVC web application. The project demonstrates key DevOps concepts such as version control, CI/CD, Infrastructure as Code (IaC), and blue-green deployment — all in a local environment.

## 🛠️ Tools and Technologies Used
- **.NET 8.0 SDK** — Web app development
- **PowerShell** — Automation scripts (deployments, health check)
- **Git & GitHub** — Source control and GitHub Actions for CI
- **Terraform** — Infrastructure as Code
- **Chocolatey** — Software installation automation
- **GitHub Actions** — CI pipeline for build and test

## CI/CD Pipeline
- GitHub Actions are used to trigger builds and test runs upon pull requests.
- The app is published using `dotnet publish`.
- A PowerShell script deploys the app locally with a blue-green strategy.
- The "production" folder is simulated via symbolic links to either blue or green folders.
- Rollback can be triggered by another script, switching the `prod` symlink.

## Infrastructure as Code
- Terraform script automates the local setup:
  - Installs required software (e.g., .NET SDK, VS Code)
  - Creates project folders (logs, deploy)
  - Generates and executes an installation script (`install.ps1`)

## Monitoring
- A PowerShell script (`healthcheck.ps1`) checks whether the app is running by sending a web request.
- Logs the status (UP/DOWN) with timestamps to `health.log`.

## Screenshots
- App running in the browser
- Terminal showing deployment output
- GitHub Actions pipeline run
- Health log or output

## Workflow Diagram

![Workflow Diagram](docs/Diagram.png)
