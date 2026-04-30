#!/bin/bash
# validate-structure.sh
# Validates the UniversalOS directory structure
# Checks for required directories, README files, and orphaned files

# Don't exit on error - we want to collect all errors
# set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Counters
ERRORS=0
WARNINGS=0
CHECKS=0

# Function to print error
error() {
    echo -e "${RED}✗ ERROR: $1${NC}"
    ((ERRORS++))
}

# Function to print warning
warning() {
    echo -e "${YELLOW}⚠ WARNING: $1${NC}"
    ((WARNINGS++))
}

# Function to print success
success() {
    echo -e "${GREEN}✓ $1${NC}"
}

# Function to print info
info() {
    echo -e "$1"
}

echo "========================================="
echo "UniversalOS Directory Structure Validator"
echo "========================================="
echo ""

# Get script directory and project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

cd "$PROJECT_ROOT"

info "Project root: $PROJECT_ROOT"
echo ""

# ==========================================
# CHECK 1: Required Root Directories
# ==========================================
info "Check 1: Validating required root directories..."
((CHECKS++))

required_root_dirs=(
    ".kiro"
    ".kiro/specs"
    ".kiro/steering"
    ".kiro/settings"
    "src"
    "include"
    "lib"
    "build"
    "tests"
    "docs"
    "scripts"
    "tools"
    "assets"
    "logs"
    "logs/winners"
)

missing_dirs=0
for dir in "${required_root_dirs[@]}"; do
    if [ ! -d "$dir" ]; then
        error "Required directory missing: $dir"
        ((missing_dirs++))
    fi
done

if [ $missing_dirs -eq 0 ]; then
    success "All required root directories exist"
fi
echo ""

# ==========================================
# CHECK 2: Source Code Structure
# ==========================================
info "Check 2: Validating source code structure..."
((CHECKS++))

required_src_dirs=(
    "src/kernel"
    "src/kernel/arch"
    "src/kernel/drivers"
    "src/kernel/fs"
    "src/kernel/mm"
    "src/helix"
    "src/helix/core"
    "src/helix/state"
    "src/helix/scheduler"
    "src/helix/interface"
    "src/quantum"
    "src/quantum/qutrit"
    "src/quantum/qutrit/state"
    "src/quantum/qutrit/gates"
    "src/quantum/qutrit/simulator"
    "src/quantum/qutrit/hardware"
    "src/quantum/mwave"
    "src/quantum/mwave/equation"
    "src/quantum/mwave/fractal"
    "src/quantum/mwave/encoder"
    "src/quantum/mwave/filesystem"
    "src/quantum/vacuum"
    "src/quantum/vacuum/sampling"
    "src/quantum/vacuum/regularization"
    "src/quantum/vacuum/randomness"
    "src/quantum/vacuum/safety"
    "src/quantum/reversible"
    "src/quantum/reversible/compiler"
    "src/quantum/reversible/garbage"
    "src/quantum/reversible/profiler"
    "src/quantum/reversible/scheduler"
    "src/quantum/deferred"
    "src/quantum/deferred/sandbox"
    "src/quantum/deferred/projection"
    "src/quantum/deferred/coherence"
    "src/quantum/deferred/interface"
    "src/quantum/hybrid"
    "src/quantum/hybrid/router"
    "src/quantum/hybrid/classical"
    "src/quantum/hybrid/quantum"
    "src/quantum/hybrid/optimizer"
    "src/desktop"
    "src/desktop/shell"
    "src/desktop/panel"
    "src/desktop/dock"
    "src/desktop/menu"
    "src/desktop/settings"
    "src/desktop/filemanager"
    "src/desktop/terminal"
    "src/desktop/texteditor"
    "src/desktop/quantum-control"
    "src/bootloader"
    "src/bootloader/uefi"
    "src/bootloader/graphics"
    "src/bootloader/menu"
    "src/bootloader/quantum"
    "src/bootloader/recovery"
    "src/audio"
    "src/audio/kernel"
    "src/audio/alsa"
    "src/audio/pulse"
    "src/audio/quantum"
    "src/audio/midi"
    "src/tools"
    "src/libs"
)

