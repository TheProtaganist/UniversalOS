# validate-structure.ps1
# Validates the UniversalOS directory structure
# Checks for required directories, README files, and orphaned files

# Counters
$script:ERRORS = 0
$script:WARNINGS = 0
$script:CHECKS = 0

# Function to print error
function Write-Error-Message {
    param([string]$Message)
    Write-Host "ERROR: $Message" -ForegroundColor Red
    $script:ERRORS++
}

# Function to print warning
function Write-Warning-Message {
    param([string]$Message)
    Write-Host "WARNING: $Message" -ForegroundColor Yellow
    $script:WARNINGS++
}

# Function to print success
function Write-Success {
    param([string]$Message)
    Write-Host "SUCCESS: $Message" -ForegroundColor Green
}

# Function to print info
function Write-Info {
    param([string]$Message)
    Write-Host $Message
}

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "UniversalOS Directory Structure Validator" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

# Get project root
$PROJECT_ROOT = (Get-Location).Path
Write-Info "Project root: $PROJECT_ROOT"
Write-Host ""

# ==========================================
# CHECK 1: Required Root Directories
# ==========================================
Write-Info "Check 1: Validating required root directories..."
$script:CHECKS++

$required_root_dirs = @(
    ".kiro",
    ".kiro/specs",
    ".kiro/steering",
    ".kiro/settings",
    "src",
    "include",
    "lib",
    "build",
    "tests",
    "docs",
    "scripts",
    "tools",
    "assets",
    "logs",
    "logs/winners"
)

$missing_dirs = 0
foreach ($dir in $required_root_dirs) {
    if (-not (Test-Path -Path $dir -PathType Container)) {
        Write-Error-Message "Required directory missing: $dir"
        $missing_dirs++
    }
}

if ($missing_dirs -eq 0) {
    Write-Success "All required root directories exist"
}
Write-Host ""

# ==========================================
# CHECK 2: Source Code Structure
# ==========================================
Write-Info "Check 2: Validating source code structure..."
$script:CHECKS++

$required_src_dirs = @(
    "src/kernel",
    "src/kernel/arch",
    "src/kernel/drivers",
    "src/kernel/fs",
    "src/kernel/mm",
    "src/helix",
    "src/helix/core",
    "src/helix/state",
    "src/helix/scheduler",
    "src/helix/interface",
    "src/quantum",
    "src/quantum/qutrit",
    "src/quantum/qutrit/state",
    "src/quantum/qutrit/gates",
    "src/quantum/qutrit/simulator",
    "src/quantum/qutrit/hardware",
    "src/quantum/mwave",
    "src/quantum/mwave/equation",
    "src/quantum/mwave/fractal",
    "src/quantum/mwave/encoder",
    "src/quantum/mwave/filesystem",
    "src/quantum/vacuum",
    "src/quantum/vacuum/sampling",
    "src/quantum/vacuum/regularization",
    "src/quantum/vacuum/randomness",
    "src/quantum/vacuum/safety",
    "src/quantum/reversible",
    "src/quantum/reversible/compiler",
    "src/quantum/reversible/garbage",
    "src/quantum/reversible/profiler",
    "src/quantum/reversible/scheduler",
    "src/quantum/deferred",
    "src/quantum/deferred/sandbox",
    "src/quantum/deferred/projection",
    "src/quantum/deferred/coherence",
    "src/quantum/deferred/interface",
    "src/quantum/hybrid",
    "src/quantum/hybrid/router",
    "src/quantum/hybrid/classical",
    "src/quantum/hybrid/quantum",
    "src/quantum/hybrid/optimizer",
    "src/desktop",
    "src/desktop/shell",
    "src/desktop/panel",
    "src/desktop/dock",
    "src/desktop/menu",
    "src/desktop/settings",
    "src/desktop/filemanager",
    "src/desktop/terminal",
    "src/desktop/texteditor",
    "src/desktop/quantum-control",
    "src/bootloader",
    "src/bootloader/uefi",
    "src/bootloader/graphics",
    "src/bootloader/menu",
    "src/bootloader/quantum",
    "src/bootloader/recovery",
    "src/audio",
    "src/audio/kernel",
    "src/audio/alsa",
    "src/audio/pulse",
    "src/audio/quantum",
    "src/audio/midi",
    "src/tools",
    "src/libs"
)

$missing_src_dirs = 0
foreach ($dir in $required_src_dirs) {
    if (-not (Test-Path -Path $dir -PathType Container)) {
        Write-Error-Message "Required source directory missing: $dir"
        $missing_src_dirs++
    }
}

if ($missing_src_dirs -eq 0) {
    Write-Success "All required source directories exist"
}
Write-Host ""

# ==========================================
# CHECK 3: Include Structure
# ==========================================
Write-Info "Check 3: Validating include structure..."
$script:CHECKS++

