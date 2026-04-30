# Libs - Internal Libraries

## Overview
Internal libraries providing core functionality for UniversalOS components, including quantum computing, mathematical operations, and system interfaces.

## Structure
- `libqutrit/` - Qutrit quantum computing library
- `libmcginty/` - McGinty equation solver library
- `libvacuum/` - Vacuum interface library
- `libreversible/` - Reversible computing library
- `libhelix/` - Helix core library

## Purpose
Provides reusable libraries for:
- Qutrit state manipulation and gates
- McGinty M-Wave equation solving
- Vacuum energy sampling
- Reversible computation primitives
- Helix kernel interfaces

## Key Features
- Well-tested, reusable components
- Clean APIs for quantum operations
- Performance-optimized implementations
- Comprehensive documentation
- Property-based testing

## Development
- Written in Rust, C, and C++
- Extensive unit and property tests
- Algorithm competition for optimization
- Public APIs in `include/` directory

## Usage
These libraries are used by:
- Quantum subsystems
- Desktop applications
- System tools
- Bootloader

## Related Components
- `include/` - Public header files
- `src/quantum/` - Quantum components using these libraries
- `tests/property/` - Property-based tests
