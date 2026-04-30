# Directory Structure - Design

## Overview

This document describes the complete directory structure for UniversalOS, including the rationale for each directory and its contents.

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
│
├── .kiro/                         # Kiro AI configuration
│   ├── specs/                     # Feature specifications
│   │   ├── 0-foundation/
│   │   ├── 1-arch-linux/
│   │   ├── 2-helix-kernel/
│   │   └── ...
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
│   ├── eigen/                     # Linear algebra (Eigen)
│   ├── fftw/                      # FFT library
│   ├── gsl/                       # GNU Scientific Library
│   └── qt/                        # Qt framework (for desktop)
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
│   │   ├── quantum/
│   │   ├── desktop/
│   │   └── ...
│   │
│   ├── integration/               # Integration tests
│   │   ├── quantum-classical/
│   │   ├── desktop-quantum/
│   │   └── ...
│   │
│   ├── property/                  # Property-based tests
│   │   ├── qutrit-properties/
│   │   ├── mwave-properties/
│   │   └── ...
│   │
│   ├── algorithms/                # Algorithm competition tests
│   │   ├── qutrit-evolution/
│   │   ├── mcginty-solvers/
│   │   ├── vacuum-sampling/
│   │   └── ...
│   │
│   ├── fixtures/                  # Test fixtures
│   └── mocks/                     # Mock objects
│
├── docs/                          # Documentation
│   ├── api/                       # Generated API docs
│   │   ├── helix/
│   │   ├── quantum/
│   │   └── desktop/
│   │
│   ├── design/                    # Design documents
│   │   ├── IMMUTABLE_SYSTEM_DESIGN.md
│   │   ├── CUTEFISH_DESKTOP_DESIGN.md
│   │   ├── BOOTLOADER_AND_ARCHITECTURE.md
│   │   └── AUDIO_HARMONIC_DESIGN.md
│   │
│   ├── guides/                    # User and developer guides
│   │   ├── user/                  # User guides
│   │   ├── developer/             # Developer guides
│   │   └── contributor/           # Contributor guides
│   │
│   ├── theory/                    # Theoretical foundations
│   │   ├── quantum-computing.md
│   │   ├── fractal-storage.md
│   │   ├── vacuum-physics.md
│   │   └── reversible-computing.md
│   │
│   ├── architecture/              # Architecture diagrams
│   │   ├── system-overview.svg
│   │   ├── helix-kernel.svg
│   │   └── quantum-subsystem.svg
│   │
│   ├── MASTER_PLAN.md
│   ├── SPEC_ROADMAP.md
│   ├── PROJECT_SUMMARY.md
│   └── QUICK_START.md
│
├── scripts/                       # Build and utility scripts
│   ├── build/                     # Build scripts
│   │   ├── build-kernel.sh
│   │   ├── build-helix.sh
│   │   ├── build-desktop.sh
│   │   └── build-all.sh
│   │
│   ├── test/                      # Test scripts
│   │   ├── run-unit-tests.sh
│   │   ├── run-integration-tests.sh
│   │   ├── run-property-tests.sh
│   │   └── run-algorithm-tests.sh
│   │
│   ├── deploy/                    # Deployment scripts
│   │   ├── create-iso.sh
│   │   ├── deploy-ostree.sh
│   │   └── package-release.sh
│   │
│   ├── dev/                       # Development utilities
│   │   ├── setup-dev-env.sh
│   │   ├── format-code.sh
│   │   └── check-style.sh
│   │
│   └── ci/                        # CI/CD scripts
│       ├── ci-build.sh
│       ├── ci-test.sh
│       └── ci-deploy.sh
│
├── tools/                         # Development tools
│   ├── algorithm-tester/         # Algorithm competition framework
│   ├── quantum-debugger/         # Quantum state debugger
│   ├── mwave-analyzer/           # M-Wave storage analyzer
│   └── performance-profiler/     # Performance profiling tool
│
├── assets/                        # Images, fonts, icons
│   ├── images/                    # Images
│   │   ├── logo.png
│   │   ├── icon.svg
│   │   └── wallpapers/
│   │
│   ├── fonts/                     # Fonts
│   │   ├── noto-sans/
│   │   ├── fira-code/
│   │   └── jetbrains-mono/
│   │
│   └── icons/                     # Icons
│       ├── cutefish/
│       └── quantum/
│
├── logs/                          # Logs and debug output (gitignored except winners/)
│   ├── build/                     # Build logs
│   ├── test/                      # Test logs
│   ├── debug/                     # Debug logs
│   └── winners/                   # Algorithm competition winners (tracked in Git)
│       ├── qutrit-evolution/
│       ├── mcginty-solvers/
│       └── ...
│
├── Makefile                       # Main Makefile
├── CMakeLists.txt                 # CMake configuration
├── Cargo.toml                     # Rust workspace configuration
└── pyproject.toml                 # Python project configuration
```

## Directory Descriptions

### Root Level

**`.kiro/`**: Kiro AI configuration and specifications
- Contains all feature specs organized by phase
- Steering rules for AI assistance
- Kiro settings and configuration

**`src/`**: All source code organized by component
- Primary development directory
- Organized by major system components
- Each subdirectory is a logical module

**`include/`**: Public header files
- C/C++ header files for public APIs
- Organized to mirror `src/` structure
- Used by external code linking against UniversalOS libraries

**`lib/`**: Third-party libraries
- External dependencies
- Git submodules or vendored code
- Not built by UniversalOS build system

**`build/`**: Build outputs (gitignored)
- All build artifacts
- Separate debug/release builds
- Generated documentation
- Coverage reports

**`tests/`**: Test suites
- Unit tests mirror `src/` structure
- Integration tests for component interaction
- Property-based tests for correctness
- Algorithm competition tests

**`docs/`**: Documentation
- API documentation (generated)
- Design documents
- User and developer guides
- Theoretical foundations
- Architecture diagrams

**`scripts/`**: Build and utility scripts
- Build scripts for different components
- Test execution scripts
- Deployment scripts
- Development utilities
- CI/CD scripts

**`tools/`**: Development tools
- Custom tools for UniversalOS development
- Algorithm testing framework
- Quantum debugger
- Performance profilers

**`assets/`**: Images, fonts, icons
- Visual assets for desktop environment
- Logos and branding
- Wallpapers
- Icon themes

**`logs/`**: Logs and debug output
- Build logs
- Test logs
- Debug output
- Algorithm competition winners (tracked in Git)

## Design Decisions

### Decision 1: Flat vs. Deep Hierarchy
**Choice**: Moderate depth (max 5 levels)  
**Rationale**: 
- Too flat: Hard to organize large codebase
- Too deep: Hard to navigate, long paths
- 5 levels provides good balance

**Example**:
```
src/quantum/qutrit/simulator/engine/core.cpp  # 5 levels - acceptable
src/q/qu/s/e/c.cpp                            # Too abbreviated
src/quantum-qutrit-simulator-engine-core.cpp  # Too flat
```

### Decision 2: Component-Based Organization
**Choice**: Organize by component (quantum, desktop, etc.)  
**Rationale**:
- Clear separation of concerns
- Easy to find related code
- Supports modular development
- Aligns with system architecture

**Alternative Considered**: Organize by language (c/, rust/, python/)
**Rejected Because**: Splits related functionality across directories

### Decision 3: Tests Mirror Source Structure
**Choice**: Unit tests in `tests/unit/` mirror `src/` structure  
**Rationale**:
- Easy to find tests for specific source files
- Clear 1:1 mapping
- Standard practice in many projects

**Example**:
```
src/quantum/qutrit/state.cpp
tests/unit/quantum/qutrit/state_test.cpp
```

### Decision 4: Separate Build Directory
**Choice**: All build outputs in `build/` (gitignored)  
**Rationale**:
- Keeps source tree clean
- Easy to clean (rm -rf build/)
- Supports multiple build configurations
- Standard CMake practice

### Decision 5: Quantum Components in Dedicated Directory
**Choice**: All quantum code in `src/quantum/`  
**Rationale**:
- Quantum features are core to UniversalOS
- Deserves top-level organization
- Easy to work on quantum features independently
- Clear boundary between quantum and classical code

### Decision 6: Desktop Environment in Source Tree
**Choice**: Cutefish desktop in `src/desktop/`  
**Rationale**:
- Desktop is integral to UniversalOS
- Not a separate project
- Tight integration with quantum features (Quantum Control Center)
- Easier to maintain and develop

### Decision 7: Bootloader in Source Tree
**Choice**: Helix Boot in `src/bootloader/`  
**Rationale**:
- Custom bootloader specific to UniversalOS
- Needs quantum state persistence
- Not a generic bootloader
- Tight integration with system

### Decision 8: Algorithm Competition Tests
**Choice**: Separate `tests/algorithms/` directory  
**Rationale**:
- Algorithm tests are different from unit/integration tests
- Run 12-300 algorithms per component
- Results stored in `logs/winners/`
- Need dedicated infrastructure

### Decision 9: Documentation Organization
**Choice**: Multiple subdirectories in `docs/`  
**Rationale**:
- Different types of documentation (API, guides, theory)
- Generated docs separate from written docs
- Easy to find specific documentation
- Supports multiple audiences (users, developers, researchers)

### Decision 10: Scripts by Purpose
**Choice**: Scripts organized by purpose (build, test, deploy, etc.)  
**Rationale**:
- Clear intent of each script
- Easy to find the right script
- Supports CI/CD integration
- Standard practice

## File Naming Conventions

### Source Files
- **C files**: `snake_case.c`
- **C++ files**: `snake_case.cpp`
- **Rust files**: `snake_case.rs`
- **Python files**: `snake_case.py`
- **Julia files**: `snake_case.jl`
- **Headers**: `snake_case.h` or `snake_case.hpp`

### Test Files
- **Unit tests**: `{source_name}_test.{ext}`
- **Integration tests**: `test_{feature}.{ext}`
- **Property tests**: `prop_{feature}.{ext}`
- **Algorithm tests**: `algo_{algorithm_name}.{ext}`

### Documentation Files
- **Markdown**: `UPPERCASE_WITH_UNDERSCORES.md` (top-level)
- **Markdown**: `lowercase-with-dashes.md` (subdirectories)
- **Design docs**: `{COMPONENT}_DESIGN.md`

### Scripts
- **Shell scripts**: `kebab-case.sh`
- **Python scripts**: `snake_case.py`
- **Executable**: No extension (e.g., `universalos-update`)

## Directory Permissions

### Standard Permissions
- **Directories**: `755` (rwxr-xr-x)
- **Source files**: `644` (rw-r--r--)
- **Scripts**: `755` (rwxr-xr-x)
- **Documentation**: `644` (rw-r--r--)

### Special Permissions
- **Build directory**: `755` (created by build system)
- **Logs directory**: `755` (writable by build/test systems)

## Git Configuration

### .gitignore
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

# Scripts
*.sh text eol=lf
*.bash text eol=lf

# Binary files
*.png binary
*.jpg binary
*.pdf binary
*.so binary
*.a binary
```