$required_include_dirs = @(
    "include/helix",
    "include/quantum",
    "include/desktop",
    "include/audio"
)

$missing_include_dirs = 0
foreach ($dir in $required_include_dirs) {
    if (-not (Test-Path -Path $dir -PathType Container)) {
        Write-Error-Message "Required include directory missing: $dir"
        $missing_include_dirs++
    }
}

if ($missing_include_dirs -eq 0) {
    Write-Success "All required include directories exist"
}
Write-Host ""

# ==========================================
# CHECK 4: Test Structure
# ==========================================
Write-Info "Check 4: Validating test structure..."
$script:CHECKS++

$required_test_dirs = @(
    "tests/unit",
    "tests/integration",
    "tests/property",
    "tests/algorithms",
    "tests/fixtures",
    "tests/mocks"
)

$missing_test_dirs = 0
foreach ($dir in $required_test_dirs) {
    if (-not (Test-Path -Path $dir -PathType Container)) {
        Write-Error-Message "Required test directory missing: $dir"
        $missing_test_dirs++
    }
}

if ($missing_test_dirs -eq 0) {
    Write-Success "All required test directories exist"
}
Write-Host ""

# ==========================================
# CHECK 5: Documentation Structure
# ==========================================
Write-Info "Check 5: Validating documentation structure..."
$script:CHECKS++

$required_doc_dirs = @(
    "docs/api",
    "docs/design",
    "docs/guides",
    "docs/guides/user",
    "docs/guides/developer",
    "docs/guides/contributor",
    "docs/theory",
    "docs/architecture"
)

$missing_doc_dirs = 0
foreach ($dir in $required_doc_dirs) {
    if (-not (Test-Path -Path $dir -PathType Container)) {
        Write-Error-Message "Required documentation directory missing: $dir"
        $missing_doc_dirs++
    }
}

if ($missing_doc_dirs -eq 0) {
    Write-Success "All required documentation directories exist"
}
Write-Host ""

# ==========================================
# CHECK 6: Scripts Structure
# ==========================================
Write-Info "Check 6: Validating scripts structure..."
$script:CHECKS++

$required_script_dirs = @(
    "scripts/build",
    "scripts/test",
    "scripts/deploy",
    "scripts/dev",
    "scripts/ci"
)

$missing_script_dirs = 0
foreach ($dir in $required_script_dirs) {
    if (-not (Test-Path -Path $dir -PathType Container)) {
        Write-Error-Message "Required scripts directory missing: $dir"
        $missing_script_dirs++
    }
}

if ($missing_script_dirs -eq 0) {
    Write-Success "All required scripts directories exist"
}
Write-Host ""

# ==========================================
# CHECK 7: Tools Structure
# ==========================================
Write-Info "Check 7: Validating tools structure..."
$script:CHECKS++

$required_tool_dirs = @(
    "tools/algorithm-tester",
    "tools/quantum-debugger",
    "tools/mwave-analyzer",
    "tools/performance-profiler"
)

$missing_tool_dirs = 0
foreach ($dir in $required_tool_dirs) {
    if (-not (Test-Path -Path $dir -PathType Container)) {
        Write-Error-Message "Required tools directory missing: $dir"
        $missing_tool_dirs++
    }
}

if ($missing_tool_dirs -eq 0) {
    Write-Success "All required tools directories exist"
}
Write-Host ""

# ==========================================
# CHECK 8: Assets Structure
# ==========================================
Write-Info "Check 8: Validating assets structure..."
$script:CHECKS++

$required_asset_dirs = @(
    "assets/images",
    "assets/images/wallpapers",
    "assets/fonts",
    "assets/icons",
    "assets/icons/cutefish",
    "assets/icons/quantum"
)

$missing_asset_dirs = 0
foreach ($dir in $required_asset_dirs) {
    if (-not (Test-Path -Path $dir -PathType Container)) {
        Write-Error-Message "Required assets directory missing: $dir"
        $missing_asset_dirs++
    }
}

if ($missing_asset_dirs -eq 0) {
    Write-Success "All required assets directories exist"
}
Write-Host ""

# ==========================================
# CHECK 9: README Files in Major Directories
# ==========================================
Write-Info "Check 9: Validating README files in major directories..."
$script:CHECKS++

