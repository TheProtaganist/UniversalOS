# Contributing to UniversalOS

Thank you for your interest in contributing to UniversalOS! This document provides guidelines and instructions for contributing to the project.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Spec-Driven Development](#spec-driven-development)
- [Algorithm Competition](#algorithm-competition)
- [Code Quality Standards](#code-quality-standards)
- [Testing Requirements](#testing-requirements)
- [Documentation](#documentation)
- [Commit Guidelines](#commit-guidelines)
- [Pull Request Process](#pull-request-process)
- [Community](#community)

## Code of Conduct

Please read and follow our [Code of Conduct](CODE_OF_CONDUCT.md). We are committed to providing a welcoming and inclusive environment for all contributors.

## Getting Started

### Prerequisites

- **Operating System**: Linux (Arch Linux recommended), Windows (WSL2), or macOS
- **Languages**: C, C++26, Rust, Python 3.10+, Julia 1.8+
- **Build Tools**: GCC/Clang, CMake 3.20+, Cargo, Make
- **Version Control**: Git 2.30+
- **AI Tools**: Kiro AI (optional but recommended)

### Setting Up Development Environment

```bash
# Clone the repository
git clone https://github.com/yourusername/UniversalOS.git
cd UniversalOS

# Run development environment setup
./scripts/dev/setup-dev-env.sh

# Verify setup
make check
```

### Project Structure

Familiarize yourself with the project structure:

```
UniversalOS/
├── src/           # Source code
├── include/       # Public headers
├── tests/         # Test suites
├── docs/          # Documentation
├── scripts/       # Build and utility scripts
├── tools/         # Development tools
└── .kiro/         # Kiro AI specs and configuration
```

See [docs/DIRECTORY_STRUCTURE.md](docs/DIRECTORY_STRUCTURE.md) for detailed information.

## Development Workflow

### Branch Strategy

- `main` - Stable releases only
- `dev` - Development branch (default)
- `feature/*` - Feature branches
- `bugfix/*` - Bug fix branches
- `hotfix/*` - Critical fixes for main

### Creating a Feature Branch

```bash
# Update dev branch
git checkout dev
git pull origin dev

# Create feature branch
git checkout -b feature/your-feature-name

# Work on your feature
# ...

# Push to remote
git push -u origin feature/your-feature-name
```

## Spec-Driven Development

UniversalOS follows a **spec-driven development** methodology. Every feature must have a specification before implementation.

### Spec Creation Process

1. **Requirements** - Define what needs to be built
2. **Design** - Design the solution with correctness properties
3. **Tasks** - Break down into implementation tasks
4. **Implementation** - Execute tasks one by one

### Creating a Spec

```bash
# Specs are located in .kiro/specs/
# Follow the template structure:
.kiro/specs/{phase}/{feature-name}/
├── requirements.md
├── design.md
└── tasks.md
```

See existing specs in `.kiro/specs/` for examples.

## Algorithm Competition

UniversalOS uses **algorithm competition** to find optimal implementations.

### Competition Process

1. Implement 12-300 algorithms (depending on complexity)
2. Run 36+ tests minimum before finalizing
3. Measure metrics: accuracy, speed, complexity, coherence, etc.
4. Document winners in `logs/winners/`

### Running Algorithm Tests

```bash
# Run algorithm competition for a component
./scripts/test/run-algorithm-tests.sh quantum/qutrit

# View results
cat logs/winners/qutrit-evolution/winners.md
```

### Algorithm Quality Categories

- ✨ **PERFECT**: Flawless, mathematically exact, zero tradeoffs (always aim here first!)
- 🌟 **EXCELLENT**: Great, precise enough, minimal tradeoffs (acceptable)
- ⚖️ **COMPROMISE**: Acceptable tradeoffs (use sparingly)
- 🚫 **BROKEN**: Wrong, inaccurate (avoid, keep as lessons only)

## Code Quality Standards

### Path of Least Resistance Framework

1. **Try PERFECT first** - Can we solve this exactly?
2. **Accept EXCELLENT** - Is "good enough" actually good enough?
3. **Consider COMPROMISE** - What do we gain vs lose?
4. **Avoid BROKEN** - Learn from it, don't use it

### Coding Standards

#### C/C++ Code
- Follow Linux kernel style for kernel code
- Follow Google C++ Style Guide for C++ code
- Use `clang-format` for formatting
- Maximum line length: 100 characters
- Use meaningful variable names

#### Rust Code
- Follow Rust standard style (`rustfmt`)
- Use `clippy` for linting
- Prefer explicit types for public APIs
- Document all public functions

#### Python Code
- Follow PEP 8 style guide
- Use `black` for formatting
- Use type hints for all functions
- Maximum line length: 100 characters

#### Julia Code
- Follow Julia style guide
- Use `JuliaFormatter.jl` for formatting
- Document all exported functions

### Code Review Checklist

- [ ] Code follows style guidelines
- [ ] All tests pass
- [ ] New tests added for new functionality
- [ ] Documentation updated
- [ ] No compiler warnings
- [ ] Algorithm competition results documented (if applicable)
- [ ] Property-based tests pass
- [ ] Code is EXCELLENT or PERFECT quality

## Testing Requirements

### Test Types

1. **Unit Tests** - Test individual functions/classes
2. **Integration Tests** - Test component interactions
3. **Property-Based Tests** - Test correctness properties
4. **Algorithm Tests** - Test algorithm competitions

### Writing Tests

```bash
# Unit tests mirror source structure
src/quantum/qutrit/state.cpp
tests/unit/quantum/qutrit/state_test.cpp

# Run tests
make test

# Run specific test suite
./build/test/quantum_qutrit_tests
```

### Test Coverage

- Target: >90% code coverage
- Use `gcov` or `llvm-cov` for coverage reports
- Coverage reports in `build/coverage/`

### Property-Based Testing

All mathematical components must have property-based tests:

```python
# Example property test
@given(st.integers(min_value=0, max_value=2))
def test_qutrit_state_normalization(state_value):
    """Property: Qutrit states must be normalized"""
    qutrit = Qutrit(state_value)
    assert abs(qutrit.norm() - 1.0) < 1e-10
```

## Documentation

### Documentation Requirements

- All public APIs must be documented
- Use Doxygen for C/C++ code
- Use rustdoc for Rust code
- Use docstrings for Python code
- Use Julia docstrings for Julia code

### Documentation Structure

```
docs/
├── api/           # Generated API docs
├── design/        # Design documents
├── guides/        # User and developer guides
├── theory/        # Theoretical foundations
└── architecture/  # Architecture diagrams
```

### Writing Documentation

- Use clear, concise language
- Include code examples
- Add diagrams where helpful
- Link to related documentation
- Keep documentation up-to-date with code

## Commit Guidelines

### Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- `feat` - New feature
- `fix` - Bug fix
- `docs` - Documentation changes
- `style` - Code style changes (formatting)
- `refactor` - Code refactoring
- `test` - Adding or updating tests
- `perf` - Performance improvements
- `chore` - Build process or auxiliary tool changes

### Examples

```
feat(quantum): implement qutrit state vector simulation

Add state vector simulation for up to 15 qutrits with full
quantum gate operations and measurement capabilities.

Algorithm competition: 36 algorithms tested
Winner: Optimized tensor contraction (98% accuracy, 2.3ms)
Documented in: logs/winners/qutrit-evolution/

Closes #123
```

```
fix(mwave): correct fractal dimension calculation

Fixed off-by-one error in Hausdorff dimension calculation
that caused 5% density loss.

Property test: test_fractal_dimension_bounds now passes
```

### AI Commit Analyzer

Use the AI commit analyzer to review commits:

```bash
# Analyze staged changes
./tools/ai-commit-analyzer/analyze.sh

# Get commit message suggestions
./tools/ai-commit-analyzer/suggest.sh
```

## Pull Request Process

### Before Submitting

1. Ensure all tests pass
2. Run code formatters
3. Update documentation
4. Add/update tests for new functionality
5. Run algorithm competition (if applicable)
6. Verify no compiler warnings
7. Check code coverage

### Submitting a Pull Request

1. Push your feature branch to GitHub
2. Create a pull request to `dev` branch
3. Fill out the PR template completely
4. Link related issues
5. Request review from maintainers

### PR Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Unit tests pass
- [ ] Integration tests pass
- [ ] Property-based tests pass
- [ ] Algorithm competition completed (if applicable)

## Algorithm Competition Results (if applicable)
- Algorithms tested: X
- Winner: [algorithm name]
- Metrics: [accuracy, speed, etc.]
- Documented in: logs/winners/[component]/

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] Tests added/updated
- [ ] No compiler warnings
- [ ] Code quality: EXCELLENT or PERFECT
```

### Review Process

1. Automated checks run (CI/CD)
2. Code review by maintainers
3. Address feedback
4. Approval by at least one maintainer
5. Merge to `dev` branch

## Community

### Communication Channels

- **GitHub Issues** - Bug reports and feature requests
- **GitHub Discussions** - General discussions and questions
- **Discord** - Real-time chat (link TBD)
- **Mailing List** - Development announcements (link TBD)

### Getting Help

- Check existing documentation
- Search GitHub issues
- Ask in GitHub Discussions
- Join Discord for real-time help

### Reporting Bugs

Use the bug report template:

```markdown
## Bug Description
Clear description of the bug

## Steps to Reproduce
1. Step 1
2. Step 2
3. ...

## Expected Behavior
What should happen

## Actual Behavior
What actually happens

## Environment
- OS: [e.g., Arch Linux]
- Version: [e.g., commit hash]
- Hardware: [relevant hardware info]

## Additional Context
Any other relevant information
```

### Feature Requests

Use the feature request template:

```markdown
## Feature Description
Clear description of the feature

## Use Case
Why is this feature needed?

## Proposed Solution
How should this be implemented?

## Alternatives Considered
Other approaches considered

## Additional Context
Any other relevant information
```

## Recognition

Contributors are recognized in:

- `CONTRIBUTORS.md` file
- Release notes
- Project documentation
- Annual contributor highlights

## License

By contributing to UniversalOS, you agree that your contributions will be licensed under the MIT License.

## Questions?

If you have questions about contributing, please:

1. Check this document
2. Search existing issues
3. Ask in GitHub Discussions
4. Contact maintainers

---

**Thank you for contributing to UniversalOS!** 🚀

Your contributions help build the future of quantum-fractal-vacuum computing.