## Validation

### Directory Structure Validator
```bash
#!/bin/bash
# scripts/dev/validate-structure.sh

# Check required directories exist
required_dirs=(
    "src"
    "include"
    "tests"
    "docs"
    "scripts"
    "tools"
    "assets"
    ".kiro/specs"
)

for dir in "${required_dirs[@]}"; do
    if [ ! -d "$dir" ]; then
        echo "ERROR: Required directory missing: $dir"
        exit 1
    fi
done

echo "✅ Directory structure valid"
```

## Migration Path

### Phase 1: Create Root Structure
1. Create all root-level directories
2. Add README.md to each directory
3. Configure .gitignore and .gitattributes

### Phase 2: Create Source Structure
1. Create `src/` subdirectories
2. Add placeholder files (.gitkeep)
3. Create corresponding `include/` structure

### Phase 3: Create Test Structure
1. Create `tests/` subdirectories
2. Mirror `src/` structure in `tests/unit/`
3. Create test framework

### Phase 4: Create Documentation Structure
1. Create `docs/` subdirectories
2. Move existing docs to appropriate locations
3. Set up API doc generation

### Phase 5: Create Scripts and Tools
1. Create `scripts/` subdirectories
2. Create `tools/` subdirectories
3. Add build and test scripts

## Maintenance

