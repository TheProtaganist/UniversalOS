# UniversalOS - Root Makefile
# Multi-language build system for quantum-enhanced operating system

.PHONY: all clean build test install help
.PHONY: kernel helix quantum desktop bootloader audio tools libs
.PHONY: debug release
.PHONY: test-unit test-integration test-property test-algorithms
.PHONY: docs format check

# Build configuration
BUILD_DIR := build
SRC_DIR := src
INCLUDE_DIR := include
TEST_DIR := tests
DOCS_DIR := docs

# Build type (debug or release)
BUILD_TYPE ?= debug

# Number of parallel jobs
JOBS ?= $(shell nproc 2>/dev/null || echo 4)

# Colors for output
COLOR_RESET := \033[0m
COLOR_GREEN := \033[32m
COLOR_YELLOW := \033[33m
COLOR_BLUE := \033[34m

# Default target
all: build

help:
	@echo "$(COLOR_BLUE)UniversalOS Build System$(COLOR_RESET)"
	@echo ""
	@echo "$(COLOR_GREEN)Main Targets:$(COLOR_RESET)"
	@echo "  all              - Build everything (default)"
	@echo "  build            - Build all components"
	@echo "  clean            - Remove build artifacts"
	@echo "  test             - Run all tests"
	@echo "  install          - Install UniversalOS"
	@echo "  docs             - Generate documentation"
	@echo ""
	@echo "$(COLOR_GREEN)Component Targets:$(COLOR_RESET)"
	@echo "  kernel           - Build Linux kernel modifications"
	@echo "  helix            - Build Helix kernel core"
	@echo "  quantum          - Build quantum computing components"
	@echo "  desktop          - Build Cutefish desktop environment"
	@echo "  bootloader       - Build Helix Boot bootloader"
	@echo "  audio            - Build 432Hz audio system"
	@echo "  tools            - Build system utilities"
	@echo "  libs             - Build internal libraries"
	@echo ""
	@echo "$(COLOR_GREEN)Build Types:$(COLOR_RESET)"
	@echo "  debug            - Build with debug symbols"
	@echo "  release          - Build optimized release"
	@echo ""
	@echo "$(COLOR_GREEN)Test Targets:$(COLOR_RESET)"
	@echo "  test-unit        - Run unit tests"
	@echo "  test-integration - Run integration tests"
	@echo "  test-property    - Run property-based tests"
	@echo "  test-algorithms  - Run algorithm competition tests"
	@echo ""
	@echo "$(COLOR_GREEN)Development Targets:$(COLOR_RESET)"
	@echo "  format           - Format source code"
	@echo "  check            - Run linters and static analysis"
	@echo ""
	@echo "$(COLOR_YELLOW)Usage:$(COLOR_RESET)"
	@echo "  make BUILD_TYPE=release build    - Build release version"
	@echo "  make JOBS=8 build                - Build with 8 parallel jobs"

# Create build directory
$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)/$(BUILD_TYPE)

# Build all components
build: $(BUILD_DIR)
	@echo "$(COLOR_GREEN)Building UniversalOS ($(BUILD_TYPE))...$(COLOR_RESET)"
	@$(MAKE) libs
	@$(MAKE) kernel
	@$(MAKE) helix
	@$(MAKE) quantum
	@$(MAKE) desktop
	@$(MAKE) bootloader
	@$(MAKE) audio
	@$(MAKE) tools
	@echo "$(COLOR_GREEN)Build complete!$(COLOR_RESET)"

# Component builds (delegated to CMake/Cargo)
libs: $(BUILD_DIR)
	@echo "$(COLOR_BLUE)Building internal libraries...$(COLOR_RESET)"
	@cd $(BUILD_DIR)/$(BUILD_TYPE) && cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCOMPONENT=libs ../../ && $(MAKE) -j$(JOBS)

kernel: $(BUILD_DIR)
	@echo "$(COLOR_BLUE)Building kernel modifications...$(COLOR_RESET)"
	@cd $(BUILD_DIR)/$(BUILD_TYPE) && cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCOMPONENT=kernel ../../ && $(MAKE) -j$(JOBS)

helix: $(BUILD_DIR) libs
	@echo "$(COLOR_BLUE)Building Helix kernel...$(COLOR_RESET)"
	@cd $(BUILD_DIR)/$(BUILD_TYPE) && cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCOMPONENT=helix ../../ && $(MAKE) -j$(JOBS)

quantum: $(BUILD_DIR) libs
	@echo "$(COLOR_BLUE)Building quantum components...$(COLOR_RESET)"
	@cd $(BUILD_DIR)/$(BUILD_TYPE) && cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCOMPONENT=quantum ../../ && $(MAKE) -j$(JOBS)
	@if [ -f Cargo.toml ]; then cargo build --package quantum $(if $(filter release,$(BUILD_TYPE)),--release); fi

desktop: $(BUILD_DIR) libs
	@echo "$(COLOR_BLUE)Building desktop environment...$(COLOR_RESET)"
	@cd $(BUILD_DIR)/$(BUILD_TYPE) && cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCOMPONENT=desktop ../../ && $(MAKE) -j$(JOBS)

bootloader: $(BUILD_DIR)
	@echo "$(COLOR_BLUE)Building bootloader...$(COLOR_RESET)"
	@cd $(BUILD_DIR)/$(BUILD_TYPE) && cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCOMPONENT=bootloader ../../ && $(MAKE) -j$(JOBS)

audio: $(BUILD_DIR) libs
	@echo "$(COLOR_BLUE)Building audio system...$(COLOR_RESET)"
	@cd $(BUILD_DIR)/$(BUILD_TYPE) && cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCOMPONENT=audio ../../ && $(MAKE) -j$(JOBS)

tools: $(BUILD_DIR) libs
	@echo "$(COLOR_BLUE)Building system tools...$(COLOR_RESET)"
	@cd $(BUILD_DIR)/$(BUILD_TYPE) && cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCOMPONENT=tools ../../ && $(MAKE) -j$(JOBS)

# Build type targets
debug:
	@$(MAKE) BUILD_TYPE=debug build

release:
	@$(MAKE) BUILD_TYPE=release build

# Testing
test: test-unit test-integration

test-unit: build
	@echo "$(COLOR_BLUE)Running unit tests...$(COLOR_RESET)"
	@cd $(BUILD_DIR)/$(BUILD_TYPE) && ctest --output-on-failure -L unit
	@if [ -f Cargo.toml ]; then cargo test --lib; fi
	@if [ -f pyproject.toml ]; then python -m pytest $(TEST_DIR)/unit; fi

test-integration: build
	@echo "$(COLOR_BLUE)Running integration tests...$(COLOR_RESET)"
	@cd $(BUILD_DIR)/$(BUILD_TYPE) && ctest --output-on-failure -L integration
	@if [ -f Cargo.toml ]; then cargo test --test '*'; fi
	@if [ -f pyproject.toml ]; then python -m pytest $(TEST_DIR)/integration; fi

test-property: build
	@echo "$(COLOR_BLUE)Running property-based tests...$(COLOR_RESET)"
	@cd $(BUILD_DIR)/$(BUILD_TYPE) && ctest --output-on-failure -L property
	@if [ -f Cargo.toml ]; then cargo test --test 'prop_*'; fi
	@if [ -f pyproject.toml ]; then python -m pytest $(TEST_DIR)/property; fi

test-algorithms: build
	@echo "$(COLOR_BLUE)Running algorithm competition tests...$(COLOR_RESET)"
	@bash scripts/test/run-algorithm-tests.sh

# Documentation
docs:
	@echo "$(COLOR_BLUE)Generating documentation...$(COLOR_RESET)"
	@mkdir -p $(BUILD_DIR)/docs
	@cd $(BUILD_DIR)/docs && cmake -DBUILD_DOCS=ON ../../ && $(MAKE) docs
	@if [ -f Cargo.toml ]; then cargo doc --no-deps; fi
	@if [ -f pyproject.toml ]; then cd docs && make html; fi
	@echo "$(COLOR_GREEN)Documentation generated in $(BUILD_DIR)/docs$(COLOR_RESET)"

# Code formatting
format:
	@echo "$(COLOR_BLUE)Formatting source code...$(COLOR_RESET)"
	@find $(SRC_DIR) -name '*.c' -o -name '*.cpp' -o -name '*.h' -o -name '*.hpp' | xargs clang-format -i
	@if [ -f Cargo.toml ]; then cargo fmt; fi
	@if [ -f pyproject.toml ]; then black $(SRC_DIR); fi
	@echo "$(COLOR_GREEN)Code formatted$(COLOR_RESET)"

# Static analysis
check:
	@echo "$(COLOR_BLUE)Running static analysis...$(COLOR_RESET)"
	@if [ -f Cargo.toml ]; then cargo clippy -- -D warnings; fi
	@if [ -f pyproject.toml ]; then pylint $(SRC_DIR); fi
	@echo "$(COLOR_GREEN)Static analysis complete$(COLOR_RESET)"

# Installation
install: build
	@echo "$(COLOR_BLUE)Installing UniversalOS...$(COLOR_RESET)"
	@cd $(BUILD_DIR)/$(BUILD_TYPE) && $(MAKE) install
	@echo "$(COLOR_GREEN)Installation complete$(COLOR_RESET)"

# Clean build artifacts
clean:
	@echo "$(COLOR_YELLOW)Cleaning build artifacts...$(COLOR_RESET)"
	@rm -rf $(BUILD_DIR)
	@if [ -f Cargo.toml ]; then cargo clean; fi
	@find . -type f -name '*.o' -delete
	@find . -type f -name '*.a' -delete
	@find . -type f -name '*.so' -delete
	@find . -type f -name '*.pyc' -delete
	@find . -type d -name '__pycache__' -exec rm -rf {} + 2>/dev/null || true
	@echo "$(COLOR_GREEN)Clean complete$(COLOR_RESET)"

# Distclean - remove all generated files
distclean: clean
	@echo "$(COLOR_YELLOW)Removing all generated files...$(COLOR_RESET)"
	@rm -rf logs/build logs/test logs/debug
	@echo "$(COLOR_GREEN)Distclean complete$(COLOR_RESET)"