missing_src_dirs=0
for dir in "${required_src_dirs[@]}"; do
    if [ ! -d "$dir" ]; then
        error "Required source directory missing: $dir"
        ((missing_src_dirs++))
    fi
done

if [ $missing_src_dirs -eq 0 ]; then
    success "All required source directories exist"
fi
echo ""

# ==========================================
# CHECK 3: Include Structure
# ==========================================
info "Check 3: Validating include structure..."
((CHECKS++))

required_include_dirs=(
    "include/helix"
    "include/quantum"
    "include/desktop"
    "include/audio"
)

missing_include_dirs=0
for dir in "${required_include_dirs[@]}"; do
    if [ ! -d "$dir" ]; then
        error "Required include directory missing: $dir"
        ((missing_include_dirs++))
    fi
done

if [ $missing_include_dirs -eq 0 ]; then
    success "All required include directories exist"
fi
echo ""

# ==========================================
# CHECK 4: Test Structure
# ==========================================
info "Check 4: Validating test structure..."
((CHECKS++))

required_test_dirs=(
    "tests/unit"
    "tests/integration"
    "tests/property"
    "tests/algorithms"
    "tests/fixtures"
    "tests/mocks"
)

missing_test_dirs=0
for dir in "${required_test_dirs[@]}"; do
    if [ ! -d "$dir" ]; then
        error "Required test directory missing: $dir"
        ((missing_test_dirs++))
    fi
done

if [ $missing_test_dirs -eq 0 ]; then
    success "All required test directories exist"
fi
echo ""

# ==========================================
# CHECK 5: Documentation Structure
# ==========================================
info "Check 5: Validating documentation structure..."
((CHECKS++))

required_doc_dirs=(
    "docs/api"
    "docs/design"
    "docs/guides"
    "docs/guides/user"
    "docs/guides/developer"
    "docs/guides/contributor"
    "docs/theory"
    "docs/architecture"
)

missing_doc_dirs=0
for dir in "${required_doc_dirs[@]}"; do
    if [ ! -d "$dir" ]; then
        error "Required documentation directory missing: $dir"
        ((missing_doc_dirs++))
    fi
done

if [ $missing_doc_dirs -eq 0 ]; then
    success "All required documentation directories exist"
fi
echo ""

# ==========================================
# CHECK 6: Scripts Structure
# ==========================================
info "Check 6: Validating scripts structure..."
((CHECKS++))

required_script_dirs=(
    "scripts/build"
    "scripts/test"
    "scripts/deploy"
    "scripts/dev"
    "scripts/ci"
)

missing_script_dirs=0
for dir in "${required_script_dirs[@]}"; do
    if [ ! -d "$dir" ]; then
        error "Required scripts directory missing: $dir"
        ((missing_script_dirs++))
    fi
done

if [ $missing_script_dirs -eq 0 ]; then
    success "All required scripts directories exist"
fi
echo ""

# ==========================================
# CHECK 7: Tools Structure
# ==========================================
info "Check 7: Validating tools structure..."
((CHECKS++))

required_tool_dirs=(
    "tools/algorithm-tester"
    "tools/quantum-debugger"
    "tools/mwave-analyzer"
    "tools/performance-profiler"
)

missing_tool_dirs=0
for dir in "${required_tool_dirs[@]}"; do
    if [ ! -d "$dir" ]; then
        error "Required tools directory missing: $dir"
        ((missing_tool_dirs++))
    fi
done

if [ $missing_tool_dirs -eq 0 ]; then
    success "All required tools directories exist"
fi
echo ""

# ==========================================
# CHECK 8: Assets Structure
# ==========================================
info "Check 8: Validating assets structure..."
((CHECKS++))

required_asset_dirs=(
    "assets/images"
    "assets/images/wallpapers"
    "assets/fonts"
    "assets/icons"
    "assets/icons/cutefish"
    "assets/icons/quantum"
)

missing_asset_dirs=0
for dir in "${required_asset_dirs[@]}"; do
    if [ ! -d "$dir" ]; then
        error "Required assets directory missing: $dir"
        ((missing_asset_dirs++))
    fi
done

if [ $missing_asset_dirs -eq 0 ]; then
    success "All required assets directories exist"
fi
echo ""

# ==========================================
# CHECK 9: README Files in Major Directories
# ==========================================
info "Check 9: Validating README files in major directories..."
((CHECKS++))

