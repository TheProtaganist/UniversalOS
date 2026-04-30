# Quantum Debugger

## Overview
Debugging tool for quantum computing components in UniversalOS, providing visualization and inspection of quantum states.

## Purpose
The quantum debugger helps:
- Visualize quantum states
- Inspect qutrit values
- Track state evolution
- Monitor coherence
- Debug quantum algorithms
- Analyze entanglement

## Features
- Real-time quantum state visualization
- Qutrit state inspection (|0⟩, |1⟩, |2⟩)
- State evolution tracking
- Coherence monitoring
- Entanglement analysis
- Measurement simulation
- Breakpoint support for quantum operations

## Usage
```bash
# Start quantum debugger
./tools/quantum-debugger/qdb

# Debug specific quantum program
./tools/quantum-debugger/qdb --program my_quantum_algo

# Attach to running quantum process
./tools/quantum-debugger/qdb --attach <pid>
```

## Commands
```
(qdb) state          # Show current quantum state
(qdb) qutrit 0       # Inspect qutrit 0
(qdb) evolve         # Step through evolution
(qdb) measure 0      # Simulate measurement
(qdb) coherence      # Check coherence
(qdb) entangle       # Show entanglement
(qdb) break gate     # Break on gate operation
```

## Visualization
- State vector visualization
- Bloch sphere representation (for qutrits)
- Probability distribution charts
- Coherence graphs
- Entanglement diagrams

## Requirements
- Quantum components built
- Visualization libraries installed
- Terminal with graphics support (or GUI mode)

## Related
- `src/quantum/` - Quantum components
- `tests/property/` - Quantum property tests
- `docs/theory/quantum-computing.md` - Quantum theory
