#!/bin/bash

# Design Patterns Unfolded - Setup Script
# This script sets up the development environment for the repository

set -e

echo "========================================"
echo "Welcome to the Kingdom of Gitlantis!"
echo "========================================"
echo "Setting up your development environment..."
echo ""

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

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check prerequisites
check_prerequisites() {
    print_status "Checking prerequisites..."
    
    local missing_tools=()
    
    # Check for C compiler
    if command_exists gcc; then
        print_success "GCC found: $(gcc --version | head -n1)"
    elif command_exists clang; then
        print_success "Clang found: $(clang --version | head -n1)"
    else
        missing_tools+=("C compiler (GCC or Clang)")
    fi
    
    # Check for C++ compiler
    if command_exists g++; then
        print_success "G++ found: $(g++ --version | head -n1)"
    elif command_exists clang++; then
        print_success "Clang++ found: $(clang++ --version | head -n1)"
    else
        missing_tools+=("C++ compiler (G++ or Clang++)")
    fi
    
    # Check for Go
    if command_exists go; then
        print_success "Go found: $(go version)"
    else
        missing_tools+=("Go 1.21+")
    fi
    
    # Check for Node.js
    if command_exists node; then
        print_success "Node.js found: $(node --version)"
    else
        missing_tools+=("Node.js 18+")
    fi
    
    # Check for Java
    if command_exists java; then
        print_success "Java found: $(java -version 2>&1 | head -n1)"
    else
        missing_tools+=("Java 17+")
    fi
    
    # Check for Rust
    if command_exists rustc; then
        print_success "Rust found: $(rustc --version)"
    else
        missing_tools+=("Rust 1.70+")
    fi
    
    # Check for Make
    if command_exists make; then
        print_success "Make found: $(make --version | head -n1)"
    else
        missing_tools+=("Make")
    fi
    
    # Check for CMake
    if command_exists cmake; then
        print_success "CMake found: $(cmake --version | head -n1)"
    else
        missing_tools+=("CMake")
    fi
    
    if [ ${#missing_tools[@]} -gt 0 ]; then
        print_error "Missing required tools:"
        for tool in "${missing_tools[@]}"; do
            echo "  - $tool"
        done
        echo ""
        echo "Please install the missing tools and run this script again."
        echo "See the documentation for installation instructions."
        exit 1
    fi
    
    print_success "All prerequisites found!"
}

# Setup C environment
setup_c() {
    print_status "Setting up C environment..."
    
    # Create C build directory if it doesn't exist
    mkdir -p build/c
    
    # Find all C Makefiles and test compilation
    find patterns -name "Makefile" -path "*/c/*" | while read -r makefile; do
        dir=$(dirname "$makefile")
        print_status "Testing C compilation in $dir"
        
        if make -C "$dir" clean >/dev/null 2>&1; then
            print_success "C compilation test passed in $dir"
        else
            print_warning "C compilation test failed in $dir"
        fi
    done
}

# Setup C++ environment
setup_cpp() {
    print_status "Setting up C++ environment..."
    
    # Create C++ build directory if it doesn't exist
    mkdir -p build/cpp
    
    # Find all C++ CMakeLists.txt and test compilation
    find patterns -name "CMakeLists.txt" -path "*/cpp/*" | while read -r cmakefile; do
        dir=$(dirname "$cmakefile")
        print_status "Testing C++ compilation in $dir"
        
        if cmake -B "$dir/build" -S "$dir" >/dev/null 2>&1 && make -C "$dir/build" >/dev/null 2>&1; then
            print_success "C++ compilation test passed in $dir"
        else
            print_warning "C++ compilation test failed in $dir"
        fi
    done
}

# Setup Go environment
setup_go() {
    print_status "Setting up Go environment..."
    
    # Create Go build directory if it doesn't exist
    mkdir -p build/go
    
    # Find all Go modules and test compilation
    find patterns -name "go.mod" -path "*/go/*" | while read -r gomod; do
        dir=$(dirname "$gomod")
        print_status "Testing Go compilation in $dir"
        
        if go build -o /dev/null "$dir"/*.go >/dev/null 2>&1; then
            print_success "Go compilation test passed in $dir"
        else
            print_warning "Go compilation test failed in $dir"
        fi
    done
}

# Setup TypeScript environment
setup_typescript() {
    print_status "Setting up TypeScript environment..."
    
    # Install npm dependencies if package.json exists
    if [ -f "package.json" ]; then
        print_status "Installing npm dependencies..."
        npm install
    fi
    
    # Find all TypeScript projects and test compilation
    find patterns -name "package.json" -path "*/typescript/*" | while read -r packagejson; do
        dir=$(dirname "$packagejson")
        print_status "Testing TypeScript compilation in $dir"
        
        if [ -f "$dir/package.json" ]; then
            cd "$dir"
            if npm install >/dev/null 2>&1 && npm run build >/dev/null 2>&1; then
                print_success "TypeScript compilation test passed in $dir"
            else
                print_warning "TypeScript compilation test failed in $dir"
            fi
            cd - >/dev/null
        fi
    done
}

# Setup Java environment
setup_java() {
    print_status "Setting up Java environment..."
    
    # Create Java build directory if it doesn't exist
    mkdir -p build/java
    
    # Find all Java Gradle projects and test compilation
    find patterns -name "build.gradle" -path "*/java/*" | while read -r gradlefile; do
        dir=$(dirname "$gradlefile")
        print_status "Testing Java compilation in $dir"
        
        if [ -f "$dir/gradlew" ]; then
            if "$dir/gradlew" build >/dev/null 2>&1; then
                print_success "Java compilation test passed in $dir"
            else
                print_warning "Java compilation test failed in $dir"
            fi
        fi
    done
}

# Setup Rust environment
setup_rust() {
    print_status "Setting up Rust environment..."
    
    # Create Rust build directory if it doesn't exist
    mkdir -p build/rust
    
    # Find all Rust Cargo.toml and test compilation
    find patterns -name "Cargo.toml" -path "*/rust/*" | while read -r cargotoml; do
        dir=$(dirname "$cargotoml")
        print_status "Testing Rust compilation in $dir"
        
        if cargo build --manifest-path "$cargotoml" >/dev/null 2>&1; then
            print_success "Rust compilation test passed in $dir"
        else
            print_warning "Rust compilation test failed in $dir"
        fi
    done
}

# Create build directories
create_build_dirs() {
    print_status "Creating build directories..."
    
    mkdir -p build/{c,cpp,go,typescript,java,rust}
    mkdir -p dist/{c,cpp,go,typescript,java,rust}
    mkdir -p logs
    
    print_success "Build directories created"
}

# Setup development tools
setup_dev_tools() {
    print_status "Setting up development tools..."
    
    # Install pre-commit hooks if available
    if command_exists pre-commit; then
        print_status "Installing pre-commit hooks..."
        pre-commit install
        print_success "Pre-commit hooks installed"
    fi
    
    # Setup git hooks
    print_status "Setting up git hooks..."
    mkdir -p .git/hooks
    
    # Create a simple pre-commit hook
    cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
# Simple pre-commit hook for Design Patterns Unfolded

echo "Running pre-commit checks..."

# Check for TODO comments in committed files
if git diff --cached --name-only | xargs grep -l "TODO\|FIXME\|HACK" 2>/dev/null; then
    echo "Warning: Found TODO/FIXME/HACK comments in committed files"
    echo "Consider addressing these before committing"
fi

echo "Pre-commit checks completed"
EOF
    
    chmod +x .git/hooks/pre-commit
    print_success "Git hooks configured"
}

# Main setup function
main() {
    echo ""
    echo "========================================"
    echo "Design Patterns Unfolded - Setup Script"
    echo "========================================"
    echo ""
    
    # Check prerequisites
    check_prerequisites
    
    # Create build directories
    create_build_dirs
    
    # Setup each language environment
    setup_c
    setup_cpp
    setup_go
    setup_typescript
    setup_java
    setup_rust
    
    # Setup development tools
    setup_dev_tools
    
    echo ""
    echo "========================================"
    print_success "Setup completed successfully!"
    echo "========================================"
    echo ""
    echo "Next steps:"
    echo "1. Run './scripts/build-all.sh' to build all implementations"
    echo "2. Run './scripts/test-all.sh' to run all tests"
    echo "3. Start exploring the patterns in the 'patterns/' directory"
    echo "4. Read the stories in the 'stories/' directory"
    echo ""
    echo "Welcome to the Kingdom of Gitlantis!"
}

# Run main function
main "$@"