required_readmes=(
    "README.md"
    "src/kernel/README.md"
    "src/helix/README.md"
    "src/quantum/README.md"
    "src/desktop/README.md"
    "src/bootloader/README.md"
    "src/audio/README.md"
    "src/tools/README.md"
    "src/libs/README.md"
    "docs/api/README.md"
    "docs/design/README.md"
    "docs/guides/README.md"
    "docs/guides/user/README.md"
    "docs/guides/developer/README.md"
    "docs/guides/contributor/README.md"
    "docs/theory/README.md"
    "docs/architecture/README.md"
    "scripts/build/README.md"
    "scripts/test/README.md"
    "scripts/deploy/README.md"
    "scripts/dev/README.md"
    "scripts/ci/README.md"
    "assets/images/README.md"
    "assets/images/wallpapers/README.md"
    "assets/fonts/README.md"
    "assets/icons/README.md"
    "assets/icons/cutefish/README.md"
    "assets/icons/quantum/README.md"
)

missing_readmes=0
for readme in "${required_readmes[@]}"; do
    if [ ! -f "$readme" ]; then
        warning "README file missing: $readme"
        ((missing_readmes++))
    fi
done

if [ $missing_readmes -eq 0 ]; then
    success "All required README files exist"
else
    info "  Found $missing_readmes missing README files (warnings only)"
fi
echo ""

# ==========================================
# CHECK 10: Root Configuration Files
# ==========================================
info "Check 10: Validating root configuration files..."
((CHECKS++))

required_root_files=(
    "README.md"
    "LICENSE"
    "CONTRIBUTING.md"
    "CODE_OF_CONDUCT.md"
    "CHANGELOG.md"
    ".gitignore"
    ".gitattributes"
    "Makefile"
    "CMakeLists.txt"
)

missing_root_files=0
for file in "${required_root_files[@]}"; do
    if [ ! -f "$file" ]; then
        error "Required root file missing: $file"
        ((missing_root_files++))
    fi
done

if [ $missing_root_files -eq 0 ]; then
    success "All required root configuration files exist"
fi
echo ""

# ==========================================
# CHECK 11: Orphaned Source Files in Root
# ==========================================
info "Check 11: Checking for orphaned source files in root directory..."
((CHECKS++))

orphaned_files=0

# Check for C/C++ source files in root
if ls *.c *.cpp *.cc *.cxx 2>/dev/null | grep -q .; then
    error "Found C/C++ source files in root directory (should be in src/)"
    ls *.c *.cpp *.cc *.cxx 2>/dev/null | while read file; do
        error "  - $file"
    done
    ((orphaned_files++))
fi

# Check for Rust source files in root
if ls *.rs 2>/dev/null | grep -q .; then
    error "Found Rust source files in root directory (should be in src/)"
    ls *.rs 2>/dev/null | while read file; do
        error "  - $file"
    done
    ((orphaned_files++))
fi

# Check for Python source files in root (excluding setup.py, etc.)
if ls *.py 2>/dev/null | grep -v -E '(setup|configure|build)\.py' | grep -q .; then
    warning "Found Python source files in root directory (consider moving to src/)"
    ls *.py 2>/dev/null | grep -v -E '(setup|configure|build)\.py' | while read file; do
        warning "  - $file"
    done
fi

# Check for Julia source files in root
if ls *.jl 2>/dev/null | grep -q .; then
    error "Found Julia source files in root directory (should be in src/)"
    ls *.jl 2>/dev/null | while read file; do
        error "  - $file"
    done
    ((orphaned_files++))
fi

# Check for header files in root
if ls *.h *.hpp *.hxx 2>/dev/null | grep -q .; then
    error "Found header files in root directory (should be in include/)"
    ls *.h *.hpp *.hxx 2>/dev/null | while read file; do
        error "  - $file"
    done
    ((orphaned_files++))
fi

if [ $orphaned_files -eq 0 ]; then
    success "No orphaned source files in root directory"
fi
echo ""

# ==========================================
# CHECK 12: Build Artifacts in Source Tree
# ==========================================
info "Check 12: Checking for build artifacts in source tree..."
((CHECKS++))

build_artifacts=0

