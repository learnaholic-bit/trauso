# Version Bump Script for Trauso (PowerShell)
# Usage: .\bump-version.ps1 <new-version>
# Example: .\bump-version.ps1 1.0.3

param(
    [Parameter(Mandatory=$true)]
    [string]$NewVersion
)

# Validate version format
if ($NewVersion -notmatch '^\d+\.\d+\.\d+$') {
    Write-Error "Invalid version format. Use semantic versioning (e.g., 1.0.3)"
    exit 1
}

Write-Host "Updating version to $NewVersion..." -ForegroundColor Cyan

# Update package.json
$packageJson = Get-Content "package.json" -Raw
$packageJson = $packageJson -replace '"version": "[^"]*"', "`"version`": `"$NewVersion`""
Set-Content "package.json" -Value $packageJson
Write-Host "✓ Updated package.json" -ForegroundColor Green

# Update src-tauri/tauri.conf.json
$tauriConf = Get-Content "src-tauri/tauri.conf.json" -Raw
$tauriConf = $tauriConf -replace '"version": "[^"]*"', "`"version`": `"$NewVersion`""
Set-Content "src-tauri/tauri.conf.json" -Value $tauriConf
Write-Host "✓ Updated src-tauri/tauri.conf.json" -ForegroundColor Green

# Update src-tauri/Cargo.toml
$cargoToml = Get-Content "src-tauri/Cargo.toml" -Raw
$cargoToml = $cargoToml -replace 'version = "[^"]*"', "version = `"$NewVersion`""
Set-Content "src-tauri/Cargo.toml" -Value $cargoToml
Write-Host "✓ Updated src-tauri/Cargo.toml" -ForegroundColor Green

# Update Cargo.lock
Push-Location src-tauri
cargo update -p trauso | Out-Null
Pop-Location
Write-Host "✓ Updated Cargo.lock" -ForegroundColor Green

Write-Host ""
Write-Host "Version bumped to $NewVersion!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Review changes: git diff"
Write-Host "2. Commit changes: git add . && git commit -m `"Bump version to $NewVersion`""
Write-Host "3. Create tag: git tag v$NewVersion"
Write-Host "4. Push changes: git push && git push --tags"
Write-Host ""
Write-Host "The GitHub Actions workflow will automatically create a release when the tag is pushed." -ForegroundColor Cyan