### Adding New Components
1. Create directory in `src/{component}/`
2. Create corresponding `include/{component}/`
3. Create corresponding `tests/unit/{component}/`
4. Update build system configuration
5. Add README.md explaining component

### Removing Components
1. Remove source directory
2. Remove include directory
3. Remove test directory
4. Update build system configuration
5. Update documentation

## Correctness Properties

### Property 1: Directory Existence
**Property**: All required directories exist  
**Test**: Check each required directory exists  
**Validation**: `validate-structure.sh` script

### Property 2: No Orphaned Files
**Property**: All source files are in appropriate directories  
**Test**: No .c/.cpp/.rs files in root directory  
**Validation**: Find command to locate orphaned files

### Property 3: Test-Source Correspondence
**Property**: Every source file has corresponding test file  
**Test**: For each `src/{path}/{file}.cpp`, check `tests/unit/{path}/{file}_test.cpp` exists  
**Validation**: Script to verify test coverage

### Property 4: Build Output Isolation
**Property**: No build outputs in source tree  
**Test**: No .o, .a, .so files in `src/` or `include/`  
**Validation**: Git status should be clean after build

### Property 5: Documentation Completeness
**Property**: Each major component has README.md  
**Test**: Check README.md exists in each `src/` subdirectory  
**Validation**: Script to verify documentation

## Conclusion

This directory structure provides:
- ✅ Clear organization by component
- ✅ Scalable for future growth
- ✅ Compatible with standard build tools
- ✅ Easy navigation for developers
- ✅ Proper separation of concerns
- ✅ Support for quantum-specific components
- ✅ Comprehensive testing infrastructure
- ✅ Well-organized documentation

The structure balances simplicity with organization, providing a solid foundation for UniversalOS development.