# Check for object files
if find src include -name "*.o" 2>/dev/null | grep -q .; then
    error "Found object files in source tree (should be in build/)"
    find src include -name "*.o" 2>/dev/null | head -5 | while read file; do
        error "  - $file"
    done
    ((build_artifacts++))
fi

# Check for static libraries
if find src include -name "*.a" 2>/dev/null | grep -q .; then
    error "Found static libraries in source tree (should be in build/)"
    find src include -name "*.a" 2>/dev/null | head -5 | while read file; do
        error "  - $file"
    done
    ((build_artifacts++))
fi

# Check for shared libraries
if find src include -name "*.so" -o -name "*.dylib" -o -name "*.dll" 2>/dev/null | grep -q .; then
    error "Found shared libraries in source tree (should be in build/)"
    find src include -name "*.so" -o -name "*.dylib" -o -name "*.dll" 2>/dev/null | head -5 | while read file; do
        error "  - $file"
    done
    ((build_artifacts++))
fi

# Check for executables (common patterns)
if find src include -type f -executable -name "*.exe" 2>/dev/null | grep -q .; then
    error "Found executables in source tree (should be in build/)"
    find src include -type f -executable -name "*.exe" 2>/dev/null | head -5 | while read file; do
        error "  - $file"
    done
    ((build_artifacts++))
fi

if [ $build_artifacts -eq 0 ]; then
    success "No build artifacts found in source tree"
fi
echo ""

# ==========================================
# CHECK 13: Git Configuration
# ==========================================
info "Check 13: Validating Git configuration..."
((CHECKS++))

git_issues=0

# Check if .gitignore exists and has required entries
if [ -f ".gitignore" ]; then
    required_ignores=("/build/" "*.o" "*.a" "*.so" "/logs/*")
    for pattern in "${required_ignores[@]}"; do
        if ! grep -q "$pattern" .gitignore; then
            warning ".gitignore missing pattern: $pattern"
            ((git_issues++))
        fi
    done
    
    if [ $git_issues -eq 0 ]; then
        success ".gitignore has required patterns"
    fi
else
    error ".gitignore file missing"
    ((git_issues++))
fi

# Check if .gitattributes exists
if [ -f ".gitattributes" ]; then
    success ".gitattributes file exists"
else
    warning ".gitattributes file missing"
fi

echo ""

# ==========================================
# CHECK 14: Empty Directories with .gitkeep
# ==========================================
info "Check 14: Checking for empty directories without .gitkeep..."
((CHECKS++))

empty_dirs_without_gitkeep=0

# Find empty directories (excluding .git and build) - only within project
while IFS= read -r -d '' dir; do
    # Skip .git and build directories
    if [[ "$dir" == *"/.git/"* ]] || [[ "$dir" == *"/build/"* ]]; then
        continue
    fi
    
    # Only check directories within the project (not parent directories)
    if [[ "$dir" == "./"* ]] || [[ "$dir" == "." ]]; then
        # Check if directory is truly empty (no files, no subdirectories)
        if [ -z "$(ls -A "$dir" 2>/dev/null)" ]; then
            warning "Empty directory without .gitkeep: $dir"
            ((empty_dirs_without_gitkeep++))
        fi
    fi
done < <(find . -maxdepth 10 -type d -empty -print0 2>/dev/null)

if [ $empty_dirs_without_gitkeep -eq 0 ]; then
    success "All empty directories have .gitkeep or contain files"
else
    info "  Found $empty_dirs_without_gitkeep empty directories (consider adding .gitkeep)"
fi
echo ""

# ==========================================
# SUMMARY
# ==========================================
echo "========================================="
echo "Validation Summary"
echo "========================================="
echo ""
echo "Total checks performed: $CHECKS"
echo -e "${RED}Errors: $ERRORS${NC}"
echo -e "${YELLOW}Warnings: $WARNINGS${NC}"
echo ""

if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo -e "${GREEN}✓ Directory structure is PERFECT!${NC}"
    exit 0
elif [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}✓ Directory structure is valid (with warnings)${NC}"
    exit 0
else
    echo -e "${RED}✗ Directory structure validation FAILED${NC}"
    echo "Please fix the errors above and run this script again."
    exit 1
fi