$required_readmes = @(
    "README.md",
    "src/kernel/README.md",
    "src/helix/README.md",
    "src/quantum/README.md",
    "src/desktop/README.md",
    "src/bootloader/README.md",
    "src/audio/README.md",
    "src/tools/README.md",
    "src/libs/README.md",
    "docs/api/README.md",
    "docs/design/README.md",
    "docs/guides/README.md",
    "docs/guides/user/README.md",
    "docs/guides/developer/README.md",
    "docs/guides/contributor/README.md",
    "docs/theory/README.md",
    "docs/architecture/README.md",
    "scripts/build/README.md",
    "scripts/test/README.md",
    "scripts/deploy/README.md",
    "scripts/dev/README.md",
    "scripts/ci/README.md",
    "assets/images/README.md",
    "assets/images/wallpapers/README.md",
    "assets/fonts/README.md",
    "assets/icons/README.md",
    "assets/icons/cutefish/README.md",
    "assets/icons/quantum/README.md"
)

$missing_readmes = 0
foreach ($readme in $required_readmes) {
    if (-not (Test-Path -Path $readme -PathType Leaf)) {
        Write-Warning-Message "README file missing: $readme"
        $missing_readmes++
    }
}

if ($missing_readmes -eq 0) {
    Write-Success "All required README files exist"
} else {
    Write-Info "  Found $missing_readmes missing README files (warnings only)"
}
Write-Host ""

# ==========================================
# CHECK 10: Root Configuration Files
# ==========================================
Write-Info "Check 10: Validating root configuration files..."
$script:CHECKS++

$required_root_files = @(
    "README.md",
    "LICENSE",
    "CONTRIBUTING.md",
    "CODE_OF_CONDUCT.md",
    "CHANGELOG.md",
    ".gitignore",
    ".gitattributes",
    "Makefile",
    "CMakeLists.txt"
)

$missing_root_files = 0
foreach ($file in $required_root_files) {
    if (-not (Test-Path -Path $file -PathType Leaf)) {
        Write-Error-Message "Required root file missing: $file"
        $missing_root_files++
    }
}

if ($missing_root_files -eq 0) {
    Write-Success "All required root configuration files exist"
}
Write-Host ""

# ==========================================
# CHECK 11: Orphaned Source Files in Root
# ==========================================
Write-Info "Check 11: Checking for orphaned source files in root directory..."
$script:CHECKS++

$orphaned_files = 0

# Check for C/C++ source files in root
$cpp_files = Get-ChildItem -Path . -Filter "*.c" -File -ErrorAction SilentlyContinue
$cpp_files += Get-ChildItem -Path . -Filter "*.cpp" -File -ErrorAction SilentlyContinue
$cpp_files += Get-ChildItem -Path . -Filter "*.cc" -File -ErrorAction SilentlyContinue
$cpp_files += Get-ChildItem -Path . -Filter "*.cxx" -File -ErrorAction SilentlyContinue

if ($cpp_files.Count -gt 0) {
    Write-Error-Message "Found C/C++ source files in root directory (should be in src/)"
    foreach ($file in $cpp_files) {
        Write-Error-Message "  - $($file.Name)"
    }
    $orphaned_files++
}

# Check for Rust source files in root
$rust_files = Get-ChildItem -Path . -Filter "*.rs" -File -ErrorAction SilentlyContinue
if ($rust_files.Count -gt 0) {
    Write-Error-Message "Found Rust source files in root directory (should be in src/)"
    foreach ($file in $rust_files) {
        Write-Error-Message "  - $($file.Name)"
    }
    $orphaned_files++
}

# Check for Python source files in root (excluding setup.py, etc.)
$py_files = Get-ChildItem -Path . -Filter "*.py" -File -ErrorAction SilentlyContinue | 
    Where-Object { $_.Name -notmatch '^(setup|configure|build)\.py$' }
if ($py_files.Count -gt 0) {
    Write-Warning-Message "Found Python source files in root directory (consider moving to src/)"
    foreach ($file in $py_files) {
        Write-Warning-Message "  - $($file.Name)"
    }
}

# Check for Julia source files in root
$jl_files = Get-ChildItem -Path . -Filter "*.jl" -File -ErrorAction SilentlyContinue
if ($jl_files.Count -gt 0) {
    Write-Error-Message "Found Julia source files in root directory (should be in src/)"
    foreach ($file in $jl_files) {
        Write-Error-Message "  - $($file.Name)"
    }
    $orphaned_files++
}

# Check for header files in root
$header_files = Get-ChildItem -Path . -Filter "*.h" -File -ErrorAction SilentlyContinue
$header_files += Get-ChildItem -Path . -Filter "*.hpp" -File -ErrorAction SilentlyContinue
$header_files += Get-ChildItem -Path . -Filter "*.hxx" -File -ErrorAction SilentlyContinue

if ($header_files.Count -gt 0) {
    Write-Error-Message "Found header files in root directory (should be in include/)"
    foreach ($file in $header_files) {
        Write-Error-Message "  - $($file.Name)"
    }
    $orphaned_files++
}

if ($orphaned_files -eq 0) {
    Write-Success "No orphaned source files in root directory"
}
Write-Host ""

