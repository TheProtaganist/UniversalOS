# UniversalOS Directory Purposes

## Overview

This document provides a comprehensive guide to the purpose and usage of each directory in the UniversalOS project. Understanding what goes where is essential for maintaining a clean, organized codebase.

## Table of Contents

1. [Root Level Directories](#root-level-directories)
2. [Source Code Directories](#source-code-directories)
3. [Test Directories](#test-directories)
4. [Documentation Directories](#documentation-directories)
5. [Support Directories](#support-directories)
6. [Quick Decision Guide](#quick-decision-guide)

## Root Level Directories

### `.kiro/` - Kiro AI Configuration

**Purpose:** Centralized location for all Kiro AI-related configuration, feature specifications, and steering rules.

**Contains:**
- `specs/` - Feature specifications organized by phase
- `steering/` - AI steering rules and guidelines
- `settings/` - Kiro configuration files

**What Goes Here:**
- ✅ Feature specification documents (requirements, design, tasks)
- ✅ AI steering rules for development guidance
- ✅ Kiro configuration and settings

**What Doesn't Go Here:**
- ❌ Source code
- ❌ Build artifacts
- ❌ User documentation

**Example Files:**
```
.kiro/specs/3-qutrit-computing/requirements.md
.kiro/specs/3-qutrit-computing/design.md
.kiro/specs/3-qutrit-computing/tasks.md
.kiro/steering/coding-standards.md
.kiro/settings/mcp.json
```

---

### `src/` - Source Code

**Purpose:** All source code for UniversalOS, organized by major system components.

**Contains:**
- `kernel/` - Linux kernel modifications
- `helix/` - Helix kernel core
- `quantum/` - Quantum computing components
- `desktop/` - Cutefish desktop environment
- `bootloader/` - Helix Boot bootloader
- `audio/` - 432Hz audio system
- `tools/` - System utilities
- `libs/` - Internal libraries

**What Goes Here:**
- ✅ All implementation code (C, C++, Rust, Python, Julia)
- ✅ Private header files
- ✅ Component-specific README files
- ✅ Build configuration for components

**What Doesn't Go Here:**
- ❌ Test code (goes in `tests/`)
- ❌ Public headers (goes in `include/`)
- ❌ Build outputs (goes in `build/`)
- ❌ Documentation (goes in `docs/`)

**Example Files:**
```
src/quantum/qutrit/state.cpp
src/quantum/qutrit/state.hpp
src/helix/scheduler.rs
src/desktop/shell/main.cpp
```

---

### `include/` - Public Header Files

**Purpose:** C/C++ header files that define public APIs for external code linking against UniversalOS libraries.

**Contains:**
- `helix/` - Helix public headers
- `quantum/` - Quantum public headers
- `desktop/` - Desktop public headers
- `audio/` - Audio public headers

**What Goes Here:**
- ✅ Public API headers (.h, .hpp)
- ✅ Headers for libraries that will be used by external code
- ✅ Interface definitions

**What Doesn't Go Here:**
- ❌ Private/internal headers (keep in `src/`)
- ❌ Implementation files
- ❌ Test headers

**Example Files:**
```
include/quantum/qutrit_state.hpp
include/helix/scheduler.hpp
include/desktop/shell_api.hpp
```

---

### `lib/` - Third-Party Libraries

**Purpose:** External dependencies and third-party libraries not built by UniversalOS.

**Contains:**
- Git submodules or vendored code
- External libraries (Eigen, FFTW, GSL, Qt, etc.)

**What Goes Here:**
- ✅ Third-party library source code
- ✅ Git submodules
- ✅ Vendored dependencies

**What Doesn't Go Here:**
- ❌ UniversalOS code (goes in `src/`)
- ❌ Build outputs
- ❌ System-installed libraries (use system package manager)

**Example:**
```
lib/eigen/
lib/fftw/
lib/gsl/
```

---

### `build/` - Build Outputs (gitignored)

**Purpose:** All build artifacts and generated files. Keeps source tree clean.

**Contains:**
- `debug/` - Debug builds
- `release/` - Release builds
- `test/` - Test builds
- `coverage/` - Code coverage reports
- `docs/` - Generated documentation

**What Goes Here:**
- ✅ Compiled binaries
- ✅ Object files (.o, .obj)
- ✅ Libraries (.a, .so, .dll)
- ✅ Generated documentation
- ✅ Coverage reports

**What Doesn't Go Here:**
- ❌ Source code
- ❌ Anything tracked in Git

**Note:** This entire directory is gitignored. Clean with `rm -rf build/`.

---

### `tests/` - Test Suites

**Purpose:** Comprehensive test infrastructure for all UniversalOS components.

**Contains:**
- `unit/` - Unit tests (mirrors `src/` structure)
- `integration/` - Integration tests
- `property/` - Property-based tests
- `algorithms/` - Algorithm competition tests
- `fixtures/` - Test fixtures and data
- `mocks/` - Mock objects

**What Goes Here:**
- ✅ All test code
- ✅ Test fixtures and data
- ✅ Mock objects
- ✅ Test utilities

**What Doesn't Go Here:**
- ❌ Production code (goes in `src/`)
- ❌ Test results (goes in `build/test/` or `logs/`)

**Example Files:**
```
tests/unit/quantum/qutrit/state_test.cpp
tests/integration/test_quantum_classical.cpp
tests/property/prop_qutrit_reversibility.cpp
tests/algorithms/quantum/algo_evolution_v1.cpp
```

---

### `docs/` - Documentation

**Purpose:** All project documentation for users, developers, and researchers.

**Contains:**
- `api/` - Generated API documentation
- `design/` - Design documents
- `guides/` - User, developer, and contributor guides
- `theory/` - Theoretical foundations
- `architecture/` - Architecture diagrams

**What Goes Here:**
- ✅ User guides
- ✅ Developer guides
- ✅ API documentation
- ✅ Design documents
- ✅ Architecture diagrams
- ✅ Theoretical documentation

**What Doesn't Go Here:**
- ❌ Source code
- ❌ Test code
- ❌ Build artifacts

**Example Files:**
```
docs/MASTER_PLAN.md
docs/DIRECTORY_STRUCTURE.md
docs/design/QUANTUM_SUBSYSTEM_DESIGN.md
docs/guides/user/getting-started.md
docs/api/quantum/qutrit_state.md
```

---

### `scripts/` - Build and Utility Scripts

**Purpose:** Automation scripts for building, testing, deploying, and development tasks.

**Contains:**
- `build/` - Build scripts
- `test/` - Test execution scripts
- `deploy/` - Deployment scripts
- `dev/` - Development utilities
- `ci/` - CI/CD scripts

**What Goes Here:**
- ✅ Build automation scripts
- ✅ Test execution scripts
- ✅ Deployment scripts
- ✅ Development utilities
- ✅ CI/CD scripts

**What Doesn't Go Here:**
- ❌ Source code (goes in `src/`)
- ❌ System utilities (goes in `src/tools/`)

**Example Files:**
```
scripts/build/build-kernel.sh
scripts/test/run-unit-tests.sh
scripts/deploy/create-iso.sh
scripts/dev/validate-structure.sh
scripts/ci/ci-build.sh
```

---

### `tools/` - Development Tools

**Purpose:** Custom tools for UniversalOS development and debugging.

**Contains:**
- `algorithm-tester/` - Algorithm competition framework
- `quantum-debugger/` - Quantum state debugger
- `mwave-analyzer/` - M-Wave storage analyzer
- `performance-profiler/` - Performance profiling tool

**What Goes Here:**
- ✅ Development tools source code
- ✅ Debugging utilities
- ✅ Analysis tools
- ✅ Profiling tools

**What Doesn't Go Here:**
- ❌ System utilities (goes in `src/tools/`)
- ❌ Build scripts (goes in `scripts/`)

**Example:**
```
tools/algorithm-tester/main.py
tools/quantum-debugger/debugger.cpp
tools/mwave-analyzer/analyzer.jl
```

---

### `assets/` - Visual Assets

**Purpose:** Images, fonts, and icons for the desktop environment and branding.

**Contains:**
- `images/` - Images, logos, wallpapers
- `fonts/` - Font files
- `icons/` - Icon themes

**What Goes Here:**
- ✅ Images (PNG, JPG, SVG)
- ✅ Fonts (TTF, OTF)
- ✅ Icons (SVG, PNG)
- ✅ Wallpapers
- ✅ Logos and branding

**What Doesn't Go Here:**
- ❌ Code
- ❌ Documentation images (embed in docs or use relative paths)

**Example Files:**
```
assets/images/universalos-logo.png
assets/fonts/noto-sans/NotoSans-Regular.ttf
assets/icons/cutefish/file-manager.svg
assets/images/wallpapers/quantum-waves.jpg
```

---

### `logs/` - Logs and Debug Output

**Purpose:** Runtime logs and algorithm competition results.

**Contains:**
- `winners/` - Algorithm competition winners (tracked in Git)
- Other log directories (gitignored)

**What Goes Here:**
- ✅ Runtime logs
- ✅ Debug output
- ✅ Algorithm competition results (in `winners/`)

**What Doesn't Go Here:**
- ❌ Source code
- ❌ Build artifacts

**Note:** Most of `logs/` is gitignored except `logs/winners/` which tracks algorithm competition results.

**Example:**
```
logs/winners/qutrit-evolution/algo_v42_winner.md
logs/winners/mcginty-solvers/algo_fast_accurate_winner.md
logs/build/build-2026-04-30.log (gitignored)
logs/test/test-run-2026-04-30.log (gitignored)
```

## Source Code Directories

### `src/kernel/` - Linux Kernel Modifications

**Purpose:** Modifications to the Linux kernel for UniversalOS requirements.

**Subdirectories:**
- `arch/` - Architecture-specific code
- `drivers/` - Device drivers
- `fs/` - Filesystem code
- `mm/` - Memory management

**What Goes Here:**
- ✅ Linux kernel patches
- ✅ Custom kernel modules
- ✅ Kernel-level drivers

**Example:**
```
src/kernel/arch/x86/quantum_support.c
src/kernel/drivers/quantum/qutrit_device.c
src/kernel/mm/quantum_memory.c
```

---

### `src/helix/` - Helix Kernel Core

**Purpose:** Core Helix kernel functionality that manages quantum and classical computation.

**Subdirectories:**
- `core/` - Core Helix functionality
- `state/` - State management
- `scheduler/` - Helix scheduler
- `interface/` - Kernel interface

**What Goes Here:**
- ✅ Helix kernel implementation
- ✅ State management code
- ✅ Scheduling algorithms
- ✅ Kernel interfaces

**Example:**
```
src/helix/core/helix_init.rs
src/helix/scheduler/quantum_scheduler.rs
src/helix/state/state_manager.rs
```

---

### `src/quantum/` - Quantum Computing Components

**Purpose:** All quantum computing functionality that makes UniversalOS unique.

**Major Subsystems:**

#### `src/quantum/qutrit/` - Qutrit System
**Purpose:** 3-state quantum computing (0, 1, 2)

**Subdirectories:**
- `state/` - State representation
- `gates/` - Quantum gates
- `simulator/` - Simulation engine
- `hardware/` - Hardware abstraction

**What Goes Here:**
- ✅ Qutrit state management
- ✅ Quantum gate implementations
- ✅ Qutrit simulator
- ✅ Hardware interface

#### `src/quantum/mwave/` - McGinty M-Wave Storage
**Purpose:** Fractal-based storage using McGinty equation

**Subdirectories:**
- `equation/` - McGinty equation solver
- `fractal/` - Fractal analysis
- `encoder/` - Wave function encoder
- `filesystem/` - Filesystem integration

**What Goes Here:**
- ✅ McGinty equation implementation
- ✅ Fractal compression algorithms
- ✅ Wave function encoding
- ✅ Filesystem integration

#### `src/quantum/vacuum/` - Zero-Point Vacuum Interface
**Purpose:** Quantum randomness from vacuum fluctuations

**Subdirectories:**
- `sampling/` - Vacuum sampling
- `regularization/` - Regularization monitor
- `randomness/` - Randomness extraction
- `safety/` - Safety mechanisms

**What Goes Here:**
- ✅ Vacuum sampling code
- ✅ Regularization algorithms
- ✅ Randomness extraction
- ✅ Safety checks

#### `src/quantum/reversible/` - Reversible Computing
**Purpose:** Energy-efficient reversible computation

**Subdirectories:**
- `compiler/` - Reversible compiler
- `garbage/` - Garbage bit manager
- `profiler/` - Energy profiler
- `scheduler/` - Reversible scheduler

**What Goes Here:**
- ✅ Reversible compiler
- ✅ Garbage bit management
- ✅ Energy profiling
- ✅ Reversible scheduling

#### `src/quantum/deferred/` - Deferred Observation
**Purpose:** Quantum-classical boundary management

**Subdirectories:**
- `sandbox/` - Quantum isolation
- `projection/` - Projection operators
- `coherence/` - Coherence tracking
- `interface/` - Quantum-classical interface

**What Goes Here:**
- ✅ Quantum sandboxing
- ✅ Projection operators
- ✅ Coherence tracking
- ✅ Q-C interface

#### `src/quantum/hybrid/` - Hybrid Execution Engine
**Purpose:** Quantum-classical computation routing

**Subdirectories:**
- `router/` - Computation router
- `classical/` - Classical execution
- `quantum/` - Quantum execution
- `optimizer/` - Execution optimizer

**What Goes Here:**
- ✅ Computation routing
- ✅ Classical execution
- ✅ Quantum execution
- ✅ Optimization algorithms

---

### `src/desktop/` - Cutefish Desktop Environment

**Purpose:** Desktop environment components providing the user interface.

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

**What Goes Here:**
- ✅ Desktop shell implementation
- ✅ Panel and dock code
- ✅ Desktop applications
- ✅ Quantum Control Center

**Example:**
```
src/desktop/shell/main.cpp
src/desktop/panel/panel_widget.cpp
src/desktop/quantum-control/quantum_monitor.cpp
```

---

### `src/bootloader/` - Helix Boot Bootloader

**Purpose:** Custom bootloader with quantum state persistence.

**Subdirectories:**
- `uefi/` - UEFI implementation
- `graphics/` - Graphics rendering
- `menu/` - Boot menu
- `quantum/` - Quantum state persistence
- `recovery/` - Recovery mode

**What Goes Here:**
- ✅ UEFI bootloader code
- ✅ Boot graphics
- ✅ Boot menu
- ✅ Quantum state persistence
- ✅ Recovery mode

**Example:**
```
src/bootloader/uefi/boot_main.c
src/bootloader/quantum/state_persist.c
src/bootloader/menu/boot_menu.c
```

---

### `src/audio/` - 432Hz Audio System

**Purpose:** Audio system tuned to 432Hz harmonic frequency.

**Subdirectories:**
- `kernel/` - Kernel audio subsystem
- `alsa/` - ALSA modifications
- `pulse/` - PulseAudio integration
- `quantum/` - Quantum audio enhancement
- `midi/` - MIDI support

**What Goes Here:**
- ✅ Audio kernel code
- ✅ ALSA modifications
- ✅ PulseAudio integration
- ✅ Quantum audio enhancement
- ✅ MIDI support

**Example:**
```
src/audio/kernel/audio_driver.c
src/audio/alsa/alsa_432hz.c
src/audio/quantum/quantum_audio.cpp
```

---

### `src/tools/` - System Utilities

**Purpose:** Command-line tools for system management.

**Subdirectories:**
- `universalos-update/` - System update tool
- `universalos-rollback/` - Rollback tool
- `helix-boot-install/` - Bootloader installer
- `quantum-state/` - Quantum state manager
- `mwave-manager/` - M-Wave storage manager

**What Goes Here:**
- ✅ System administration tools
- ✅ Management utilities
- ✅ Command-line tools

**Example:**
```
src/tools/universalos-update/main.rs
src/tools/quantum-state/state_manager.cpp
src/tools/mwave-manager/manager.py
```

---

### `src/libs/` - Internal Libraries

**Purpose:** Reusable libraries for UniversalOS components.

**Subdirectories:**
- `libqutrit/` - Qutrit library
- `libmcginty/` - McGinty equation library
- `libvacuum/` - Vacuum interface library
- `libreversible/` - Reversible computing library
- `libhelix/` - Helix core library

**What Goes Here:**
- ✅ Shared library code
- ✅ Reusable components
- ✅ Common utilities

**Example:**
```
src/libs/libqutrit/qutrit_state.cpp
src/libs/libmcginty/equation_solver.jl
src/libs/libvacuum/vacuum_sampler.rs
```

## Test Directories

### `tests/unit/` - Unit Tests

**Purpose:** Unit tests that mirror the `src/` structure.

**Organization:** Mirrors `src/` directory structure exactly.

**What Goes Here:**
- ✅ Unit tests for individual functions/classes
- ✅ Tests for specific modules
- ✅ Fast, isolated tests

**Naming Convention:** `{source_name}_test.{ext}`

**Example:**
```
src/quantum/qutrit/state.cpp
tests/unit/quantum/qutrit/state_test.cpp
```

---

### `tests/integration/` - Integration Tests

**Purpose:** Tests for component interaction and integration.

**What Goes Here:**
- ✅ Tests for multiple components working together
- ✅ End-to-end tests
- ✅ System integration tests

**Naming Convention:** `test_{feature}.{ext}`

**Example:**
```
tests/integration/test_quantum_classical_integration.cpp
tests/integration/test_desktop_quantum_control.cpp
tests/integration/test_helix_boot_persistence.cpp
```

---

### `tests/property/` - Property-Based Tests

**Purpose:** Property-based tests for correctness properties.

**What Goes Here:**
- ✅ Property-based tests
- ✅ Correctness properties
- ✅ Invariant tests

**Naming Convention:** `prop_{feature}.{ext}`

**Example:**
```
tests/property/prop_qutrit_reversibility.cpp
tests/property/prop_mwave_conservation.cpp
tests/property/prop_vacuum_randomness.cpp
```

---

### `tests/algorithms/` - Algorithm Competition Tests

**Purpose:** Algorithm competition tests (12-300 algorithms per component).

**Organization:** Organized by component.

**What Goes Here:**
- ✅ Algorithm variants
- ✅ Performance benchmarks
- ✅ Algorithm comparisons

**Naming Convention:** `algo_{algorithm_name}.{ext}` or `algo_{algorithm_name}_v{version}.{ext}`

**Example:**
```
tests/algorithms/quantum/qutrit/algo_evolution_v1.cpp
tests/algorithms/quantum/qutrit/algo_evolution_v2.cpp
tests/algorithms/quantum/qutrit/algo_evolution_v3.cpp
...
tests/algorithms/quantum/qutrit/algo_evolution_v42.cpp (winner)
```

**Results:** Winners tracked in `logs/winners/{component}/`

---

### `tests/fixtures/` - Test Fixtures

**Purpose:** Test data and fixtures.

**What Goes Here:**
- ✅ Test data files
- ✅ Sample inputs
- ✅ Expected outputs
- ✅ Configuration files for tests

**Example:**
```
tests/fixtures/quantum/sample_qutrit_state.dat
tests/fixtures/mwave/sample_waveform.dat
tests/fixtures/config/test_config.toml
```

---

### `tests/mocks/` - Mock Objects

**Purpose:** Mock objects for testing.

**What Goes Here:**
- ✅ Mock implementations
- ✅ Stub objects
- ✅ Test doubles

**Example:**
```
tests/mocks/mock_quantum_hardware.cpp
tests/mocks/mock_filesystem.cpp
tests/mocks/mock_network.cpp
```

## Documentation Directories

### `docs/api/` - API Documentation

**Purpose:** Generated API documentation.

**Organization:** Organized by component.

**What Goes Here:**
- ✅ Generated API docs (Doxygen, rustdoc, etc.)
- ✅ API reference documentation
- ✅ Function/class documentation

**Example:**
```
docs/api/quantum/qutrit_state.md
docs/api/helix/scheduler.md
docs/api/desktop/shell_api.md
```

---

### `docs/design/` - Design Documents

**Purpose:** Design documents and architecture decisions.

**What Goes Here:**
- ✅ System design documents
- ✅ Architecture decisions
- ✅ Component designs

**Naming Convention:** `{COMPONENT}_DESIGN.md`

**Example:**
```
docs/design/IMMUTABLE_SYSTEM_DESIGN.md
docs/design/CUTEFISH_DESKTOP_DESIGN.md
docs/design/QUANTUM_SUBSYSTEM_DESIGN.md
docs/design/AUDIO_HARMONIC_DESIGN.md
```

---

### `docs/guides/` - User and Developer Guides

**Purpose:** Guides for different audiences.

**Subdirectories:**
- `user/` - User guides
- `developer/` - Developer guides
- `contributor/` - Contributor guides

**What Goes Here:**
- ✅ Getting started guides
- ✅ Installation guides
- ✅ Development guides
- ✅ Contribution guidelines

**Example:**
```
docs/guides/user/getting-started.md
docs/guides/user/installation-guide.md
docs/guides/developer/building-from-source.md
docs/guides/developer/FILE_NAMING_CONVENTIONS.md
docs/guides/contributor/contributing-guide.md
```

---

### `docs/theory/` - Theoretical Foundations

**Purpose:** Theoretical documentation and research.

**What Goes Here:**
- ✅ Quantum computing theory
- ✅ Fractal storage theory
- ✅ Vacuum physics
- ✅ Reversible computing theory

**Example:**
```
docs/theory/quantum-computing.md
docs/theory/fractal-storage.md
docs/theory/vacuum-physics.md
docs/theory/reversible-computing.md
```

---

### `docs/architecture/` - Architecture Diagrams

**Purpose:** Architecture diagrams and system overviews.

**What Goes Here:**
- ✅ System architecture diagrams
- ✅ Component diagrams
- ✅ Data flow diagrams
- ✅ Directory structure diagrams

**Example:**
```
docs/architecture/BOOTLOADER_AND_ARCHITECTURE.md
docs/architecture/DIRECTORY_STRUCTURE_DIAGRAM.md
docs/architecture/system-overview.svg
docs/architecture/quantum-subsystem.svg
```

## Support Directories

### `scripts/build/` - Build Scripts

**Purpose:** Scripts for building different components.

**What Goes Here:**
- ✅ Component build scripts
- ✅ Full system build scripts
- ✅ Build automation

**Example:**
```
scripts/build/build-kernel.sh
scripts/build/build-helix.sh
scripts/build/build-desktop.sh
scripts/build/build-all.sh
```

---

### `scripts/test/` - Test Scripts

**Purpose:** Scripts for running tests.

**What Goes Here:**
- ✅ Test execution scripts
- ✅ Test suite runners
- ✅ Test automation

**Example:**
```
scripts/test/run-unit-tests.sh
scripts/test/run-integration-tests.sh
scripts/test/run-property-tests.sh
scripts/test/run-algorithm-tests.sh
```

---

### `scripts/deploy/` - Deployment Scripts

**Purpose:** Scripts for deployment and packaging.

**What Goes Here:**
- ✅ ISO creation scripts
- ✅ OSTree deployment scripts
- ✅ Package creation scripts

**Example:**
```
scripts/deploy/create-iso.sh
scripts/deploy/deploy-ostree.sh
scripts/deploy/package-release.sh
```

---

### `scripts/dev/` - Development Utilities

**Purpose:** Development utilities and helper scripts.

**What Goes Here:**
- ✅ Development environment setup
- ✅ Code formatting scripts
- ✅ Validation scripts
- ✅ Development helpers

**Example:**
```
scripts/dev/setup-dev-env.sh
scripts/dev/format-code.sh
scripts/dev/validate-structure.sh
scripts/dev/validate-structure.ps1
```

---

### `scripts/ci/` - CI/CD Scripts

**Purpose:** Continuous integration and deployment scripts.

**What Goes Here:**
- ✅ CI build scripts
- ✅ CI test scripts
- ✅ CI deployment scripts

**Example:**
```
scripts/ci/ci-build.sh
scripts/ci/ci-test.sh
scripts/ci/ci-deploy.sh
```

## Quick Decision Guide

### "Where should I put...?"

#### Source Code
```
New quantum component?
  → src/quantum/{component}/

New desktop feature?
  → src/desktop/{feature}/

New system utility?
  → src/tools/{utility}/

New internal library?
  → src/libs/lib{name}/

Kernel modification?
  → src/kernel/{subsystem}/

Helix kernel code?
  → src/helix/{subsystem}/
```

#### Tests
```
Unit test for existing code?
  → tests/unit/{mirror src structure}/{source}_test.{ext}

Integration test?
  → tests/integration/test_{feature}.{ext}

Property-based test?
  → tests/property/prop_{feature}.{ext}

Algorithm variant?
  → tests/algorithms/{component}/algo_{name}_v{N}.{ext}

Test data?
  → tests/fixtures/{component}/

Mock object?
  → tests/mocks/mock_{object}.{ext}
```

#### Documentation
```
User guide?
  → docs/guides/user/{topic}.md

Developer guide?
  → docs/guides/developer/{topic}.md

Design document?
  → docs/design/{COMPONENT}_DESIGN.md

API documentation?
  → docs/api/{component}/{module}.md

Theoretical documentation?
  → docs/theory/{topic}.md

Architecture diagram?
  → docs/architecture/{diagram}.{svg|md}

Top-level documentation?
  → docs/{DOCUMENT}.md or root/{DOCUMENT}.md
```

#### Scripts
```
Build script?
  → scripts/build/{script}.sh

Test script?
  → scripts/test/{script}.sh

Deployment script?
  → scripts/deploy/{script}.sh

Development utility?
  → scripts/dev/{script}.sh

CI/CD script?
  → scripts/ci/{script}.sh
```

#### Assets
```
Image or logo?
  → assets/images/{name}.{png|jpg|svg}

Wallpaper?
  → assets/images/wallpapers/{name}.jpg

Font?
  → assets/fonts/{font-family}/{font-file}.ttf

Icon?
  → assets/icons/{theme}/{icon-name}.svg
```

#### Other
```
Third-party library?
  → lib/{library}/

Build output?
  → build/{debug|release|test}/
  (automatically created, gitignored)

Log file?
  → logs/{category}/
  (gitignored except logs/winners/)

Algorithm winner?
  → logs/winners/{component}/{winner}.md
  (tracked in Git)

Kiro spec?
  → .kiro/specs/{phase}/{feature}/

Kiro steering rule?
  → .kiro/steering/{rule}.md

Configuration file?
  → Root directory or .kiro/settings/
```

## Common Mistakes

### ❌ Wrong Directory Choices

**Mistake:** Putting tests in `src/`
```
❌ src/quantum/qutrit/state_test.cpp
✅ tests/unit/quantum/qutrit/state_test.cpp
```

**Mistake:** Putting public headers in `src/`
```
❌ src/quantum/qutrit/qutrit_state.hpp (if public API)
✅ include/quantum/qutrit_state.hpp
✅ src/quantum/qutrit/state.hpp (if private)
```

**Mistake:** Putting build outputs in `src/`
```
❌ src/quantum/qutrit/state.o
✅ build/debug/quantum/qutrit/state.o
```

**Mistake:** Putting system utilities in `tools/`
```
❌ tools/universalos-update/
✅ src/tools/universalos-update/
```

**Mistake:** Putting development tools in `src/tools/`
```
❌ src/tools/algorithm-tester/
✅ tools/algorithm-tester/
```

**Mistake:** Putting documentation in `src/`
```
❌ src/quantum/QUANTUM_DESIGN.md
✅ docs/design/QUANTUM_SUBSYSTEM_DESIGN.md
✅ src/quantum/README.md (component overview only)
```

## Summary

### Key Principles

1. **Separation of Concerns**
   - Source code in `src/`
   - Tests in `tests/`
   - Documentation in `docs/`
   - Build outputs in `build/`

2. **Mirroring Structure**
   - `tests/unit/` mirrors `src/`
   - `include/` mirrors major components in `src/`
   - `docs/api/` mirrors components

3. **Clear Purpose**
   - Each directory has a specific purpose
   - Don't mix different types of content
   - Follow the established patterns

4. **Consistency**
   - Use the same patterns throughout
   - Follow naming conventions
   - Maintain the hierarchy

### Quick Reference Table

| Content Type | Directory | Example |
|--------------|-----------|---------|
| Source code | `src/{component}/` | `src/quantum/qutrit/state.cpp` |
| Public headers | `include/{component}/` | `include/quantum/qutrit_state.hpp` |
| Unit tests | `tests/unit/{component}/` | `tests/unit/quantum/qutrit/state_test.cpp` |
| Integration tests | `tests/integration/` | `tests/integration/test_quantum_classical.cpp` |
| Property tests | `tests/property/` | `tests/property/prop_qutrit_reversibility.cpp` |
| Algorithm tests | `tests/algorithms/{component}/` | `tests/algorithms/quantum/algo_evolution_v1.cpp` |
| User docs | `docs/guides/user/` | `docs/guides/user/getting-started.md` |
| Developer docs | `docs/guides/developer/` | `docs/guides/developer/building-from-source.md` |
| Design docs | `docs/design/` | `docs/design/QUANTUM_SUBSYSTEM_DESIGN.md` |
| API docs | `docs/api/{component}/` | `docs/api/quantum/qutrit_state.md` |
| Build scripts | `scripts/build/` | `scripts/build/build-kernel.sh` |
| Test scripts | `scripts/test/` | `scripts/test/run-unit-tests.sh` |
| Dev tools | `tools/{tool}/` | `tools/algorithm-tester/main.py` |
| System tools | `src/tools/{tool}/` | `src/tools/universalos-update/main.rs` |
| Images | `assets/images/` | `assets/images/universalos-logo.png` |
| Fonts | `assets/fonts/` | `assets/fonts/noto-sans/NotoSans-Regular.ttf` |
| Icons | `assets/icons/{theme}/` | `assets/icons/cutefish/file-manager.svg` |
| Third-party libs | `lib/{library}/` | `lib/eigen/` |
| Build outputs | `build/{type}/` | `build/release/quantum/libqutrit.so` |
| Logs | `logs/{category}/` | `logs/winners/qutrit-evolution/winner.md` |
| Kiro specs | `.kiro/specs/{phase}/` | `.kiro/specs/3-qutrit-computing/design.md` |

---

**See Also:**
- [Directory Structure Documentation](../../DIRECTORY_STRUCTURE.md)
- [File Naming Conventions](FILE_NAMING_CONVENTIONS.md)
- [Directory Structure Diagram](../../architecture/DIRECTORY_STRUCTURE_DIAGRAM.md)

**Last Updated:** 2026-04-30  
**Version:** 1.0  
**Maintainer:** UniversalOS Development Team
