# Algorithm Tester

## Overview
Framework for running algorithm competitions in UniversalOS, where 12-300 algorithms compete to find the best implementation.

## Purpose
The algorithm tester:
- Runs multiple algorithm implementations
- Measures performance metrics
- Compares results
- Identifies winners
- Documents results

## Features
- Run 12+ algorithms per component
- Measure multiple metrics simultaneously
- Run 36+ additional validation tests
- Generate detailed reports
- Store winners in `logs/winners/`

## Metrics
- **Accuracy**: Correctness of results
- **Speed**: Execution time
- **Complexity**: Algorithmic complexity (Big-O)
- **Coherence**: Quantum coherence preservation
- **Randomness**: Quality of randomness (entropy)
- **Determinism**: Consistency across runs
- **Memory**: Memory usage
- **Energy**: Energy consumption (for reversible algorithms)

## Usage
```bash
# Run algorithm competition
./tools/algorithm-tester/run-competition.sh qutrit-evolution

# View results
cat logs/winners/qutrit-evolution/winners.md

# Compare specific algorithms
./tools/algorithm-tester/compare.sh algo1 algo2
```

## Competition Process
1. Implement 12+ algorithms
2. Register algorithms with tester
3. Run competition with test suite
4. Measure all metrics
5. Run 36+ additional tests
6. Rank algorithms by metrics
7. Document winners

## Output Format
Results stored in `logs/winners/{component}/`:
- `winners.md` - Winner documentation
- `algorithms.md` - All algorithm descriptions
- `metrics.csv` - Detailed metrics
- `charts/` - Performance charts

## Related
- `tests/algorithms/` - Algorithm test suites
- `logs/winners/` - Competition results
- `docs/guides/developer/` - Algorithm development guide
