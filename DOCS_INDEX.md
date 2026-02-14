# 📚 Documentation Index

Welcome to the Trauso documentation! This index will help you find what you need.

## For End Users

### Installation & Usage
- **[README.md](README.md)** - Main project documentation
  - Features overview
  - Installation instructions for all platforms
  - Usage guide
  - Troubleshooting

### Getting the Application
- **[Releases Page](https://github.com/learnaholic-bit/trauso/releases)** - Download installers
  - Latest stable releases
  - All platform installers
  - Release notes and changelogs

## For Developers

### Getting Started
- **[AGENTS.md](AGENTS.md)** - Complete development guide
  - Build commands for all platforms
  - Code style guidelines (TypeScript & Rust)
  - Project architecture
  - Testing and debugging

### Building & Releasing
- **[QUICK_START_RELEASE.md](QUICK_START_RELEASE.md)** - Step-by-step first release guide
  - Prerequisites checklist
  - Automatic and manual release options
  - Expected build artifacts
  - Troubleshooting common issues

- **[RELEASE.md](RELEASE.md)** - Comprehensive release documentation
  - Automated release process
  - Version management
  - Release artifacts explained
  - Auto-update configuration
  - Full release checklist

- **[RELEASE_AUTOMATION.md](RELEASE_AUTOMATION.md)** - Technical implementation details
  - Overview of automation features
  - Workflow descriptions
  - Current status and next steps

### Tools & Scripts
- **scripts/bump-version.sh** - Bash script for version updates
- **scripts/bump-version.ps1** - PowerShell script for version updates (Windows)

## GitHub Actions Workflows

### Production Workflows
- **.github/workflows/release.yml** - Multi-platform release automation
  - Triggers on tag push (v*)
  - Builds for Windows, macOS, Linux
  - Creates GitHub releases automatically
  - Can be manually triggered

### Development Workflows
- **.github/workflows/build-test.yml** - PR validation
  - Runs on pull requests
  - Tests builds on all platforms
  - Uploads build artifacts

- **.github/workflows/changelog.yml** - Changelog generation
  - Manual trigger only
  - Generates changelogs between tags
  - Useful for release notes

## Quick Links

### Common Tasks
- **Install the app**: [Releases](https://github.com/learnaholic-bit/trauso/releases) → Download for your platform
- **Build from source**: [AGENTS.md](AGENTS.md#build-commands)
- **Create a release**: [QUICK_START_RELEASE.md](QUICK_START_RELEASE.md)
- **Update version**: Run `./scripts/bump-version.sh <version>`
- **View workflows**: [Actions](https://github.com/learnaholic-bit/trauso/actions)

### Support
- **Report bugs**: [GitHub Issues](https://github.com/learnaholic-bit/trauso/issues)
- **Troubleshooting**: [README.md](README.md#troubleshooting)
- **License**: [MIT License](LICENSE)

## Document Purposes

| Document | Audience | Purpose |
|----------|----------|---------|
| README.md | End users & developers | Project overview, features, basic usage |
| AGENTS.md | Developers | Development setup, code style, architecture |
| QUICK_START_RELEASE.md | Release managers | First release walkthrough |
| RELEASE.md | Release managers | Complete release process documentation |
| RELEASE_AUTOMATION.md | Technical lead | Implementation details and status |

## Contributing

Want to contribute? Start with:
1. Read [AGENTS.md](AGENTS.md) for code style and architecture
2. Check [GitHub Issues](https://github.com/learnaholic-bit/trauso/issues) for open tasks
3. Follow the development workflow in [AGENTS.md](AGENTS.md#development-workflow)

## Updates

This documentation is maintained as part of the project. If you find errors or have suggestions:
- Open an issue on GitHub
- Submit a pull request with improvements
- Contact the maintainers

---

**Last Updated**: 2026-02-14  
**Version**: 1.0.2
