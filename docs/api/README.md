# API Documentation

## Overview
Generated API documentation for UniversalOS components.

## Structure
- `helix/` - Helix kernel API documentation
- `quantum/` - Quantum computing API documentation
- `desktop/` - Desktop environment API documentation
- `bootloader/` - Bootloader API documentation
- `audio/` - Audio system API documentation
- `kernel/` - Kernel API documentation
- `libs/` - Library API documentation

## Purpose
Provides comprehensive API documentation for:
- Public interfaces
- Function signatures
- Class hierarchies
- Usage examples
- Return values and error codes

## Generation
API documentation is automatically generated from source code comments using:
- **Doxygen** for C/C++ code
- **rustdoc** for Rust code
- **Sphinx** for Python code

## Building Documentation
```bash
# Generate all API docs
make docs

# Generate specific component docs
make docs-quantum
make docs-helix
```

## Viewing Documentation
```bash
# Open in browser
open build/docs/html/index.html
```

## Writing API Documentation
- Document all public functions and classes
- Include usage examples
- Document parameters and return values
- Note any preconditions or side effects
- Link to related functions

## Related
- `docs/guides/developer/` - Developer guides
- `docs/design/` - Design documents
