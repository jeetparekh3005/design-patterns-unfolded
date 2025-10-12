#!/bin/bash

# Design Patterns Unfolded - Build All Script
# This script builds all pattern implementations across all supported languages

set -e

echo "========================================"
echo "Building all implementations in the Kingdom of Gitlantis..."
echo "========================================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Build statistics
BUILD_SUCCESS=0
BUILD_FAILED=0
BUILD_TOTAL=0

# Function to build C implementations
build_c() {
    print_status "Building C implementations..."
    
    find patterns -name "Makefile" -path "*/c/*" | while read -r makefile; do
        dir=$(dirname "$makefile")
        BUILD_TOTAL=$((BUILD_TOTAL + 1))
        
        print_status "Building C implementation in $dir"
        
        if make -C "$dir" clean >/dev/null 2>&1 && make -C "$dir" >/dev/null 2>&1; then
            print_success "C build successful in $dir"
            BUILD_SUCCESS=$((BUILD_SUCCESS + 1))
        else
            print_error "C build failed in $dir"
            BUILD_FAILED=$((BUILD_FAILED + 1))
        fi
    done
}

# Function to build C++ implementations
build_cpp() {
    print_status "Building C++ implementations..."
    
    find patterns -name "CMakeLists.txt" -path "*/cpp/*" | while read -r cmakefile; do
        dir=$(dirname "$cmakefile")
        BUILD_TOTAL=$((BUILD_TOTAL + 1))
        
        print_status "Building C++ implementation in $dir"
        
        if cmake -B "$dir/build" -S "$dir" >/dev/null 2>&1 && make -C "$dir/build" >/dev/null 2>&1; then
            print_success "C++ build successful in $dir"
            BUILD_SUCCESS=$((BUILD_SUCCESS + 1))
        else
            print_error "C++ build failed in $dir"
            BUILD_FAILED=$((BUILD_FAILED + 1))
        fi
    done
}

