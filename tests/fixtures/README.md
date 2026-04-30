# Test Fixtures

## Overview
Test fixtures and data files used across UniversalOS test suites.

## Purpose
Provides:
- Sample data files
- Test configurations
- Reference outputs
- Mock quantum states
- Test audio files
- Example M-Wave data

## Structure
Organize fixtures by component:
- `quantum/` - Quantum state fixtures
- `audio/` - Audio test files
- `desktop/` - Desktop configuration fixtures
- `mwave/` - M-Wave data samples

## Usage
```python
# Load fixture in test
fixture_path = "tests/fixtures/quantum/sample_qutrit_state.json"
state = load_qutrit_state(fixture_path)
```

## Guidelines
- Keep fixtures small and focused
- Document fixture purpose
- Version control fixtures
- Use realistic data
- Avoid sensitive information

## Related
- `tests/mocks/` - Mock objects
- `tests/unit/` - Unit tests
- `tests/integration/` - Integration tests
