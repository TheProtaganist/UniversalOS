# Deployment Scripts

## Overview
Scripts for deploying and packaging UniversalOS.

## Coming Soon
- `create-iso.sh` - Create bootable ISO image
- `deploy-ostree.sh` - Deploy OSTree repository
- `package-release.sh` - Package release artifacts
- `update-mirrors.sh` - Update distribution mirrors
- `sign-release.sh` - Sign release packages

## Purpose
Deployment scripts automate:
- ISO image creation
- OSTree repository management
- Release packaging
- Distribution deployment
- Package signing

## Usage
```bash
# Create bootable ISO
./scripts/deploy/create-iso.sh

# Deploy to OSTree repository
./scripts/deploy/deploy-ostree.sh

# Package release
./scripts/deploy/package-release.sh v1.0.0

# Sign release packages
./scripts/deploy/sign-release.sh
```

## Deployment Outputs
- ISO images in `build/iso/`
- OSTree repository in configured location
- Release packages in `build/release/`

## Requirements
- Build completed successfully
- Tests passing
- Signing keys configured (for releases)
- Deployment credentials (for mirrors)

## Related
- `scripts/build/` - Build scripts
- `scripts/ci/` - CI/CD scripts
- `docs/design/IMMUTABLE_SYSTEM_DESIGN.md` - Immutable system design
