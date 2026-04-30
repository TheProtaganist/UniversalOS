# Unit Tests

## Overview
Unit tests for UniversalOS components, mirroring the `src/` directory structure for easy navigation and maintenance.

## Structure
This directory mirrors the `src/` structure:
- `quantum/` - Quantum component unit tests
- `desktop/` - Desktop environment unit tests
- `bootloader/` - Bootloader unit tests
- `audio/` - Audio system unit tests
- And more...

## Purpose
Unit tests verify individual functions, classes, and modules work correctly in isolation.

## Naming Convention
- Test files: `{source_name}_test.{ext}`
- Example: `src/quantum/qutrit/state.cpp` → `tests/unit/quantum/qutrit/state_test.cpp`

## Running Tests
```bash
# Run all unit tests
./scripts/test/run-unit-tests.sh

# Run specific component tests
./scripts/test/run-unit-tests.sh quantum
```

## Writing Tests
- Test one function/class per test file
- Use descriptive test names
- Test both success and failure cases
- Keep tests fast and isolated
- No external dependencies

## Related
- `tests/integration/` - Integration tests
- `tests/property/` - Property-based tests
- `tests/algorithms/` - Algorithm competition tests
