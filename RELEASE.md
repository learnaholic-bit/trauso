# Release Guide

This document explains how to create a new release for Trauso.

## Automated Release Process

This repository uses GitHub Actions to automatically build and publish releases for Windows, macOS, and Linux.

### Prerequisites

Before creating a release, ensure:
1. All changes are committed and pushed to the main branch
2. The version number is updated in:
   - `package.json` (version field)
   - `src-tauri/tauri.conf.json` (version field)
   - `src-tauri/Cargo.toml` (version field)
3. All tests pass locally

### Creating a Release

#### Method 1: Using Git Tags (Recommended)

1. Create and push a new tag:
   ```bash
   git tag v1.0.2
   git push origin v1.0.2
   ```

2. The GitHub Actions workflow will automatically:
   - Build the application for Windows, macOS, and Linux
   - Create installers and portable executables
   - Upload all artifacts to a new GitHub Release
   - Generate release notes with download links

#### Method 2: Manual Trigger

1. Go to the [Actions tab](../../actions/workflows/release.yml)
2. Click "Run workflow"
3. Enter the tag name (e.g., `v1.0.2`)
4. Click "Run workflow"

### Release Artifacts

Each release includes the following artifacts:

**Windows:**
- `trauso_<version>_x64-setup.exe` - NSIS installer (recommended)
- `trauso_<version>_x64.msi` - MSI installer
- `trauso.exe` - Portable executable (inside the MSI)

**macOS:**
- `Trauso_<version>_universal.dmg` - Universal binary (Intel + Apple Silicon)
- `Trauso_<version>_aarch64.dmg` - Apple Silicon only
- `Trauso_<version>_x64.dmg` - Intel only

**Linux:**
- `trauso_<version>_amd64.deb` - Debian/Ubuntu package
- `trauso_<version>_amd64.AppImage` - Portable AppImage

### Auto-Update Configuration

The application includes auto-update functionality. When you create a new release:

1. The workflow automatically generates a `latest.json` file
2. This file is uploaded to the release assets
3. Users with older versions will be notified of the update

**Important:** Make sure the `TAURI_SIGNING_PRIVATE_KEY` and `TAURI_SIGNING_PRIVATE_KEY_PASSWORD` secrets are set in the repository settings for secure updates.

### Version Numbering

Follow [Semantic Versioning](https://semver.org/):
- **MAJOR** version (e.g., v2.0.0): Incompatible API changes
- **MINOR** version (e.g., v1.1.0): New features, backwards compatible
- **PATCH** version (e.g., v1.0.1): Bug fixes, backwards compatible

### Troubleshooting

**Build fails on a specific platform:**
- Check the Actions logs for that platform
- Common issues:
  - Missing dependencies (especially on Linux)
  - Rust toolchain version mismatch
  - Node.js version compatibility

**Release doesn't appear:**
- Ensure the tag follows the `v*` pattern (e.g., `v1.0.2`, not `1.0.2`)
- Check if the workflow has the correct permissions (`contents: write`)
- Verify the `GITHUB_TOKEN` is working correctly

**Auto-update not working:**
- Verify the signing keys are properly configured in repository secrets
- Check that the `tauri.conf.json` has the correct `updater` endpoint
- Ensure the `latest.json` file is present in the release assets

## Manual Build (for testing)

To build locally without creating a release:

```bash
# Install dependencies
npm install

# Build for production
npm run tauri build
```

Output will be in `src-tauri/target/release/`.

## Release Checklist

- [ ] Update version numbers in all required files
- [ ] Test the application locally
- [ ] Commit all changes
- [ ] Create and push git tag
- [ ] Wait for GitHub Actions to complete
- [ ] Verify all artifacts are uploaded
- [ ] Test download and installation on each platform
- [ ] Update release notes if needed
- [ ] Announce the release
