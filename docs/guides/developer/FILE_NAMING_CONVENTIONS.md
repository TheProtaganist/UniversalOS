# UniversalOS File Naming Conventions

## Overview

This document defines the file naming conventions for UniversalOS. Consistent naming makes the codebase easier to navigate, understand, and maintain.

## Table of Contents

1. [General Principles](#general-principles)
2. [Source Files](#source-files)
3. [Test Files](#test-files)
4. [Documentation Files](#documentation-files)
5. [Script Files](#script-files)
6. [Configuration Files](#configuration-files)
7. [Asset Files](#asset-files)
8. [Examples](#examples)

## General Principles

### Consistency
- Use the same naming convention within each category
- Follow language-specific conventions where applicable
- Be consistent across the entire codebase

### Clarity
- Names should be descriptive and self-explanatory
- Avoid abbreviations unless widely understood
- Use full words when possible

### Simplicity
- Keep names concise but meaningful
- Avoid overly long names (max 50 characters recommended)
- Use underscores or hyphens for readability

### Language Conventions
- Follow the dominant convention for each language
- C/C++: `snake_case`
- Rust: `snake_case`
- Python: `snake_case`
- Julia: `snake_case`
- Shell scripts: `kebab-case`

## Source Files

### C Files

**Format:** `snake_case.c`

**Rules:**
- All lowercase
- Words separated by underscores
- Descriptive of module functionality
- No abbreviations unless standard (e.g., `io`, `fs`)

**Examples:**
```
✅ quantum_state.c
✅ helix_scheduler.c
✅ mwave_encoder.c
✅ vacuum_sampler.c

❌ QuantumState.c          (wrong case)
❌ quantum-state.c         (wrong separator)
❌ qstate.c                (too abbreviated)
❌ quantum_state_manager_implementation.c  (too long)
```

### C++ Files

**Format:** `snake_case.cpp` (implementation), `snake_case.hpp` (header)

**Rules:**
- Same as C files
- Use `.cpp` for implementation
- Use `.hpp` for headers (or `.h` for C-compatible headers)
- Header and implementation should have matching names

**Examples:**
```
✅ qutrit_simulator.cpp / qutrit_simulator.hpp
✅ reversible_compiler.cpp / reversible_compiler.hpp
✅ desktop_shell.cpp / desktop_shell.hpp

❌ QutritSimulator.cpp     (wrong case)
❌ qutrit-simulator.cpp    (wrong separator)
❌ qutrit_sim.cpp          (too abbreviated)
```

### Rust Files

**Format:** `snake_case.rs`

**Rules:**
- All lowercase
- Words separated by underscores
- Follow Rust naming conventions
- Module names match file names

**Examples:**
```
✅ vacuum_interface.rs
✅ deferred_observation.rs
✅ hybrid_router.rs

❌ VacuumInterface.rs      (wrong case)
❌ vacuum-interface.rs     (wrong separator)
❌ vac_int.rs              (too abbreviated)
```

### Python Files

**Format:** `snake_case.py`

**Rules:**
- All lowercase
- Words separated by underscores
- Follow PEP 8 conventions
- Module names should be short but descriptive

**Examples:**
```
✅ algorithm_tester.py
✅ quantum_debugger.py
✅ mwave_analyzer.py

❌ AlgorithmTester.py      (wrong case)
❌ algorithm-tester.py     (wrong separator)
❌ algo_test.py            (too abbreviated)
```

### Julia Files

**Format:** `snake_case.jl`

**Rules:**
- All lowercase
- Words separated by underscores
- Follow Julia conventions
- Module names match file names

**Examples:**
```
✅ mcginty_solver.jl
✅ fractal_analyzer.jl
✅ performance_profiler.jl

❌ McGintySolver.jl        (wrong case)
❌ mcginty-solver.jl       (wrong separator)
❌ mcg_solve.jl            (too abbreviated)
```

## Test Files

### Unit Test Files

**Format:** `{source_name}_test.{ext}`

**Rules:**
- Match source file name exactly
- Append `_test` suffix
- Use same extension as source file
- Located in `tests/unit/` mirroring `src/` structure

**Examples:**
```
Source: src/quantum/qutrit/state.cpp
Test:   tests/unit/quantum/qutrit/state_test.cpp

Source: src/helix/scheduler.rs
Test:   tests/unit/helix/scheduler_test.rs

Source: src/tools/algorithm_tester.py
Test:   tests/unit/tools/algorithm_tester_test.py

✅ quantum_state_test.cpp
✅ helix_scheduler_test.rs
✅ mwave_encoder_test.cpp

❌ test_quantum_state.cpp  (wrong prefix)
❌ quantum_state.test.cpp  (wrong separator)
❌ QuantumStateTest.cpp    (wrong case)
```

### Integration Test Files

**Format:** `test_{feature}.{ext}`

**Rules:**
- Start with `test_` prefix
- Describe the integration being tested
- Use snake_case
- Located in `tests/integration/`

**Examples:**
```
✅ test_quantum_classical_integration.cpp
✅ test_desktop_quantum_control.cpp
✅ test_helix_boot_persistence.cpp
✅ test_mwave_filesystem.cpp

❌ quantum_classical_integration_test.cpp  (wrong format)
❌ test-quantum-classical.cpp              (wrong separator)
❌ TestQuantumClassical.cpp                (wrong case)
```

### Property-Based Test Files

**Format:** `prop_{feature}.{ext}`

**Rules:**
- Start with `prop_` prefix
- Describe the property being tested
- Use snake_case
- Located in `tests/property/`

**Examples:**
```
✅ prop_qutrit_reversibility.cpp
✅ prop_mwave_conservation.cpp
✅ prop_vacuum_randomness.cpp
✅ prop_helix_determinism.cpp

❌ qutrit_reversibility_prop.cpp  (wrong format)
❌ prop-qutrit-reversibility.cpp  (wrong separator)
❌ PropQutritReversibility.cpp    (wrong case)
```

### Algorithm Test Files

**Format:** `algo_{algorithm_name}.{ext}` or `algo_{algorithm_name}_v{version}.{ext}`

**Rules:**
- Start with `algo_` prefix
- Descriptive algorithm name
- Optional version suffix for variants
- Use snake_case
- Located in `tests/algorithms/{component}/`

**Examples:**
```
✅ algo_qutrit_evolution.cpp
✅ algo_qutrit_evolution_v1.cpp
✅ algo_qutrit_evolution_v2.cpp
✅ algo_mcginty_solver_fast.jl
✅ algo_mcginty_solver_accurate.jl
✅ algo_vacuum_sampler_optimized.rs

❌ qutrit_evolution_algo.cpp      (wrong format)
❌ algo-qutrit-evolution.cpp      (wrong separator)
❌ AlgoQutritEvolution.cpp        (wrong case)
```

## Documentation Files

### Top-Level Documentation

**Format:** `UPPERCASE_WITH_UNDERSCORES.md`

**Rules:**
- All uppercase
- Words separated by underscores
- Located in project root or `docs/`
- Reserved for major documentation

**Examples:**
```
✅ README.md
✅ CONTRIBUTING.md
✅ CODE_OF_CONDUCT.md
✅ CHANGELOG.md
✅ LICENSE
✅ MASTER_PLAN.md
✅ SPEC_ROADMAP.md
✅ PROJECT_SUMMARY.md

❌ readme.md               (wrong case)
❌ contributing.md         (wrong case)
❌ master-plan.md          (wrong case)
```

### Subdirectory Documentation

**Format:** `lowercase-with-dashes.md` or `COMPONENT_NAME.md`

**Rules:**
- Lowercase with dashes for general docs
- UPPERCASE for component-specific docs
- Descriptive of content
- Located in `docs/` subdirectories

**Examples:**
```
✅ getting-started.md
✅ installation-guide.md
✅ api-reference.md
✅ IMMUTABLE_SYSTEM_DESIGN.md
✅ CUTEFISH_DESKTOP_DESIGN.md
✅ AUDIO_HARMONIC_DESIGN.md

❌ GettingStarted.md       (wrong case)
❌ getting_started.md      (wrong separator for general docs)
❌ immutable-system-design.md  (should be uppercase for design docs)
```

### Design Documents

**Format:** `{COMPONENT}_DESIGN.md`

**Rules:**
- Component name in uppercase
- Suffix with `_DESIGN`
- Located in `docs/design/`

**Examples:**
```
✅ IMMUTABLE_SYSTEM_DESIGN.md
✅ CUTEFISH_DESKTOP_DESIGN.md
✅ BOOTLOADER_AND_ARCHITECTURE.md
✅ AUDIO_HARMONIC_DESIGN.md
✅ QUANTUM_SUBSYSTEM_DESIGN.md

❌ immutable-system-design.md  (wrong case)
❌ ImmutableSystemDesign.md    (wrong format)
❌ design_immutable_system.md  (wrong order)
```

### API Documentation

**Format:** `{module}.md` or `{class}.md`

**Rules:**
- Match source file/class name
- Lowercase with underscores or dashes
- Located in `docs/api/{component}/`
- Often auto-generated

**Examples:**
```
✅ quantum_state.md
✅ helix_scheduler.md
✅ qutrit_simulator.md

❌ QuantumState.md         (wrong case)
❌ quantum-state-api.md    (unnecessary suffix)
```

## Script Files

### Shell Scripts

**Format:** `kebab-case.sh` or `kebab-case.bash`

**Rules:**
- All lowercase
- Words separated by hyphens
- Extension `.sh` or `.bash`
- Executable permission (755)
- Located in `scripts/` subdirectories

**Examples:**
```
✅ build-kernel.sh
✅ run-unit-tests.sh
✅ validate-structure.sh
✅ create-iso.sh
✅ setup-dev-env.sh

❌ build_kernel.sh         (wrong separator)
❌ BuildKernel.sh          (wrong case)
❌ buildkernel.sh          (missing separator)
❌ build-kernel            (missing extension)
```

### PowerShell Scripts

**Format:** `kebab-case.ps1`

**Rules:**
- All lowercase
- Words separated by hyphens
- Extension `.ps1`
- Located in `scripts/` subdirectories

**Examples:**
```
✅ build-all.ps1
✅ validate-structure.ps1
✅ run-tests.ps1

❌ build_all.ps1           (wrong separator)
❌ BuildAll.ps1            (wrong case)
❌ buildall.ps1            (missing separator)
```

### Python Scripts

**Format:** `snake_case.py`

**Rules:**
- All lowercase
- Words separated by underscores
- Extension `.py`
- Follow PEP 8 conventions
- Executable if used as script

**Examples:**
```
✅ algorithm_tester.py
✅ generate_docs.py
✅ run_benchmarks.py

❌ algorithm-tester.py     (wrong separator)
❌ AlgorithmTester.py      (wrong case)
❌ algorithmtester.py      (missing separator)
```

### Executable Tools (No Extension)

**Format:** `kebab-case` (no extension)

**Rules:**
- All lowercase
- Words separated by hyphens
- No file extension
- Executable permission (755)
- Located in `src/tools/` or installed to system

**Examples:**
```
✅ universalos-update
✅ universalos-rollback
✅ helix-boot-install
✅ quantum-state
✅ mwave-manager

❌ universalos_update      (wrong separator)
❌ UniversalOSUpdate       (wrong case)
❌ universalosupdate       (missing separator)
❌ universalos-update.sh   (should not have extension)
```

## Configuration Files

### Build Configuration

**Format:** Varies by tool

**Rules:**
- Follow tool conventions
- Typically in project root

**Examples:**
```
✅ Makefile                (standard name)
✅ CMakeLists.txt          (standard name)
✅ Cargo.toml              (standard name)
✅ pyproject.toml          (standard name)
✅ package.json            (standard name)

❌ makefile                (wrong case for Makefile)
❌ cmake.txt               (wrong name)
❌ cargo.toml              (wrong case)
```

### Git Configuration

**Format:** Standard Git names

**Examples:**
```
✅ .gitignore
✅ .gitattributes
✅ .gitmodules

❌ gitignore               (missing dot)
❌ .git-ignore             (wrong format)
```

### Kiro Configuration

**Format:** Standard Kiro names

**Examples:**
```
✅ .kiro/specs/
✅ .kiro/steering/
✅ .kiro/settings/

❌ kiro/                   (missing dot)
❌ .kiro-config/           (wrong format)
```

## Asset Files

### Images

**Format:** `kebab-case.{ext}`

**Rules:**
- All lowercase
- Words separated by hyphens
- Standard image extensions (png, jpg, svg, etc.)
- Located in `assets/images/`

**Examples:**
```
✅ universalos-logo.png
✅ quantum-icon.svg
✅ desktop-wallpaper.jpg
✅ boot-splash.png

❌ UniversalOSLogo.png     (wrong case)
❌ universalos_logo.png    (wrong separator)
❌ logo.png                (not descriptive enough)
```

### Fonts

**Format:** Varies by font

**Rules:**
- Follow font naming conventions
- Located in `assets/fonts/{font-family}/`

**Examples:**
```
✅ NotoSans-Regular.ttf
✅ FiraCode-Bold.ttf
✅ JetBrainsMono-Italic.ttf

(Font names typically use PascalCase - this is acceptable)
```

### Icons

**Format:** `kebab-case.{ext}`

**Rules:**
- All lowercase
- Words separated by hyphens
- Standard icon extensions (svg, png)
- Located in `assets/icons/{theme}/`

**Examples:**
```
✅ file-manager.svg
✅ quantum-control.svg
✅ system-settings.svg

❌ FileManager.svg         (wrong case)
❌ file_manager.svg        (wrong separator)
```

## Examples

### Complete Component Example

```
src/quantum/qutrit/
├── state.cpp                      [Implementation]
├── state.hpp                      [Header]
├── gates.cpp
├── gates.hpp
├── simulator.cpp
├── simulator.hpp
└── README.md

include/quantum/
├── qutrit_state.hpp               [Public header]
├── qutrit_gates.hpp
└── qutrit_simulator.hpp

tests/unit/quantum/qutrit/
├── state_test.cpp                 [Unit test]
├── gates_test.cpp
└── simulator_test.cpp

tests/property/quantum/
├── prop_qutrit_reversibility.cpp  [Property test]
└── prop_qutrit_unitarity.cpp

tests/algorithms/quantum/qutrit/
├── algo_evolution_v1.cpp          [Algorithm variant 1]
├── algo_evolution_v2.cpp          [Algorithm variant 2]
├── algo_evolution_v3.cpp          [Algorithm variant 3]
└── ...                            [12-300 variants]

docs/api/quantum/
├── qutrit_state.md                [API documentation]
├── qutrit_gates.md
└── qutrit_simulator.md

docs/design/
└── QUANTUM_SUBSYSTEM_DESIGN.md    [Design document]
```

### Script Examples

```
scripts/build/
├── build-kernel.sh                [Build script]
├── build-helix.sh
├── build-desktop.sh
└── build-all.sh

scripts/test/
├── run-unit-tests.sh              [Test script]
├── run-integration-tests.sh
├── run-property-tests.sh
└── run-algorithm-tests.sh

scripts/dev/
├── setup-dev-env.sh               [Dev utility]
├── format-code.sh
├── validate-structure.sh
└── validate-structure.ps1         [PowerShell version]
```

### Documentation Examples

```
docs/
├── README.md                      [Top-level doc]
├── MASTER_PLAN.md
├── SPEC_ROADMAP.md
├── PROJECT_SUMMARY.md
├── DIRECTORY_STRUCTURE.md
│
├── design/
│   ├── IMMUTABLE_SYSTEM_DESIGN.md
│   ├── CUTEFISH_DESKTOP_DESIGN.md
│   ├── AUDIO_HARMONIC_DESIGN.md
│   └── README.md
│
├── guides/
│   ├── user/
│   │   ├── getting-started.md
│   │   ├── installation-guide.md
│   │   └── README.md
│   ├── developer/
│   │   ├── building-from-source.md
│   │   ├── coding-standards.md
│   │   ├── FILE_NAMING_CONVENTIONS.md
│   │   └── README.md
│   └── contributor/
│       ├── contributing-guide.md
│       └── README.md
│
└── api/
    ├── quantum/
    │   ├── qutrit_state.md
    │   └── qutrit_gates.md
    └── helix/
        └── scheduler.md
```

## Quick Reference

### By File Type

| File Type | Convention | Example |
|-----------|------------|---------|
| C source | `snake_case.c` | `quantum_state.c` |
| C++ source | `snake_case.cpp` | `qutrit_simulator.cpp` |
| C++ header | `snake_case.hpp` | `qutrit_simulator.hpp` |
| Rust source | `snake_case.rs` | `vacuum_interface.rs` |
| Python source | `snake_case.py` | `algorithm_tester.py` |
| Julia source | `snake_case.jl` | `mcginty_solver.jl` |
| Unit test | `{source}_test.{ext}` | `quantum_state_test.cpp` |
| Integration test | `test_{feature}.{ext}` | `test_quantum_classical.cpp` |
| Property test | `prop_{feature}.{ext}` | `prop_qutrit_reversibility.cpp` |
| Algorithm test | `algo_{name}.{ext}` | `algo_evolution_v1.cpp` |
| Shell script | `kebab-case.sh` | `build-kernel.sh` |
| PowerShell script | `kebab-case.ps1` | `validate-structure.ps1` |
| Executable tool | `kebab-case` | `universalos-update` |
| Top-level doc | `UPPERCASE_UNDERSCORES.md` | `README.md` |
| Subdirectory doc | `lowercase-dashes.md` | `getting-started.md` |
| Design doc | `{COMPONENT}_DESIGN.md` | `QUANTUM_SUBSYSTEM_DESIGN.md` |
| Image | `kebab-case.{ext}` | `universalos-logo.png` |
| Icon | `kebab-case.{ext}` | `file-manager.svg` |

### By Convention Type

| Convention | Use Case | Example |
|------------|----------|---------|
| `snake_case` | C/C++/Rust/Python/Julia source | `quantum_state.cpp` |
| `kebab-case` | Scripts, executables, images | `build-kernel.sh` |
| `UPPERCASE_UNDERSCORES` | Top-level documentation | `README.md` |
| `lowercase-dashes` | Subdirectory documentation | `getting-started.md` |
| `{source}_test` | Unit tests | `quantum_state_test.cpp` |
| `test_{feature}` | Integration tests | `test_quantum_classical.cpp` |
| `prop_{feature}` | Property tests | `prop_qutrit_reversibility.cpp` |
| `algo_{name}` | Algorithm tests | `algo_evolution_v1.cpp` |

## Common Mistakes

### ❌ Wrong Case
```
❌ QuantumState.cpp        → ✅ quantum_state.cpp
❌ Helix-Scheduler.rs      → ✅ helix_scheduler.rs
❌ mWaveEncoder.cpp        → ✅ mwave_encoder.cpp
```

### ❌ Wrong Separator
```
❌ quantum-state.cpp       → ✅ quantum_state.cpp
❌ build_kernel.sh         → ✅ build-kernel.sh
❌ test-quantum-state.cpp  → ✅ quantum_state_test.cpp
```

### ❌ Wrong Format
```
❌ test_quantum_state.cpp  → ✅ quantum_state_test.cpp
❌ quantum_state.test.cpp  → ✅ quantum_state_test.cpp
❌ readme.md               → ✅ README.md
❌ contributing.md         → ✅ CONTRIBUTING.md
```

### ❌ Too Abbreviated
```
❌ qstate.cpp              → ✅ quantum_state.cpp
❌ hlx_sched.rs            → ✅ helix_scheduler.rs
❌ mw_enc.cpp              → ✅ mwave_encoder.cpp
```

### ❌ Too Long
```
❌ quantum_state_manager_implementation.cpp
   → ✅ quantum_state.cpp

❌ helix_scheduler_with_quantum_support.rs
   → ✅ helix_scheduler.rs
```

## Validation

### Automated Checks

The validation script checks for naming convention violations:

```bash
./scripts/dev/validate-structure.sh
```

### Manual Checks

Before committing, verify:
- [ ] Source files use `snake_case`
- [ ] Scripts use `kebab-case`
- [ ] Tests follow `{source}_test` pattern
- [ ] Documentation follows appropriate convention
- [ ] No mixed conventions in same directory
- [ ] Names are descriptive and not abbreviated

## Summary

**Key Principles:**
- ✅ **Consistency** - Same convention within each category
- ✅ **Clarity** - Descriptive, self-explanatory names
- ✅ **Simplicity** - Concise but meaningful
- ✅ **Language Conventions** - Follow language standards

**Main Conventions:**
- `snake_case` for source code (C/C++/Rust/Python/Julia)
- `kebab-case` for scripts and executables
- `UPPERCASE_UNDERSCORES` for top-level documentation
- `lowercase-dashes` for subdirectory documentation
- `{source}_test` for unit tests

---

**See Also:**
- [Directory Structure Documentation](../../DIRECTORY_STRUCTURE.md)
- [Coding Standards](coding-standards.md)
- [Contributing Guide](../../CONTRIBUTING.md)

**Last Updated:** 2026-04-30  
**Version:** 1.0  
**Maintainer:** UniversalOS Development Team
