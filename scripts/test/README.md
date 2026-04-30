# Test Scripts

## Overview
Scripts for running UniversalOS test suites.

## Coming Soon
- `run-unit-tests.sh` - Run unit tests
- `run-integration-tests.sh` - Run integration tests
- `run-property-tests.sh` - Run property-based tests
- `run-algorithm-tests.sh` - Run algorithm competitions
- `run-all-tests.sh` - Run all test suites
- `coverage-report.sh` - Generate coverage report

## Purpose
Test scripts automate:
- Test execution
- Test filtering
- Coverage analysis
- Result reporting
- CI/CD integration

## Usage
```bash
# Run all tests
./scripts/test/run-all-tests.sh

# Run specific test suite
./scripts/test/run-unit-tests.sh
./scripts/test/run-integration-tests.sh
./scripts/test/run-property-tests.sh

# Run tests for specific component
./scripts/test/run-unit-tests.sh quantum
./scripts/test/run-integration-tests.sh desktop-quantum

# Generate coverage report
./scripts/test/coverage-report.sh
```

## Test Outputs
- Test results printed to console
- Coverage reports in `build/coverage/`
- Test logs in `logs/test/`

## Requirements
- Tests built (run build scripts first)
- Test frameworks installed
- Test dependencies available

## Related
- `tests/` - Test suites
- `scripts/build/` - Build scripts
- `scripts/ci/` - CI/CD scripts
