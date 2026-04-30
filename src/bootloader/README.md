# Bootloader - Helix Boot

## Overview
Helix Boot is the custom UEFI bootloader for UniversalOS, featuring quantum state persistence and a beautiful boot experience.

## Structure
- `uefi/` - UEFI implementation
- `graphics/` - Graphics rendering
- `menu/` - Boot menu
- `quantum/` - Quantum state persistence
- `recovery/` - Recovery mode

## Purpose
Provides bootloader functionality including:
- UEFI boot support
- Quantum state persistence across reboots
- Beautiful graphical boot menu
- Recovery mode for system repair
- Integration with Helix kernel

## Key Features
- Quantum state preservation during boot
- Graphical boot menu with animations
- Recovery mode for troubleshooting
- Fast boot times
- Secure boot support

## Development
- Written in Rust and C
- UEFI specification compliance
- Requires understanding of boot process
- Integration with quantum subsystems

## Related Components
- `src/helix/` - Helix kernel core
- `src/quantum/` - Quantum state management
- `src/tools/helix-boot-install/` - Bootloader installer
