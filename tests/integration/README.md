# Integration Tests

## Overview
Integration tests verify that multiple UniversalOS components work correctly together.

## Structure
- `quantum-classical/` - Quantum-classical integration tests
- `desktop-quantum/` - Desktop-quantum integration tests
- `bootloader-kernel/` - Bootloader-kernel integration tests
- `audio-quantum/` - Audio-quantum integration tests
- And more...

## Purpose
Integration tests verify:
- Component interactions
- Data flow between systems
- End-to-end functionality
- System-level behavior

## Test Scenarios
- Quantum state persistence through boot
- Desktop quantum control integration
- Audio quantum enhancement pipeline
- Hybrid execution routing
- M-Wave storage operations

## Running Tests
```bash
# Run all integration tests
./scripts/test/run-integration-tests.sh

# Run specific integration tests
./scripts/test/run-integration-tests.sh quantum-classical
```

## Writing Tests
- Test realistic scenarios
- Use actual components (minimal mocking)
- Test error handling and edge cases
- Document test setup requirements
- Clean up resources after tests

## Related
- `tests/unit/` - Unit tests
- `tests/property/` - Property-based tests
- `tests/fixtures/` - Test fixtures and data