# Function to build Go implementations
build_go() {
    print_status "Building Go implementations..."
    
    find patterns -name "go.mod" -path "*/go/*" | while read -r gomod; do
        dir=$(dirname "$gomod")
        BUILD_TOTAL=$((BUILD_TOTAL + 1))
        
        print_status "Building Go implementation in $dir"
        
        if go build -o "$dir/bin/main" "$dir"/*.go >/dev/null 2>&1; then
            print_success "Go build successful in $dir"
            BUILD_SUCCESS=$((BUILD_SUCCESS + 1))
        else
            print_error "Go build failed in $dir"
            BUILD_FAILED=$((BUILD_FAILED + 1))
        fi
    done
}

# Function to build TypeScript implementations
build_typescript() {
    print_status "Building TypeScript implementations..."
    
    find patterns -name "package.json" -path "*/typescript/*" | while read -r packagejson; do
        dir=$(dirname "$packagejson")
        BUILD_TOTAL=$((BUILD_TOTAL + 1))
        
        print_status "Building TypeScript implementation in $dir"
        
        if [ -f "$dir/package.json" ]; then
            cd "$dir"
            if npm install >/dev/null 2>&1 && npm run build >/dev/null 2>&1; then
                print_success "TypeScript build successful in $dir"
                BUILD_SUCCESS=$((BUILD_SUCCESS + 1))
            else
                print_error "TypeScript build failed in $dir"
                BUILD_FAILED=$((BUILD_FAILED + 1))
            fi
            cd - >/dev/null
        fi
    done
}

# Function to build Java implementations
build_java() {
    print_status "Building Java implementations..."
    
    find patterns -name "build.gradle" -path "*/java/*" | while read -r gradlefile; do
        dir=$(dirname "$gradlefile")
        BUILD_TOTAL=$((BUILD_TOTAL + 1))
        
        print_status "Building Java implementation in $dir"
        
        if [ -f "$dir/gradlew" ]; then
            if "$dir/gradlew" build >/dev/null 2>&1; then
                print_success "Java build successful in $dir"
                BUILD_SUCCESS=$((BUILD_SUCCESS + 1))
            else
                print_error "Java build failed in $dir"
                BUILD_FAILED=$((BUILD_FAILED + 1))
            fi
        fi
    done
}

# Function to build Rust implementations
build_rust() {
    print_status "Building Rust implementations..."
    
    find patterns -name "Cargo.toml" -path "*/rust/*" | while read -r cargotoml; do
        dir=$(dirname "$cargotoml")
        BUILD_TOTAL=$((BUILD_TOTAL + 1))
        
        print_status "Building Rust implementation in $dir"
        
        if cargo build --manifest-path "$cargotoml" >/dev/null 2>&1; then
            print_success "Rust build successful in $dir"
            BUILD_SUCCESS=$((BUILD_SUCCESS + 1))
        else
            print_error "Rust build failed in $dir"
            BUILD_FAILED=$((BUILD_FAILED + 1))
        fi
    done
}

# Function to create build summary
create_build_summary() {
    print_status "Creating build summary..."
    
    cat > build/build-summary.md << EOF
# Build Summary

Generated on: $(date)

## Build Statistics
- **Total Builds**: $BUILD_TOTAL
- **Successful**: $BUILD_SUCCESS
- **Failed**: $BUILD_FAILED
- **Success Rate**: $(( (BUILD_SUCCESS * 100) / BUILD_TOTAL ))%

## Language Breakdown

### C
- **Status**: $(find patterns -name "Makefile" -path "*/c/*" | wc -l) implementations found
- **Build Directory**: build/c/

### C++
- **Status**: $(find patterns -name "CMakeLists.txt" -path "*/cpp/*" | wc -l) implementations found
- **Build Directory**: build/cpp/

### Go
- **Status**: $(find patterns -name "go.mod" -path "*/go/*" | wc -l) implementations found
- **Build Directory**: build/go/

### TypeScript
- **Status**: $(find patterns -name "package.json" -path "*/typescript/*" | wc -l) implementations found
- **Build Directory**: build/typescript/

### Java
- **Status**: $(find patterns -name "build.gradle" -path "*/java/*" | wc -l) implementations found
- **Build Directory**: build/java/

### Rust
- **Status**: $(find patterns -name "Cargo.toml" -path "*/rust/*" | wc -l) implementations found
- **Build Directory**: build/rust/

## Next Steps
1. Run './scripts/test-all.sh' to run all tests
2. Check individual build directories for compiled outputs
3. Review build logs for any warnings or errors
EOF

    print_success "Build summary created at build/build-summary.md"
}

# Function to clean build artifacts
clean_build() {
    print_status "Cleaning build artifacts..."
    
    # Clean C builds
    find patterns -name "Makefile" -path "*/c/*" | while read -r makefile; do
        dir=$(dirname "$makefile")
        make -C "$dir" clean >/dev/null 2>&1 || true
    done
    
    # Clean C++ builds
    find patterns -name "CMakeLists.txt" -path "*/cpp/*" | while read -r cmakefile; do
        dir=$(dirname "$cmakefile")
        rm -rf "$dir/build" >/dev/null 2>&1 || true
    done
    
    # Clean Go builds
    find patterns -name "go.mod" -path "*/go/*" | while read -r gomod; do
        dir=$(dirname "$gomod")
        rm -f "$dir/bin/main" >/dev/null 2>&1 || true
    done
    
    # Clean TypeScript builds
    find patterns -name "package.json" -path "*/typescript/*" | while read -r packagejson; do
        dir=$(dirname "$packagejson")
        if [ -f "$dir/package.json" ]; then
            cd "$dir"
            npm run clean >/dev/null 2>&1 || true
            cd - >/dev/null
        fi
    done
    
    # Clean Java builds
    find patterns -name "build.gradle" -path "*/java/*" | while read -r gradlefile; do
        dir=$(dirname "$gradlefile")
        if [ -f "$dir/gradlew" ]; then
            "$dir/gradlew" clean >/dev/null 2>&1 || true
        fi
    done
    
    # Clean Rust builds
    find patterns -name "Cargo.toml" -path "*/rust/*" | while read -r cargotoml; do
        dir=$(dirname "$cargotoml")
        cargo clean --manifest-path "$cargotoml" >/dev/null 2>&1 || true
    done
    
    print_success "Build artifacts cleaned"
}

# Main build function
main() {
    echo ""
    echo "========================================"
    echo "Design Patterns Unfolded - Build All Script"
    echo "========================================"
    echo ""
    
    # Parse command line arguments
    CLEAN=false
    SUMMARY=true
    
    while [[ $# -gt 0 ]]; do
        case $1 in
            --clean)
                CLEAN=true
                shift
                ;;
            --no-summary)
                SUMMARY=false
                shift
                ;;
            -h|--help)
                echo "Usage: $0 [--clean] [--no-summary]"
                echo ""
                echo "Options:"
                echo "  --clean       Clean build artifacts before building"
                echo "  --no-summary  Skip creating build summary"
                echo "  -h, --help    Show this help message"
                exit 0
                ;;
            *)
                print_error "Unknown option: $1"
                exit 1
                ;;
        esac
    done
    
    # Clean if requested
    if [ "$CLEAN" = true ]; then
        clean_build
    fi
    
    # Create build directories
    mkdir -p build/{c,cpp,go,typescript,java,rust}
    mkdir -p dist/{c,cpp,go,typescript,java,rust}
    mkdir -p logs
    
    # Build all implementations
    build_c
    build_cpp
    build_go
    build_typescript
    build_java
    build_rust
    
    # Create build summary if requested
    if [ "$SUMMARY" = true ]; then
        create_build_summary
    fi
    
    echo ""
    echo "========================================"
    print_success "Build completed!"
    echo "========================================"
    echo ""
    echo "Build Statistics:"
    echo "  - Total Builds: $BUILD_TOTAL"
    echo "  - Successful: $BUILD_SUCCESS"
    echo "  - Failed: $BUILD_FAILED"
    echo "  - Success Rate: $(( (BUILD_SUCCESS * 100) / BUILD_TOTAL ))%"
    echo ""
    echo "Next steps:"
    echo "1. Run './scripts/test-all.sh' to run all tests"
    echo "2. Check build/build-summary.md for detailed results"
    echo "3. Explore the compiled implementations in build/ directories"
    echo ""
    echo "The Kingdom of Gitlantis implementations are ready!"
}

# Run main function
main "$@"
