# UniversalOS Directory Structure Diagram

## Visual Overview

This document provides visual diagrams of the UniversalOS directory structure.

## Complete Structure Diagram

```
UniversalOS/
│
├─── Configuration & Metadata
│    ├── .git/                     [Git repository]
│    ├── .gitignore                [Git ignore rules]
│    ├── .gitattributes            [Git attributes]
│    ├── README.md                 [Project overview]
│    ├── LICENSE                   [MIT License]
│    ├── CONTRIBUTING.md           [Contribution guidelines]
│    ├── CODE_OF_CONDUCT.md        [Code of conduct]
│    ├── CHANGELOG.md              [Version history]
│    ├── Makefile                  [Main Makefile]
│    ├── CMakeLists.txt            [CMake configuration]
│    ├── Cargo.toml                [Rust workspace]
│    └── pyproject.toml            [Python project]
│
├─── AI Configuration (.kiro/)
│    ├── specs/                    [Feature specifications]
│    │   ├── 0-foundation/         [Foundation specs]
│    │   ├── 1-arch-linux/         [Arch Linux base]
│    │   ├── 2-helix-kernel/       [Helix kernel]
│    │   ├── 3-qutrit-computing/   [Qutrit system]
│    │   ├── 4-mwave-storage/      [M-Wave storage]
│    │   ├── 5-vacuum-interface/   [Vacuum interface]
│    │   ├── 6-deferred-observation/ [Deferred observation]
│    │   ├── 7-reversible-computing/ [Reversible computing]
│    │   ├── 8-algorithm-library/  [Algorithm library]
│    │   ├── 9-integration-testing/ [Integration tests]
│    │   └── 10-ui-tools/          [UI and tools]
│    ├── steering/                 [AI steering rules]
│    └── settings/                 [Kiro settings]
│
├─── Source Code (src/)
│    ├── kernel/                   [Linux kernel mods]
│    │   ├── arch/                 [Architecture code]
│    │   ├── drivers/              [Device drivers]
│    │   ├── fs/                   [Filesystem]
│    │   └── mm/                   [Memory management]
│    │
│    ├── helix/                    [Helix kernel core]
│    │   ├── core/                 [Core functionality]
│    │   ├── state/                [State management]
│    │   ├── scheduler/            [Helix scheduler]
│    │   └── interface/            [Kernel interface]
│    │
│    ├── quantum/                  [Quantum components]
│    │   ├── qutrit/               [3-state quantum]
│    │   │   ├── state/
│    │   │   ├── gates/
│    │   │   ├── simulator/
│    │   │   └── hardware/
│    │   ├── mwave/                [Fractal storage]
│    │   │   ├── equation/
│    │   │   ├── fractal/
│    │   │   ├── encoder/
│    │   │   └── filesystem/
│    │   ├── vacuum/               [Quantum randomness]
│    │   │   ├── sampling/
│    │   │   ├── regularization/
│    │   │   ├── randomness/
│    │   │   └── safety/
│    │   ├── reversible/           [Energy-efficient]
│    │   │   ├── compiler/
│    │   │   ├── garbage/
│    │   │   ├── profiler/
│    │   │   └── scheduler/
│    │   ├── deferred/             [Q-C boundary]
│    │   │   ├── sandbox/
│    │   │   ├── projection/
│    │   │   ├── coherence/
│    │   │   └── interface/
│    │   └── hybrid/               [Q-C routing]
│    │       ├── router/
│    │       ├── classical/
│    │       ├── quantum/
│    │       └── optimizer/
│    │
│    ├── desktop/                  [Cutefish DE]
│    │   ├── shell/
│    │   ├── panel/
│    │   ├── dock/
│    │   ├── menu/
│    │   ├── settings/
│    │   ├── filemanager/
│    │   ├── terminal/
│    │   ├── texteditor/
│    │   └── quantum-control/
│    │
│    ├── bootloader/               [Helix Boot]
│    │   ├── uefi/
│    │   ├── graphics/
│    │   ├── menu/
│    │   ├── quantum/
│    │   └── recovery/
│    │
│    ├── audio/                    [432Hz audio]
│    │   ├── kernel/
│    │   ├── alsa/
│    │   ├── pulse/
│    │   ├── quantum/
│    │   └── midi/
│    │
│    ├── tools/                    [System utilities]
│    │   ├── universalos-update/
│    │   ├── universalos-rollback/
│    │   ├── helix-boot-install/
│    │   ├── quantum-state/
│    │   └── mwave-manager/
│    │
│    └── libs/                     [Internal libraries]
│        ├── libqutrit/
│        ├── libmcginty/
│        ├── libvacuum/
│        ├── libreversible/
│        └── libhelix/
│
├─── Public Headers (include/)
│    ├── helix/
│    ├── quantum/
│    ├── desktop/
│    └── audio/
│
├─── Third-Party (lib/)
│    └── [External dependencies]
│
├─── Build Outputs (build/) [GITIGNORED]
│    ├── debug/
│    ├── release/
│    ├── test/
│    ├── coverage/
│    └── docs/
│
├─── Tests (tests/)
│    ├── unit/                     [Mirrors src/]
│    │   ├── quantum/
│    │   ├── desktop/
│    │   ├── bootloader/
│    │   └── audio/
│    ├── integration/              [Component interaction]
│    ├── property/                 [Correctness properties]
│    ├── algorithms/               [12-300 algorithms]
│    ├── fixtures/                 [Test data]
│    └── mocks/                    [Mock objects]
│
├─── Documentation (docs/)
│    ├── api/                      [Generated API docs]
│    │   ├── helix/
│    │   ├── quantum/
│    │   ├── desktop/
│    │   ├── bootloader/
│    │   ├── audio/
│    │   ├── kernel/
│    │   └── libs/
│    ├── design/                   [Design documents]
│    ├── guides/                   [User/dev guides]
│    │   ├── user/
│    │   ├── developer/
│    │   └── contributor/
│    ├── theory/                   [Theoretical foundations]
│    └── architecture/             [Architecture diagrams]
│
├─── Scripts (scripts/)
│    ├── build/                    [Build scripts]
│    ├── test/                     [Test scripts]
│    ├── deploy/                   [Deployment]
│    ├── dev/                      [Dev utilities]
│    └── ci/                       [CI/CD]
│
├─── Tools (tools/)
│    ├── algorithm-tester/         [Algorithm framework]
│    ├── quantum-debugger/         [Quantum debugger]
│    ├── mwave-analyzer/           [M-Wave analyzer]
│    └── performance-profiler/     [Profiler]
│
├─── Assets (assets/)
│    ├── images/
│    │   └── wallpapers/
│    ├── fonts/
│    └── icons/
│        ├── cutefish/
│        └── quantum/
│
└─── Logs (logs/) [MOSTLY GITIGNORED]
     └── winners/                  [Algorithm winners - TRACKED]
```

