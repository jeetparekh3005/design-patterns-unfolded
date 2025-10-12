#!/bin/bash

# Design Patterns Unfolded - Test All Script
# This script runs all tests for pattern implementations across all supported languages

set -e

echo "========================================"
echo "Testing all implementations in the Kingdom of Gitlantis..."
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

# Test statistics
TEST_SUCCESS=0
TEST_FAILED=0
TEST_TOTAL=0

# Function to test C implementations
test_c() {
    print_status "Testing C implementations..."
    
    find patterns -name "Makefile" -path "*/c/*" | while read -r makefile; do
        dir=$(dirname "$makefile")
        TEST_TOTAL=$((TEST_TOTAL + 1))
        
        print_status "Testing C implementation in $dir"
        
        if make -C "$dir" test >/dev/null 2>&1; then
            print_success "C tests passed in $dir"
            TEST_SUCCESS=$((TEST_SUCCESS + 1))
        else
            print_error "C tests failed in $dir"
            TEST_FAILED=$((TEST_FAILED + 1))
        fi
    done
}

# Function to test C++ implementations
test_cpp() {
    print_status "Testing C++ implementations..."
    
    find patterns -name "CMakeLists.txt" -path "*/cpp/*" | while read -r cmakefile; do
        dir=$(dirname "$cmakefile")
        TEST_TOTAL=$((TEST_TOTAL + 1))
        
        print_status "Testing C++ implementation in $dir"
        
        if cmake -B "$dir/build" -S "$dir" >/dev/null 2>&1 && make -C "$dir/build" test >/dev/null 2>&1; then
            print_success "C++ tests passed in $dir"
            TEST_SUCCESS=$((TEST_SUCCESS + 1))
        else
            print_error "C++ tests failed in $dir"
            TEST_FAILED=$((TEST_FAILED + 1))
        fi
    done
}

