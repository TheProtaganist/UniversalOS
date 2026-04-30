# UniversalOS Directory Structure

## Overview

This document provides comprehensive documentation of the UniversalOS directory structure, including the purpose of each directory, file naming conventions, and guidelines for organizing code, tests, and documentation.

## Table of Contents

1. [Quick Reference](#quick-reference)
2. [Complete Directory Tree](#complete-directory-tree)
3. [Directory Descriptions](#directory-descriptions)
4. [File Naming Conventions](#file-naming-conventions)
5. [Design Rationale](#design-rationale)
6. [Adding New Components](#adding-new-components)
7. [Validation](#validation)

## Quick Reference

| Directory | Purpose | Tracked in Git |
|-----------|---------|----------------|
| `.kiro/` | Kiro AI configuration and specs | ✅ Yes |
| `src/` | All source code | ✅ Yes |
| `include/` | Public header files | ✅ Yes |
| `lib/` | Third-party libraries | ✅ Yes |
| `build/` | Build outputs | ❌ No (gitignored) |
| `tests/` | Test suites | ✅ Yes |
| `docs/` | Documentation | ✅ Yes |
| `scripts/` | Build and utility scripts | ✅ Yes |
| `tools/` | Development tools | ✅ Yes |
| `assets/` | Images, fonts, icons | ✅ Yes |
| `logs/` | Logs (except winners/) | ❌ No (gitignored) |
| `logs/winners/` | Algorithm winners | ✅ Yes |

## Complete Directory Tree

```
UniversalOS/
├── .git/                          # Git repository
├── .gitignore                     # Git ignore rules
├── .gitattributes                 # Git attributes
├── README.md                      # Project overview
├── LICENSE                        # MIT License
├── CONTRIBUTING.md                # Contribution guidelines
├── CODE_OF_CONDUCT.md             # Code of conduct
├── CHANGELOG.md                   # Version history
├── Makefile                       # Main Makefile
├── CMakeLists.txt                 # CMake configuration
├── Cargo.toml                     # Rust workspace configuration
├── pyproject.toml                 # Python project configuration
│
├── .kiro/                         # Kiro AI configuration
│   ├── specs/                     # Feature specifications
│   │   ├── 0-foundation/          # Foundation specs
│   │   ├── 1-arch-linux/          # Arch Linux base
│   │   ├── 2-helix-kernel/        # Helix kernel
│   │   ├── 3-qutrit-computing/    # Qutrit system
│   │   ├── 4-mwave-storage/       # M-Wave storage
│   │   ├── 5-vacuum-interface/    # Vacuum interface
│   │   ├── 6-deferred-observation/ # Deferred observation
│   │   ├── 7-reversible-computing/ # Reversible computing
│   │   ├── 8-algorithm-library/   # Algorithm library
│   │   ├── 9-integration-testing/ # Integration tests
│   │   └── 10-ui-tools/           # UI and tools
│   ├── steering/                  # AI steering rules
│   └── settings/                  # Kiro settings
│
├── src/                           # Source code
│   ├── kernel/                    # Linux kernel modifications
│   │   ├── arch/                  # Architecture-specific code
│   │   ├── drivers/               # Device drivers
│   │   ├── fs/                    # Filesystem code
│   │   └── mm/                    # Memory management
│   │
│   ├── helix/                     # Helix kernel core
│   │   ├── core/                  # Core Helix functionality
│   │   ├── state/                 # State management
│   │   ├── scheduler/             # Helix scheduler
│   │   └── interface/             # Kernel interface
│   │
│   ├── quantum/                   # Quantum computing components
│   │   ├── qutrit/                # Qutrit system
│   │   │   ├── state/             # State representation
│   │   │   ├── gates/             # Quantum gates
│   │   │   ├── simulator/         # Simulation engine
│   │   │   └── hardware/          # Hardware abstraction
│   │   │
│   │   ├── mwave/                 # McGinty M-Wave storage
│   │   │   ├── equation/          # McGinty equation solver
│   │   │   ├── fractal/           # Fractal analysis
│   │   │   ├── encoder/           # Wave function encoder
│   │   │   └── filesystem/        # Filesystem integration
│   │   │
│   │   ├── vacuum/                # Zero-point vacuum interface
│   │   │   ├── sampling/          # Vacuum sampling
│   │   │   ├── regularization/    # Regularization monitor
│   │   │   ├── randomness/        # Randomness extraction
│   │   │   └── safety/            # Safety mechanisms
│   │   │
│   │   ├── reversible/            # Reversible computing
│   │   │   ├── compiler/          # Reversible compiler
│   │   │   ├── garbage/           # Garbage bit manager
│   │   │   ├── profiler/          # Energy profiler
│   │   │   └── scheduler/         # Reversible scheduler
│   │   │
│   │   ├── deferred/              # Deferred observation
│   │   │   ├── sandbox/           # Quantum isolation
│   │   │   ├── projection/        # Projection operators
│   │   │   ├── coherence/         # Coherence tracking
│   │   │   └── interface/         # Quantum-classical interface
│   │   │
│   │   └── hybrid/                # Hybrid execution engine
│   │       ├── router/            # Computation router
│   │       ├── classical/         # Classical execution
│   │       ├── quantum/           # Quantum execution
│   │       └── optimizer/         # Execution optimizer
│   │
│   ├── desktop/                   # Cutefish desktop environment
│   │   ├── shell/                 # Desktop shell
│   │   ├── panel/                 # Top panel
│   │   ├── dock/                  # Bottom dock
│   │   ├── menu/                  # Application menu
│   │   ├── settings/              # System settings
│   │   ├── filemanager/           # File manager
│   │   ├── terminal/              # Terminal emulator
│   │   ├── texteditor/            # Text editor
│   │   └── quantum-control/       # Quantum Control Center
│   │
│   ├── bootloader/                # Helix Boot bootloader
│   │   ├── uefi/                  # UEFI implementation
│   │   ├── graphics/              # Graphics rendering
│   │   ├── menu/                  # Boot menu
│   │   ├── quantum/               # Quantum state persistence
│   │   └── recovery/              # Recovery mode
│   │
│   ├── audio/                     # 432Hz audio system
│   │   ├── kernel/                # Kernel audio subsystem
│   │   ├── alsa/                  # ALSA modifications
│   │   ├── pulse/                 # PulseAudio integration
│   │   ├── quantum/               # Quantum audio enhancement
│   │   └── midi/                  # MIDI support
│   │
│   ├── tools/                     # System utilities
│   │   ├── universalos-update/    # System update tool
│   │   ├── universalos-rollback/  # Rollback tool
│   │   ├── helix-boot-install/    # Bootloader installer
│   │   ├── quantum-state/         # Quantum state manager
│   │   └── mwave-manager/         # M-Wave storage manager
│   │
│   └── libs/                      # Internal libraries
│       ├── libqutrit/             # Qutrit library
│       ├── libmcginty/            # McGinty equation library
│       ├── libvacuum/             # Vacuum interface library
│       ├── libreversible/         # Reversible computing library
│       └── libhelix/              # Helix core library
│
├── include/                       # Public header files
│   ├── helix/                     # Helix headers
│   ├── quantum/                   # Quantum headers
│   ├── desktop/                   # Desktop headers
│   └── audio/                     # Audio headers
│
├── lib/                           # Third-party libraries
│   └── .gitkeep                   # Placeholder
│
├── build/                         # Build outputs (gitignored)
│   ├── debug/                     # Debug builds
│   ├── release/                   # Release builds
│   ├── test/                      # Test builds
│   ├── coverage/                  # Coverage reports
│   └── docs/                      # Generated docs
│
├── tests/                         # Test suites
│   ├── unit/                      # Unit tests (mirrors src/)
│   │   ├── quantum/               # Quantum unit tests
│   │   ├── desktop/               # Desktop unit tests
│   │   ├── bootloader/            # Bootloader unit tests
│   │   └── audio/                 # Audio unit tests
│   │
│   ├── integration/               # Integration tests
│   ├── property/                  # Property-based tests
│   ├── algorithms/                # Algorithm competition tests
│   ├── fixtures/                  # Test fixtures
│   └── mocks/                     # Mock objects
│
├── docs/                          # Documentation
│   ├── api/                       # Generated API docs
│   │   ├── helix/
│   │   ├── quantum/
│   │   ├── desktop/
│   │   ├── bootloader/
│   │   ├── audio/
│   │   ├── kernel/
│   │   └── libs/
│   │
│   ├── design/                    # Design documents
│   │   ├── IMMUTABLE_SYSTEM_DESIGN.md
│   │   ├── CUTEFISH_DESKTOP_DESIGN.md
│   │   ├── AUDIO_HARMONIC_DESIGN.md
│   │   └── README.md
│   │
│   ├── guides/                    # User and developer guides
│   │   ├── user/                  # User guides
│   │   ├── developer/             # Developer guides
│   │   ├── contributor/           # Contributor guides
│   │   └── README.md
│   │
│   ├── theory/                    # Theoretical foundations
│   │   └── README.md
│   │
│   ├── architecture/              # Architecture diagrams
│   │   ├── BOOTLOADER_AND_ARCHITECTURE.md
│   │   └── README.md
│   │
│   ├── MASTER_PLAN.md
│   ├── SPEC_ROADMAP.md
│   ├── PROJECT_SUMMARY.md
│   ├── PLANNING_COMPLETE.md
│   ├── CHANGELOG.md
│   └── DIRECTORY_STRUCTURE.md     # This file
│
├── scripts/                       # Build and utility scripts
│   ├── build/                     # Build scripts
│   ├── test/                      # Test scripts
│   ├── deploy/                    # Deployment scripts
│   ├── dev/                       # Development utilities
│   │   ├── validate-structure.sh
│   │   └── validate-structure.ps1
│   └── ci/                        # CI/CD scripts
│
├── tools/                         # Development tools
│   ├── algorithm-tester/         # Algorithm competition framework
│   ├── quantum-debugger/         # Quantum state debugger
│   ├── mwave-analyzer/           # M-Wave storage analyzer
│   └── performance-profiler/     # Performance profiling tool
│
├── assets/                        # Images, fonts, icons
│   ├── images/                    # Images
│   │   └── wallpapers/
│   ├── fonts/                     # Fonts
│   └── icons/                     # Icons
│       ├── cutefish/
│       └── quantum/
│
└── logs/                          # Logs and debug output
    └── winners/                   # Algorithm competition winners (tracked)
```

## Directory Descriptions

### Root Level Directories

#### `.kiro/` - Kiro AI Configuration
Contains all Kiro AI-related configuration, feature specifications, and steering rules.

**Subdirectories:**
- `specs/` - Feature specifications organized by phase (0-foundation, 1-arch-linux, etc.)
- `steering/` - AI steering rules and guidelines
- `settings/` - Kiro configuration files

**Purpose:** Centralized location for AI-assisted development configuration and documentation.

#### `src/` - Source Code
All source code organized by major system components.

**Major Components:**
- `kernel/` - Linux kernel modifications
- `helix/` - Helix kernel core
- `quantum/` - Quantum computing components (qutrit, mwave, vacuum, reversible, deferred, hybrid)
- `desktop/` - Cutefish desktop environment
- `bootloader/` - Helix Boot bootloader
- `audio/` - 432Hz audio system
- `tools/` - System utilities
- `libs/` - Internal libraries

**Purpose:** Primary development directory containing all UniversalOS source code.

#### `include/` - Public Header Files
C/C++ header files for public APIs.

**Organization:** Mirrors `src/` structure for major components (helix, quantum, desktop, audio).

**Purpose:** Provides public interfaces for external code linking against UniversalOS libraries.

#### `lib/` - Third-Party Libraries
External dependencies and third-party libraries.

**Contents:** Git submodules or vendored code (Eigen, FFTW, GSL, Qt, etc.).

**Purpose:** Isolates external dependencies from UniversalOS code.

#### `build/` - Build Outputs (gitignored)
All build artifacts and generated files.

**Subdirectories:**
- `debug/` - Debug builds
- `release/` - Release builds
- `test/` - Test builds
- `coverage/` - Code coverage reports
- `docs/` - Generated documentation

**Purpose:** Keeps source tree clean by isolating all build outputs.

#### `tests/` - Test Suites
Comprehensive test infrastructure.

**Subdirectories:**
- `unit/` - Unit tests (mirrors `src/` structure)
- `integration/` - Integration tests for component interaction
- `property/` - Property-based tests for correctness
- `algorithms/` - Algorithm competition tests (12-300 algorithms per component)
- `fixtures/` - Test fixtures and data
- `mocks/` - Mock objects

**Purpose:** Ensures code quality through comprehensive testing.

#### `docs/` - Documentation
All project documentation.

**Subdirectories:**
- `api/` - Generated API documentation (Doxygen, rustdoc, etc.)
- `design/` - Design documents (system design, architecture decisions)
- `guides/` - User, developer, and contributor guides
- `theory/` - Theoretical foundations (quantum computing, fractal storage, etc.)
- `architecture/` - Architecture diagrams and system overviews

**Purpose:** Centralized documentation for all audiences (users, developers, researchers).

#### `scripts/` - Build and Utility Scripts
Automation scripts for building, testing, and deploying.

**Subdirectories:**
- `build/` - Build scripts for different components
- `test/` - Test execution scripts
- `deploy/` - Deployment scripts (ISO creation, OSTree deployment)
- `dev/` - Development utilities (setup, formatting, validation)
- `ci/` - CI/CD scripts

**Purpose:** Automates common development tasks and CI/CD workflows.

#### `tools/` - Development Tools
Custom tools for UniversalOS development.

**Subdirectories:**
- `algorithm-tester/` - Algorithm competition framework
- `quantum-debugger/` - Quantum state debugger
- `mwave-analyzer/` - M-Wave storage analyzer
- `performance-profiler/` - Performance profiling tool

**Purpose:** Provides specialized tools for UniversalOS development and debugging.

#### `assets/` - Visual Assets
Images, fonts, and icons for the desktop environment.

**Subdirectories:**
- `images/` - Images, logos, wallpapers
- `fonts/` - Font files (Noto Sans, Fira Code, JetBrains Mono)
- `icons/` - Icon themes (Cutefish, Quantum)

**Purpose:** Stores visual assets for the desktop environment and branding.

#### `logs/` - Logs and Debug Output
Log files and debug output (mostly gitignored).

**Subdirectories:**
- `winners/` - Algorithm competition winners (tracked in Git)
- Other log directories (gitignored)

**Purpose:** Stores runtime logs and algorithm competition results.

### Source Code Organization

#### `src/kernel/` - Linux Kernel Modifications
Modifications to the Linux kernel for UniversalOS.

**Subdirectories:**
- `arch/` - Architecture-specific code
- `drivers/` - Device drivers
- `fs/` - Filesystem code
- `mm/` - Memory management

**Purpose:** Customizes Linux kernel for UniversalOS requirements.

#### `src/helix/` - Helix Kernel Core
Core Helix kernel functionality.

**Subdirectories:**
- `core/` - Core Helix functionality
- `state/` - State management
- `scheduler/` - Helix scheduler
- `interface/` - Kernel interface

**Purpose:** Implements the Helix kernel that manages quantum and classical computation.

#### `src/quantum/` - Quantum Computing Components
All quantum computing functionality.

**Major Subsystems:**

**`qutrit/`** - Qutrit System (3-state quantum computing)
- `state/` - State representation
- `gates/` - Quantum gates
- `simulator/` - Simulation engine
- `hardware/` - Hardware abstraction

**`mwave/`** - McGinty M-Wave Storage (fractal-based storage)
- `equation/` - McGinty equation solver
- `fractal/` - Fractal analysis
- `encoder/` - Wave function encoder
- `filesystem/` - Filesystem integration

**`vacuum/`** - Zero-Point Vacuum Interface (quantum randomness)
- `sampling/` - Vacuum sampling
- `regularization/` - Regularization monitor
- `randomness/` - Randomness extraction
- `safety/` - Safety mechanisms

**`reversible/`** - Reversible Computing (energy-efficient computation)
- `compiler/` - Reversible compiler
- `garbage/` - Garbage bit manager
- `profiler/` - Energy profiler
- `scheduler/` - Reversible scheduler

**`deferred/`** - Deferred Observation (quantum-classical boundary)
- `sandbox/` - Quantum isolation
- `projection/` - Projection operators
- `coherence/` - Coherence tracking
- `interface/` - Quantum-classical interface

**`hybrid/`** - Hybrid Execution Engine (quantum-classical routing)
- `router/` - Computation router
- `classical/` - Classical execution
- `quantum/` - Quantum execution
- `optimizer/` - Execution optimizer

**Purpose:** Implements all quantum computing features that make UniversalOS unique.

#### `src/desktop/` - Cutefish Desktop Environment
Desktop environment components.

**Subdirectories:**
- `shell/` - Desktop shell
- `panel/` - Top panel
- `dock/` - Bottom dock
- `menu/` - Application menu
- `settings/` - System settings
- `filemanager/` - File manager
- `terminal/` - Terminal emulator
- `texteditor/` - Text editor
- `quantum-control/` - Quantum Control Center

**Purpose:** Provides the user interface for UniversalOS.

#### `src/bootloader/` - Helix Boot Bootloader
Custom bootloader with quantum state persistence.

**Subdirectories:**
- `uefi/` - UEFI implementation
- `graphics/` - Graphics rendering
- `menu/` - Boot menu
- `quantum/` - Quantum state persistence
- `recovery/` - Recovery mode

**Purpose:** Boots UniversalOS and persists quantum state across reboots.

#### `src/audio/` - 432Hz Audio System
Audio system tuned to 432Hz harmonic frequency.

**Subdirectories:**
- `kernel/` - Kernel audio subsystem
- `alsa/` - ALSA modifications
- `pulse/` - PulseAudio integration
- `quantum/` - Quantum audio enhancement
- `midi/` - MIDI support

**Purpose:** Provides audio system with harmonic tuning and quantum enhancement.

#### `src/tools/` - System Utilities
Command-line tools for system management.

**Subdirectories:**
- `universalos-update/` - System update tool
- `universalos-rollback/` - Rollback tool
- `helix-boot-install/` - Bootloader installer
- `quantum-state/` - Quantum state manager
- `mwave-manager/` - M-Wave storage manager

**Purpose:** Provides system administration and management tools.

#### `src/libs/` - Internal Libraries
Reusable libraries for UniversalOS components.

**Subdirectories:**
- `libqutrit/` - Qutrit library
- `libmcginty/` - McGinty equation library
- `libvacuum/` - Vacuum interface library
- `libreversible/` - Reversible computing library
- `libhelix/` - Helix core library

**Purpose:** Provides shared functionality across UniversalOS components.

## File Naming Conventions

### Source Files

**C Files:**
- Format: `snake_case.c`
- Example: `quantum_state.c`, `helix_scheduler.c`

**C++ Files:**
- Format: `snake_case.cpp` (implementation), `snake_case.hpp` (header)
- Example: `qutrit_simulator.cpp`, `mwave_encoder.hpp`

**Rust Files:**
- Format: `snake_case.rs`
- Example: `vacuum_sampler.rs`, `reversible_compiler.rs`

**Python Files:**
- Format: `snake_case.py`
- Example: `algorithm_tester.py`, `quantum_debugger.py`

**Julia Files:**
- Format: `snake_case.jl`
- Example: `mcginty_solver.jl`, `fractal_analyzer.jl`

### Test Files

**Unit Tests:**
- Format: `{source_name}_test.{ext}`
- Example: `quantum_state_test.cpp`, `helix_scheduler_test.rs`
- Location: `tests/unit/{component}/{source_name}_test.{ext}`

**Integration Tests:**
- Format: `test_{feature}.{ext}`
- Example: `test_quantum_classical_integration.cpp`
- Location: `tests/integration/{feature}/`

**Property-Based Tests:**
- Format: `prop_{feature}.{ext}`
- Example: `prop_qutrit_reversibility.cpp`
- Location: `tests/property/{component}/`

**Algorithm Tests:**
- Format: `algo_{algorithm_name}.{ext}`
- Example: `algo_qutrit_evolution_v1.cpp`, `algo_mcginty_solver_fast.jl`
- Location: `tests/algorithms/{component}/`

### Documentation Files

**Top-Level Documentation:**
- Format: `UPPERCASE_WITH_UNDERSCORES.md`
- Example: `README.md`, `CONTRIBUTING.md`, `MASTER_PLAN.md`

**Subdirectory Documentation:**
- Format: `lowercase-with-dashes.md` or `COMPONENT_NAME.md`
- Example: `getting-started.md`, `IMMUTABLE_SYSTEM_DESIGN.md`

**Design Documents:**
- Format: `{COMPONENT}_DESIGN.md`
- Example: `CUTEFISH_DESKTOP_DESIGN.md`, `AUDIO_HARMONIC_DESIGN.md`

### Scripts

**Shell Scripts:**
- Format: `kebab-case.sh` or `kebab-case.bash`
- Example: `build-kernel.sh`, `run-unit-tests.sh`
- Permissions: `755` (executable)

**PowerShell Scripts:**
- Format: `kebab-case.ps1`
- Example: `validate-structure.ps1`, `build-all.ps1`

**Python Scripts:**
- Format: `snake_case.py`
- Example: `algorithm_tester.py`, `generate_docs.py`

**Executable Tools:**
- Format: No extension, `kebab-case`
- Example: `universalos-update`, `quantum-state`
- Permissions: `755` (executable)

## Design Rationale

### Why Component-Based Organization?

**Decision:** Organize by component (quantum, desktop, etc.) rather than by language or file type.

**Rationale:**
- Clear separation of concerns
- Easy to find related code
- Supports modular development
- Aligns with system architecture
- Facilitates team collaboration (different teams can work on different components)

**Alternative Considered:** Organize by language (c/, rust/, python/)  
**Rejected Because:** Splits related functionality across directories, making it harder to understand and maintain components.

### Why Separate Build Directory?

**Decision:** All build outputs in `build/` (gitignored).

**Rationale:**
- Keeps source tree clean
- Easy to clean (rm -rf build/)
- Supports multiple build configurations (debug, release, test)
- Standard CMake practice
- Prevents accidental commits of build artifacts

### Why Tests Mirror Source Structure?

**Decision:** Unit tests in `tests/unit/` mirror `src/` structure.

**Rationale:**
- Easy to find tests for specific source files
- Clear 1:1 mapping between source and tests
- Standard practice in many projects
- Simplifies test discovery for build systems

**Example:**
```
src/quantum/qutrit/state.cpp
tests/unit/quantum/qutrit/state_test.cpp
```

### Why Quantum Components in Dedicated Directory?

**Decision:** All quantum code in `src/quantum/` with subsystems.

**Rationale:**
- Quantum features are core to UniversalOS
- Deserves top-level organization
- Easy to work on quantum features independently
- Clear boundary between quantum and classical code
- Supports specialized quantum development team

### Why Algorithm Competition Tests?

**Decision:** Separate `tests/algorithms/` directory with results in `logs/winners/`.

**Rationale:**
- Algorithm tests are different from unit/integration tests
- Run 12-300 algorithms per component to find optimal implementations
- Results need to be tracked in Git for reproducibility
- Need dedicated infrastructure for running competitions
- Supports continuous optimization of critical algorithms

### Why Moderate Directory Depth?

**Decision:** Maximum 5 levels of directory nesting.

**Rationale:**
- Too flat: Hard to organize large codebase
- Too deep: Hard to navigate, long paths, cognitive overhead
- 5 levels provides good balance between organization and simplicity

**Example:**
```
src/quantum/qutrit/simulator/engine/core.cpp  # 5 levels - acceptable
src/q/qu/s/e/c.cpp                            # Too abbreviated
src/quantum-qutrit-simulator-engine-core.cpp  # Too flat
```

## Adding New Components

### Step 1: Create Source Directory
```bash
mkdir -p src/{component}/{subcomponent}
```

### Step 2: Create Include Directory
```bash
mkdir -p include/{component}
```

### Step 3: Create Test Directory
```bash
mkdir -p tests/unit/{component}/{subcomponent}
```

### Step 4: Add README Files
```bash
echo "# {Component} Component" > src/{component}/README.md
echo "# {Component} Tests" > tests/unit/{component}/README.md
```

### Step 5: Update Build System
- Add to `CMakeLists.txt` or `Makefile`
- Add to `Cargo.toml` if Rust component

### Step 6: Update Documentation
- Add component description to this file
- Create design document in `docs/design/`
- Update `docs/PROJECT_SUMMARY.md`

### Example: Adding New Component "neural"
```bash
# Create directories
mkdir -p src/neural/{core,training,inference}
mkdir -p include/neural
mkdir -p tests/unit/neural/{core,training,inference}

# Add README files
echo "# Neural Component" > src/neural/README.md
echo "# Neural Tests" > tests/unit/neural/README.md

# Update build system (add to CMakeLists.txt)
# Update documentation (add to this file and PROJECT_SUMMARY.md)
```

## Validation

### Automated Validation Script

The project includes validation scripts to ensure directory structure integrity:

**Bash:** `scripts/dev/validate-structure.sh`  
**PowerShell:** `scripts/dev/validate-structure.ps1`

### What the Validator Checks

1. **Required Directories Exist**
   - All root-level directories (src, include, tests, docs, etc.)
   - All major component directories (src/quantum, src/desktop, etc.)

2. **README Files Present**
   - Each major component has README.md
   - Each test directory has README.md

3. **No Orphaned Files**
   - No source files in root directory
   - No build artifacts in source tree

4. **Git Configuration**
   - .gitignore exists and is properly configured
   - .gitattributes exists
   - Build directory is gitignored

### Running the Validator

**On Linux/macOS:**
```bash
./scripts/dev/validate-structure.sh
```

**On Windows (PowerShell):**
```powershell
.\scripts\dev\validate-structure.ps1
```

**Expected Output:**
```
✅ All required directories exist
✅ All README files present
✅ No orphaned files found
✅ Git configuration valid
✅ Directory structure valid
```

### Manual Validation Checklist

- [ ] All required directories exist
- [ ] README.md in each major directory
- [ ] .gitignore properly configured
- [ ] .gitattributes properly configured
- [ ] Build directory gitignored
- [ ] No build artifacts in source tree
- [ ] No orphaned source files in root
- [ ] Test structure mirrors source structure
- [ ] Documentation is up to date

## Directory Permissions

### Standard Permissions

**Directories:**
- Permission: `755` (rwxr-xr-x)
- Owner: Developer user
- Group: Developer group

**Source Files:**
- Permission: `644` (rw-r--r--)
- Owner: Developer user
- Group: Developer group

**Scripts:**
- Permission: `755` (rwxr-xr-x)
- Owner: Developer user
- Group: Developer group

**Documentation:**
- Permission: `644` (rw-r--r--)
- Owner: Developer user
- Group: Developer group

### Special Permissions

**Build Directory:**
- Permission: `755` (created by build system)
- May contain files with various permissions

**Logs Directory:**
- Permission: `755`
- Writable by build/test systems
- `logs/winners/` tracked in Git

## Git Configuration

### .gitignore

Key patterns to ignore:

```gitignore
# Build outputs
/build/
*.o
*.a
*.so
*.dylib
*.exe

# Logs (except winners)
/logs/*
!/logs/winners/

# IDE files
.vscode/
.idea/
*.swp
*.swo
*~

# OS files
.DS_Store
Thumbs.db

# Temporary files
*.tmp
*.bak
*.orig
```

### .gitattributes

Key patterns for line endings and file types:

```gitattributes
# Auto detect text files and perform LF normalization
* text=auto

# Source files
*.c text
*.cpp text
*.h text
*.hpp text
*.rs text
*.py text
*.jl text

# Documentation
*.md text
*.txt text

# Scripts (always LF)
*.sh text eol=lf
*.bash text eol=lf

# Binary files
*.png binary
*.jpg binary
*.pdf binary
*.so binary
*.a binary
```

## Best Practices

### DO:
- ✅ Place source files in appropriate `src/` subdirectories
- ✅ Create corresponding test files in `tests/unit/`
- ✅ Add README.md to new component directories
- ✅ Use consistent naming conventions (snake_case for files)
- ✅ Keep directory hierarchy shallow (max 5 levels)
- ✅ Run validation script after structural changes
- ✅ Update this documentation when adding major components

### DON'T:
- ❌ Put source files in root directory
- ❌ Commit build artifacts (build/ is gitignored)
- ❌ Create deeply nested directories (>5 levels)
- ❌ Mix different components in same directory
- ❌ Use inconsistent naming conventions
- ❌ Forget to add README.md to new directories
- ❌ Commit IDE-specific files (.vscode/, .idea/)

## Troubleshooting

### Problem: Can't find where to put new code

**Solution:** 
1. Identify the component (quantum, desktop, kernel, etc.)
2. Find the appropriate subdirectory in `src/{component}/`
3. If no appropriate subdirectory exists, create one
4. Update this documentation

### Problem: Tests not being discovered

**Solution:**
1. Ensure test files follow naming convention: `{source}_test.{ext}`
2. Ensure tests are in `tests/unit/` mirroring `src/` structure
3. Check build system configuration (CMakeLists.txt, Makefile)

### Problem: Build artifacts in source tree

**Solution:**
1. Run `git clean -fdx` to remove untracked files
2. Ensure `build/` directory is gitignored
3. Configure build system for out-of-tree builds
4. Run validation script to check

### Problem: Directory structure validation fails

**Solution:**
1. Run `./scripts/dev/validate-structure.sh` to see specific errors
2. Create missing directories
3. Add missing README.md files
4. Fix .gitignore configuration
5. Run validator again

## Summary

The UniversalOS directory structure provides:

- ✅ **Clear Organization** - Component-based structure with logical grouping
- ✅ **Scalability** - Easy to add new components without restructuring
- ✅ **Maintainability** - Consistent conventions and documentation
- ✅ **Tool Compatibility** - Works with standard build tools and IDEs
- ✅ **Quantum Support** - Dedicated directories for quantum components
- ✅ **Testing Infrastructure** - Comprehensive test organization
- ✅ **Documentation** - Well-documented with clear guidelines

This structure balances simplicity with organization, providing a solid foundation for UniversalOS development.

## References

- [Linux Kernel Directory Structure](https://www.kernel.org/doc/html/latest/)
- [Rust Project Structure](https://doc.rust-lang.org/cargo/guide/project-layout.html)
- [CMake Best Practices](https://cmake.org/cmake/help/latest/guide/tutorial/index.html)
- [UniversalOS Master Plan](MASTER_PLAN.md)
- [UniversalOS Spec Roadmap](SPEC_ROADMAP.md)

---

**Last Updated:** 2026-04-30  
**Version:** 1.0  
**Maintainer:** UniversalOS Development Team