## Component Hierarchy Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                        UniversalOS                          │
│                     (Root Directory)                        │
└─────────────────────────────────────────────────────────────┘
                              │
        ┌─────────────────────┼─────────────────────┐
        │                     │                     │
   ┌────▼────┐          ┌────▼────┐          ┌────▼────┐
   │  Config │          │  Source │          │  Build  │
   │  Files  │          │   Code  │          │ Outputs │
   └─────────┘          └─────────┘          └─────────┘
                              │
        ┌─────────────────────┼─────────────────────┐
        │                     │                     │
   ┌────▼────┐          ┌────▼────┐          ┌────▼────┐
   │ Kernel  │          │ Quantum │          │ Desktop │
   │  Layer  │          │  Layer  │          │  Layer  │
   └─────────┘          └─────────┘          └─────────┘
        │                     │                     │
   ┌────▼────┐          ┌────▼────┐          ┌────▼────┐
   │  Linux  │          │ Qutrit  │          │Cutefish │
   │  Helix  │          │  MWave  │          │  Shell  │
   │         │          │ Vacuum  │          │  Panel  │
   │         │          │Reversi- │          │  Dock   │
   │         │          │  ble    │          │  Apps   │
   │         │          │Deferred │          │         │
   │         │          │ Hybrid  │          │         │
   └─────────┘          └─────────┘          └─────────┘