# Function to test Go implementations
test_go() {
    print_status "Testing Go implementations..."
    
    find patterns -name "go.mod" -path "*/go/*" | while read -r gomod; do
        dir=$(dirname "$gomod")
        TEST_TOTAL=$((TEST_TOTAL + 1))
        
        print_status "Testing Go implementation in $dir"
        
        if go test "$dir"/*.go >/dev/null 2>&1; then
            print_success "Go tests passed in $dir"
            TEST_SUCCESS=$((TEST_SUCCESS + 1))
        else
            print_error "Go tests failed in $dir"
            TEST_FAILED=$((TEST_FAILED + 1))
        fi
    done
}

# Function to test TypeScript implementations
test_typescript() {
    print_status "Testing TypeScript implementations..."
    
    find patterns -name "package.json" -path "*/typescript/*" | while read -r packagejson; do
        dir=$(dirname "$packagejson")
        TEST_TOTAL=$((TEST_TOTAL + 1))
        
        print_status "Testing TypeScript implementation in $dir"
        
        if [ -f "$dir/package.json" ]; then
            cd "$dir"
            if npm install >/dev/null 2>&1 && npm test >/dev/null 2>&1; then
                print_success "TypeScript tests passed in $dir"
                TEST_SUCCESS=$((TEST_SUCCESS + 1))
            else
                print_error "TypeScript tests failed in $dir"
                TEST_FAILED=$((TEST_FAILED + 1))
            fi
            cd - >/dev/null
        fi
    done
}

# Function to test Java implementations
test_java() {
    print_status "Testing Java implementations..."
    
    find patterns -name "build.gradle" -path "*/java/*" | while read -r gradlefile; do
        dir=$(dirname "$gradlefile")
        TEST_TOTAL=$((TEST_TOTAL + 1))
        
        print_status "Testing Java implementation in $dir"
        
        if [ -f "$dir/gradlew" ]; then
            if "$dir/gradlew" test >/dev/null 2>&1; then
                print_success "Java tests passed in $dir"
                TEST_SUCCESS=$((TEST_SUCCESS + 1))
            else
                print_error "Java tests failed in $dir"
                TEST_FAILED=$((TEST_FAILED + 1))
            fi
        fi
    done
}

# Function to test Rust implementations
test_rust() {
    print_status "Testing Rust implementations..."
    
    find patterns -name "Cargo.toml" -path "*/rust/*" | while read -r cargotoml; do
        dir=$(dirname "$cargotoml")
        TEST_TOTAL=$((TEST_TOTAL + 1))
        
        print_status "Testing Rust implementation in $dir"
        
        if cargo test --manifest-path "$cargotoml" >/dev/null 2>&1; then
            print_success "Rust tests passed in $dir"
            TEST_SUCCESS=$((TEST_SUCCESS + 1))
        else
            print_error "Rust tests failed in $dir"
            TEST_FAILED=$((TEST_FAILED + 1))
        fi
    done
}

# Function to create test summary
create_test_summary() {
    print_status "Creating test summary..."
    
    cat > build/test-summary.md << EOF
# Test Summary

Generated on: $(date)

## Test Statistics
- **Total Tests**: $TEST_TOTAL
- **Passed**: $TEST_SUCCESS
- **Failed**: $TEST_FAILED
- **Success Rate**: $(( (TEST_SUCCESS * 100) / TEST_TOTAL ))%

## Language Breakdown

### C
- **Status**: $(find patterns -name "Makefile" -path "*/c/*" | wc -l) implementations found
- **Test Directory**: build/c/

### C++
- **Status**: $(find patterns -name "CMakeLists.txt" -path "*/cpp/*" | wc -l) implementations found
- **Test Directory**: build/cpp/

### Go
- **Status**: $(find patterns -name "go.mod" -path "*/go/*" | wc -l) implementations found
- **Test Directory**: build/go/

### TypeScript
- **Status**: $(find patterns -name "package.json" -path "*/typescript/*" | wc -l) implementations found
- **Test Directory**: build/typescript/

### Java
- **Status**: $(find patterns -name "build.gradle" -path "*/java/*" | wc -l) implementations found
- **Test Directory**: build/java/

### Rust
- **Status**: $(find patterns -name "Cargo.toml" -path "*/rust/*" | wc -l) implementations found
- **Test Directory**: build/rust/

## Test Results
- **Pass Rate**: $(( (TEST_SUCCESS * 100) / TEST_TOTAL ))%
- **Failure Rate**: $(( (TEST_FAILED * 100) / TEST_TOTAL ))%

## Next Steps
1. Review failed tests and fix issues
2. Check test logs for detailed error information
3. Run individual language tests for debugging
4. Update implementations based on test results
EOF

    print_success "Test summary created at build/test-summary.md"
}

# Function to run specific language tests
run_language_tests() {
    local language=$1
    
    case $language in
        c)
            test_c
            ;;
        cpp)
            test_cpp
            ;;
        go)
            test_go
            ;;
        typescript)
            test_typescript
            ;;
        java)
            test_java
            ;;
        rust)
            test_rust
            ;;
        *)
            print_error "Unknown language: $language"
            echo "Supported languages: c, cpp, go, typescript, java, rust"
            exit 1
            ;;
    esac
}

# Function to run all tests
run_all_tests() {
    test_c
    test_cpp
    test_go
    test_typescript
    test_java
    test_rust
}

# Function to clean test artifacts
clean_tests() {
    print_status "Cleaning test artifacts..."
    
    # Clean C test artifacts
    find patterns -name "Makefile" -path "*/c/*" | while read -r makefile; do
        dir=$(dirname "$makefile")
        make -C "$dir" clean >/dev/null 2>&1 || true
    done
    
    # Clean C++ test artifacts
    find patterns -name "CMakeLists.txt" -path "*/cpp/*" | while read -r cmakefile; do
        dir=$(dirname "$cmakefile")
        rm -rf "$dir/build" >/dev/null 2>&1 || true
    done
    
    # Clean Go test artifacts
    find patterns -name "go.mod" -path "*/go/*" | while read -r gomod; do
        dir=$(dirname "$gomod")
        go clean -testcache >/dev/null 2>&1 || true
    done
    
    # Clean TypeScript test artifacts
    find patterns -name "package.json" -path "*/typescript/*" | while read -r packagejson; do
        dir=$(dirname "$packagejson")
        if [ -f "$dir/package.json" ]; then
            cd "$dir"
            npm run clean >/dev/null 2>&1 || true
            cd - >/dev/null
        fi
    done
    
    # Clean Java test artifacts
    find patterns -name "build.gradle" -path "*/java/*" | while read -r gradlefile; do
        dir=$(dirname "$gradlefile")
        if [ -f "$dir/gradlew" ]; then
            "$dir/gradlew" clean >/dev/null 2>&1 || true
        fi
    done
    
    # Clean Rust test artifacts
    find patterns -name "Cargo.toml" -path "*/rust/*" | while read -r cargotoml; do
        dir=$(dirname "$cargotoml")
        cargo clean --manifest-path "$cargotoml" >/dev/null 2>&1 || true
    done
    
    print_success "Test artifacts cleaned"
}

# Main test function
main() {
    echo ""
    echo "========================================"
    echo "Design Patterns Unfolded - Test All Script"
    echo "========================================"
    echo ""
    
    # Parse command line arguments
    LANGUAGE=""
    CLEAN=false
    SUMMARY=true
    
    while [[ $# -gt 0 ]]; do
        case $1 in
            --language)
                LANGUAGE="$2"
                shift 2
                ;;
            --clean)
                CLEAN=true
                shift
                ;;
            --no-summary)
                SUMMARY=false
                shift
                ;;
            -h|--help)
                echo "Usage: $0 [--language LANG] [--clean] [--no-summary]"
                echo ""
                echo "Options:"
                echo "  --language LANG  Test specific language (c, cpp, go, typescript, java, rust)"
                echo "  --clean          Clean test artifacts before testing"
                echo "  --no-summary     Skip creating test summary"
                echo "  -h, --help       Show this help message"
                echo ""
                echo "Examples:"
                echo "  $0                    # Test all languages"
                echo "  $0 --language go      # Test only Go implementations"
                echo "  $0 --clean            # Clean and test all"
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
        clean_tests
    fi
    
    # Create test directories
    mkdir -p build/{c,cpp,go,typescript,java,rust}
    mkdir -p logs
    
    # Run tests based on language selection
    if [ -n "$LANGUAGE" ]; then
        run_language_tests "$LANGUAGE"
    else
        run_all_tests
    fi
    
    # Create test summary if requested
    if [ "$SUMMARY" = true ]; then
        create_test_summary
    fi
    
    echo ""
    echo "========================================"
    print_success "Testing completed!"
    echo "========================================"
    echo ""
    echo "Test Statistics:"
    echo "  - Total Tests: $TEST_TOTAL"
    echo "  - Passed: $TEST_SUCCESS"
    echo "  - Failed: $TEST_FAILED"
    echo "  - Success Rate: $(( (TEST_SUCCESS * 100) / TEST_TOTAL ))%"
    echo ""
    echo "Next steps:"
    echo "1. Review build/test-summary.md for detailed results"
    echo "2. Fix any failed tests"
    echo "3. Run individual language tests for debugging"
    echo "4. Check test logs for error details"
    echo ""
    echo "The Kingdom of Gitlantis tests are complete!"
}

# Run main function
main "$@"
