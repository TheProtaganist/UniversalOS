# Helix - Helix Kernel Core

## Overview
The Helix kernel core provides the foundation for UniversalOS's unique architecture, managing quantum-classical hybrid execution and state management.

## Structure
- `core/` - Core Helix functionality
- `state/` - State management
- `scheduler/` - Helix scheduler
- `interface/` - Kernel interface

## Purpose
The Helix kernel is responsible for:
- Managing quantum and classical computation
- State persistence and recovery
- Scheduling quantum and classical tasks
- Providing interfaces between quantum and classical systems

## Key Features
- Quantum state management
- Hybrid execution scheduling
- State persistence across reboots
- Integration with Linux kernel

## Development
- Written primarily in Rust for safety
- Interfaces with C kernel code
- Requires understanding of quantum computing concepts

## Related Components
- `src/kernel/` - Linux kernel modifications
- `src/quantum/` - Quantum computing components
- `src/bootloader/` - Helix Boot bootloader
