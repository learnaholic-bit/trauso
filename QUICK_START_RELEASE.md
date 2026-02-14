# Quick Start: Creating Your First Release

This guide will walk you through creating your first automated release.

## Prerequisites Checklist

Before you start, ensure:
- [ ] This PR is merged to the main branch
- [ ] You have write access to the repository
- [ ] All code changes are committed
- [ ] The application builds successfully locally

## Step-by-Step Guide

### Option 1: Automatic Release (Recommended)

**1. Update the version number:**
```bash
# On Linux/macOS
./scripts/bump-version.sh 1.0.3

# On Windows
.\scripts\bump-version.ps1 1.0.3
```

**2. Review and commit the changes:**
```bash
git diff  # Review the version changes
git add .
git commit -m "Bump version to 1.0.3"
git push
```

**3. Create and push the release tag:**
```bash
git tag v1.0.3
git push --tags
```

**4. Monitor the build:**
- Go to: https://github.com/learnaholic-bit/trauso/actions
- Watch the "Release" workflow build your application
- Wait for all platforms (Windows, macOS, Linux) to complete

**5. Verify the release:**
- Go to: https://github.com/learnaholic-bit/trauso/releases
- Your new release should be published with all installers!

### Option 2: Manual Trigger

If you prefer to trigger the release manually:

**1. Update and commit version** (same as Option 1, steps 1-2)

**2. Create the tag locally but don't push:**
```bash
git tag v1.0.3
# Don't push the tag yet
```

**3. Go to GitHub Actions:**
- Navigate to: https://github.com/learnaholic-bit/trauso/actions/workflows/release.yml
- Click "Run workflow"
- Enter the tag name: `v1.0.3`
- Click "Run workflow"

**4. After the workflow completes, push the tag:**
```bash
git push --tags
```

## What Happens During Build

The GitHub Actions workflow will:
1. ✅ Checkout your code
2. ✅ Setup Node.js and Rust on all platforms
3. ✅ Install dependencies
4. ✅ Build the frontend (React + TypeScript)
5. ✅ Build the backend (Rust + Tauri)
6. ✅ Create installers for each platform:
   - Windows: `.exe` and `.msi`
   - macOS: `.dmg` (Universal)
   - Linux: `.deb` and `.AppImage`
7. ✅ Create a GitHub Release
8. ✅ Upload all installers as release assets
9. ✅ Generate auto-update metadata

**Estimated time:** 15-25 minutes (platforms build in parallel)

## Expected Release Artifacts

After a successful build, your release will include:

### Windows
- `trauso_1.0.3_x64-setup.exe` - NSIS installer (~13 MB)
- `trauso_1.0.3_x64.msi` - MSI installer (~13 MB)

### macOS
- `Trauso_1.0.3_universal.dmg` - Universal binary (~15 MB)

### Linux
- `trauso_1.0.3_amd64.deb` - Debian package (~13 MB)
- `trauso_1.0.3_amd64.AppImage` - Portable AppImage (~14 MB)

### Metadata
- `latest.json` - Auto-update configuration
- Source code archives (automatically created by GitHub)

## Troubleshooting

### Build fails on Windows
- Check if Windows Defender or antivirus is blocking the build
- Verify Rust toolchain is properly installed
- Look for specific error messages in the Actions logs

### Build fails on macOS
- Ensure code signing certificates are configured (or remove signing requirement)
- Check if Xcode command line tools are up to date
- Verify the universal binary targets are available

### Build fails on Linux
- Missing dependencies: The workflow installs required packages
- If it still fails, check if apt packages are available on Ubuntu 22.04

### Release not appearing
- Verify the tag format is correct (must start with `v`)
- Check if the workflow has `contents: write` permission
- Ensure `GITHUB_TOKEN` is working (it should be automatic)

### Can't find the release
- Check https://github.com/learnaholic-bit/trauso/releases
- It should appear as "Latest" once published
- The release is public by default (not a draft)

## Testing the Release

After the release is created:

1. **Download and test installers:**
   - Download the installer for your platform
   - Install the application
   - Verify it runs correctly
   - Test the auto-update feature (if applicable)

2. **Verify all platforms:**
   - If possible, test on all three platforms
   - Or ask community members to test

3. **Update release notes if needed:**
   - You can edit the release on GitHub
   - Add detailed changelog
   - Include screenshots or demos

## Next Steps

After your first successful release:

1. **Set up auto-update signing** (if not already done):
   - Generate a signing key pair
   - Add to repository secrets as `TAURI_SIGNING_PRIVATE_KEY`
   - This enables secure auto-updates

2. **Create a release template:**
   - Consider creating a CHANGELOG.md file
   - Use the changelog workflow to generate release notes

3. **Announce the release:**
   - Update your README badges
   - Post on social media
   - Notify your users

## Questions?

- Check [RELEASE.md](RELEASE.md) for detailed documentation
- See [RELEASE_AUTOMATION.md](RELEASE_AUTOMATION.md) for technical details
- Review [AGENTS.md](AGENTS.md) for development guide

Happy releasing! 🚀