```

## Quantum Subsystem Detail

```
┌─────────────────────────────────────────────────────────────┐
│                    src/quantum/                             │
│              (Quantum Computing Layer)                      │
└─────────────────────────────────────────────────────────────┘
                              │
        ┌─────────────────────┼─────────────────────┐
        │                     │                     │
   ┌────▼────┐          ┌────▼────┐          ┌────▼────┐
   │ Qutrit  │          │  MWave  │          │ Vacuum  │
   │ System  │          │ Storage │          │Interface│
   └─────────┘          └─────────┘          └─────────┘
        │                     │                     │
   ┌────▼────┐          ┌────▼────┐          ┌────▼────┐
   │  State  │          │McGinty  │          │Sampling │
   │  Gates  │          │Equation │          │Regulari-│
   │Simulator│          │ Fractal │          │ zation  │
   │Hardware │          │ Encoder │          │Randomne-│
   └─────────┘          │Filesyst-│          │   ss    │
                        │   em    │          │ Safety  │
                        └─────────┘          └─────────┘

        ┌─────────────────────┼─────────────────────┐
        │                     │                     │
   ┌────▼────┐          ┌────▼────┐          ┌────▼────┐
   │Reversi- │          │Deferred │          │ Hybrid  │
   │  ble    │          │Observa- │          │ Engine  │
   │Computing│          │  tion   │          └─────────┘
   └─────────┘          └─────────┘                │
        │                     │              ┌─────▼─────┐
   ┌────▼────┐          ┌────▼────┐         │  Router   │
   │Compiler │          │ Sandbox │         │ Classical │
   │ Garbage │          │Projecti-│         │  Quantum  │
   │Profiler │          │   on    │         │ Optimizer │
   │Schedule-│          │Coherenc-│         └───────────┘
   │   r     │          │   e     │
   └─────────┘          │Interfac-│
                        │   e     │
                        └─────────┘
```

## Test Structure Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                       tests/                                │
│                  (Test Infrastructure)                      │
└─────────────────────────────────────────────────────────────┘
                              │
        ┌─────────────────────┼─────────────────────┐
        │                     │                     │
   ┌────▼────┐          ┌────▼────┐          ┌────▼────┐
   │  Unit   │          │Integra- │          │Property │
   │  Tests  │          │  tion   │          │  Tests  │
   └─────────┘          └─────────┘          └─────────┘
        │                     │                     │
   [Mirrors src/]       [Component          [Correctness
                         Interaction]        Properties]

        ┌─────────────────────┼─────────────────────┐
        │                     │                     │
   ┌────▼────┐          ┌────▼────┐          ┌────▼────┐
   │Algorith-│          │Fixtures │          │  Mocks  │
   │   ms    │          │         │          │         │
   └─────────┘          └─────────┘          └─────────┘
        │
   [12-300 algos]
   [Competition]
   [Winners tracked]
```

## Documentation Structure Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                       docs/                                 │
│                   (Documentation)                           │
└─────────────────────────────────────────────────────────────┘
                              │
        ┌─────────────────────┼─────────────────────┐
        │                     │                     │
   ┌────▼────┐          ┌────▼────┐          ┌────▼────┐
   │   API   │          │ Design  │          │ Guides  │
   │  Docs   │          │  Docs   │          │         │
   └─────────┘          └─────────┘          └─────────┘
        │                     │                     │
   [Generated]          [Architecture]        ┌────▼────┐
   [Doxygen]            [Decisions]           │  User   │
   [Rustdoc]            [System Design]       │Developer│
                                              │Contribu-│
                                              │  tor    │
                                              └─────────┘

        ┌─────────────────────┼─────────────────────┐
        │                     │
   ┌────▼────┐          ┌────▼────┐
   │ Theory  │          │Architec-│
   │         │          │  ture   │
   └─────────┘          └─────────┘
        │                     │
   [Quantum]            [Diagrams]
   [Fractal]            [System]
   [Vacuum]             [Component]
   [Reversible]
```

## Data Flow Diagram

```
┌─────────────┐
│   Source    │
│   (src/)    │
└──────┬──────┘
       │
       │ [Compile]
       ▼
┌─────────────┐
│    Build    │
│  (build/)   │
└──────┬──────┘
       │
       │ [Test]
       ▼
┌─────────────┐
│    Tests    │
│  (tests/)   │
└──────┬──────┘
       │
       │ [Validate]
       ▼
┌─────────────┐
│   Deploy    │
│ (scripts/)  │
└─────────────┘
```

## Development Workflow Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                    Development Cycle                        │
└─────────────────────────────────────────────────────────────┘

1. Write Code
   └─> src/{component}/

2. Write Tests
   └─> tests/unit/{component}/
   └─> tests/property/{component}/

3. Run Algorithm Competition
   └─> tests/algorithms/{component}/
   └─> logs/winners/{component}/

4. Build
   └─> build/{debug|release}/

5. Test
   └─> Run unit tests
   └─> Run integration tests
   └─> Run property tests

6. Document
   └─> docs/api/
   └─> docs/design/

7. Validate
   └─> scripts/dev/validate-structure.sh

8. Deploy
   └─> scripts/deploy/
```

## File Organization Pattern