# ==========================================
# CHECK 12: Build Artifacts in Source Tree
# ==========================================
Write-Info "Check 12: Checking for build artifacts in source tree..."
$script:CHECKS++

$build_artifacts = 0

# Check for object files
$obj_files = Get-ChildItem -Path "src","include" -Filter "*.o" -Recurse -File -ErrorAction SilentlyContinue
if ($obj_files.Count -gt 0) {
    Write-Error-Message "Found object files in source tree (should be in build/)"
    $obj_files | Select-Object -First 5 | ForEach-Object {
        Write-Error-Message "  - $($_.FullName)"
    }
    $build_artifacts++
}

# Check for static libraries
$lib_files = Get-ChildItem -Path "src","include" -Filter "*.a" -Recurse -File -ErrorAction SilentlyContinue
if ($lib_files.Count -gt 0) {
    Write-Error-Message "Found static libraries in source tree (should be in build/)"
    $lib_files | Select-Object -First 5 | ForEach-Object {
        Write-Error-Message "  - $($_.FullName)"
    }
    $build_artifacts++
}

# Check for shared libraries
$so_files = Get-ChildItem -Path "src","include" -Include "*.so","*.dylib","*.dll" -Recurse -File -ErrorAction SilentlyContinue
if ($so_files.Count -gt 0) {
    Write-Error-Message "Found shared libraries in source tree (should be in build/)"
    $so_files | Select-Object -First 5 | ForEach-Object {
        Write-Error-Message "  - $($_.FullName)"
    }
    $build_artifacts++
}

if ($build_artifacts -eq 0) {
    Write-Success "No build artifacts found in source tree"
}
Write-Host ""

# ==========================================
# CHECK 13: Git Configuration
# ==========================================
Write-Info "Check 13: Validating Git configuration..."
$script:CHECKS++

$git_issues = 0

# Check if .gitignore exists and has required entries
if (Test-Path -Path ".gitignore" -PathType Leaf) {
    $gitignore_content = Get-Content -Path ".gitignore" -Raw
    $required_ignores = @("/build/", "*.o", "*.a", "*.so", "/logs/*")
    
    foreach ($pattern in $required_ignores) {
        if ($gitignore_content -notmatch [regex]::Escape($pattern)) {
            Write-Warning-Message ".gitignore missing pattern: $pattern"
            $git_issues++
        }
    }
    
    if ($git_issues -eq 0) {
        Write-Success ".gitignore has required patterns"
    }
} else {
    Write-Error-Message ".gitignore file missing"
    $git_issues++
}

# Check if .gitattributes exists
if (Test-Path -Path ".gitattributes" -PathType Leaf) {
    Write-Success ".gitattributes file exists"
} else {
    Write-Warning-Message ".gitattributes file missing"
}

Write-Host ""

# ==========================================
# CHECK 14: Empty Directories with .gitkeep
# ==========================================
Write-Info "Check 14: Checking for empty directories without .gitkeep..."
$script:CHECKS++

$empty_dirs_without_gitkeep = 0

# Find empty directories (excluding .git and build)
$all_dirs = Get-ChildItem -Path . -Directory -Recurse -ErrorAction SilentlyContinue | 
    Where-Object { $_.FullName -notmatch '[\\/]\.git[\\/]' -and $_.FullName -notmatch '[\\/]build[\\/]' }

foreach ($dir in $all_dirs) {
    $items = Get-ChildItem -Path $dir.FullName -Force -ErrorAction SilentlyContinue
    if ($items.Count -eq 0) {
        Write-Warning-Message "Empty directory without .gitkeep: $($dir.FullName.Replace($PROJECT_ROOT, '.'))"
        $empty_dirs_without_gitkeep++
    }
}

if ($empty_dirs_without_gitkeep -eq 0) {
    Write-Success "All empty directories have .gitkeep or contain files"
} else {
    Write-Info "  Found $empty_dirs_without_gitkeep empty directories (consider adding .gitkeep)"
}
Write-Host ""

# ==========================================
# SUMMARY
# ==========================================
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "Validation Summary" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Total checks performed: $script:CHECKS"
Write-Host "Errors: $script:ERRORS" -ForegroundColor Red
Write-Host "Warnings: $script:WARNINGS" -ForegroundColor Yellow
Write-Host ""

if ($script:ERRORS -eq 0 -and $script:WARNINGS -eq 0) {
    Write-Host "Directory structure is PERFECT!" -ForegroundColor Green
    exit 0
} elseif ($script:ERRORS -eq 0) {
    Write-Host "Directory structure is valid (with warnings)" -ForegroundColor Green
    exit 0
} else {
    Write-Host "Directory structure validation FAILED" -ForegroundColor Red
    Write-Host "Please fix the errors above and run this script again."
    exit 1
}
