# Test Mocks

## Overview
Mock objects and interfaces for testing UniversalOS components in isolation.

## Purpose
Provides mock implementations of:
- Quantum hardware interfaces
- Kernel interfaces
- File system operations
- Network interfaces
- Hardware devices

## Structure
Organize mocks by interface:
- `quantum/` - Mock quantum hardware
- `kernel/` - Mock kernel interfaces
- `hardware/` - Mock hardware devices
- `filesystem/` - Mock filesystem operations

## Usage
```cpp
// Use mock in test
MockQuantumHardware mock_hw;
mock_hw.set_qutrit_state(test_state);
auto result = quantum_algorithm.run(mock_hw);
```

## Guidelines
- Mock external dependencies only
- Keep mocks simple
- Match real interface behavior
- Document mock limitations
- Prefer real implementations when possible

## When to Mock
- External hardware not available
- Slow operations (network, disk)
- Non-deterministic behavior
- Expensive operations

## When NOT to Mock
- Internal components (use real implementations)
- Simple operations
- Core logic being tested

## Related
- `tests/fixtures/` - Test fixtures
- `tests/unit/` - Unit tests