```
Component Pattern:
src/{component}/
├── {subcomponent}/
│   ├── {module}.cpp          [Implementation]
│   ├── {module}.hpp          [Header]
│   └── README.md             [Documentation]
├── README.md                 [Component overview]
└── CMakeLists.txt            [Build config]

include/{component}/
└── {module}.hpp              [Public header]

tests/unit/{component}/
└── {subcomponent}/
    └── {module}_test.cpp     [Unit test]

tests/property/{component}/
└── prop_{feature}.cpp        [Property test]

tests/algorithms/{component}/
├── algo_{name}_v1.cpp        [Algorithm variant 1]
├── algo_{name}_v2.cpp        [Algorithm variant 2]
└── ...                       [12-300 variants]

docs/api/{component}/
└── {module}.md               [API documentation]
```

## Naming Convention Summary

```
┌─────────────────────────────────────────────────────────────┐
│                   Naming Conventions                        │
└─────────────────────────────────────────────────────────────┘

Directories:
  ├─ Root level:        lowercase (src, docs, tests)
  ├─ Components:        lowercase (quantum, desktop)
  └─ Subcomponents:     lowercase (qutrit, mwave)

Source Files:
  ├─ C/C++:            snake_case.cpp
  ├─ Rust:             snake_case.rs
  ├─ Python:           snake_case.py
  └─ Julia:            snake_case.jl

Test Files:
  ├─ Unit:             {source}_test.{ext}
  ├─ Integration:      test_{feature}.{ext}
  ├─ Property:         prop_{feature}.{ext}
  └─ Algorithm:        algo_{name}.{ext}

Documentation:
  ├─ Top-level:        UPPERCASE_UNDERSCORES.md
  ├─ Subdirectory:     lowercase-dashes.md
  └─ Design:           {COMPONENT}_DESIGN.md

Scripts:
  ├─ Shell:            kebab-case.sh
  ├─ PowerShell:       kebab-case.ps1
  └─ Executable:       kebab-case (no extension)
```

## Git Tracking Summary

```
┌─────────────────────────────────────────────────────────────┐
│                    Git Tracking                             │
└─────────────────────────────────────────────────────────────┘

✅ TRACKED:
  ├─ .kiro/                    [AI configuration]
  ├─ src/                      [Source code]
  ├─ include/                  [Headers]
  ├─ lib/                      [Third-party libs]
  ├─ tests/                    [Test suites]
  ├─ docs/                     [Documentation]
  ├─ scripts/                  [Scripts]
  ├─ tools/                    [Dev tools]
  ├─ assets/                   [Visual assets]
  ├─ logs/winners/             [Algorithm winners]
  └─ Root config files         [Makefile, CMakeLists.txt, etc.]

❌ GITIGNORED:
  ├─ build/                    [Build outputs]
  ├─ logs/* (except winners/)  [Runtime logs]
  ├─ *.o, *.a, *.so            [Compiled objects]
  ├─ .vscode/, .idea/          [IDE files]
  └─ .DS_Store, Thumbs.db      [OS files]
```

## Quick Navigation Guide

```
┌─────────────────────────────────────────────────────────────┐
│                  Quick Navigation                           │
└─────────────────────────────────────────────────────────────┘

Looking for...                    Go to...
─────────────────────────────────────────────────────────────
Quantum code                      src/quantum/
Desktop code                      src/desktop/
Kernel code                       src/kernel/ or src/helix/
Tests                             tests/unit/{component}/
Documentation                     docs/
Build scripts                     scripts/build/
Algorithm tests                   tests/algorithms/
Algorithm winners                 logs/winners/
API docs                          docs/api/
Design docs                       docs/design/
User guides                       docs/guides/user/
Developer guides                  docs/guides/developer/
Validation script                 scripts/dev/validate-structure.sh
```

## Summary

This directory structure provides:

- ✅ **Clear Visual Organization** - Easy to understand hierarchy
- ✅ **Component Isolation** - Quantum, desktop, kernel clearly separated
- ✅ **Test Infrastructure** - Comprehensive testing at all levels
- ✅ **Documentation** - Well-organized docs for all audiences
- ✅ **Build System** - Clean separation of source and build outputs
- ✅ **Algorithm Competition** - Dedicated infrastructure for optimization
- ✅ **Git Integration** - Proper tracking and ignoring of files

---

**See Also:**
- [Complete Directory Documentation](../DIRECTORY_STRUCTURE.md)
- [Project Summary](../PROJECT_SUMMARY.md)
- [Master Plan](../MASTER_PLAN.md)

**Last Updated:** 2026-04-30  
**Version:** 1.0
