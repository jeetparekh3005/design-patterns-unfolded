# Design Patterns Unfolded

Cross-language, storytelling-driven exploration of software design patterns implemented in C, C++, Go, TypeScript, Java, and Rust.

## Overview

This repository presents software design patterns through an immersive storytelling experience set in the Kingdom of Gitlantis, where each pattern is a magical artifact with its own legend and practical applications across multiple programming languages.

## Project Structure

```
design-patterns-unfolded/
├── .github/                    # GitHub configuration
│   ├── workflows/              # CI/CD pipelines for all languages
│   ├── ISSUE_TEMPLATE/         # Issue templates (bug, feature, pattern story)
│   ├── PULL_REQUEST_TEMPLATE.md
│   ├── FUNDING.yml
│   └── dependabot.yml
│
├── stories/                    # Narrative framework
│   ├── the-kingdom-of-gitlantis.md  # Main story and world-building
│   ├── characters.md           # Character profiles and relationships
│   └── timeline.md             # Pattern discovery timeline
│
├── patterns/                   # Pattern implementations
│   ├── README.md               # Pattern catalog overview
│   ├── creational/             # Creational patterns
│   │   ├── README.md
│   │   └── singleton/
│   │       ├── README.md       # Pattern overview
│   │       ├── story.md        # Narrative explanation
│   │       ├── technical.md    # Technical documentation
│   │       ├── diagram.svg     # Visual representation
│   │       ├── implementations/
│   │       │   ├── c/          # C implementation
│   │       │   ├── cpp/        # C++ implementation
│   │       │   ├── go/         # Go implementation
│   │       │   ├── typescript/ # TypeScript implementation
│   │       │   ├── java/       # Java implementation
│   │       │   └── rust/       # Rust implementation
│   │       └── exercises/
│   │           └── challenge.md
│   ├── structural/             # Structural patterns (coming soon)
│   └── behavioral/             # Behavioral patterns (coming soon)
│
├── docs/                       # Documentation
│   ├── index.md                # Documentation home
│   ├── getting-started.md      # Beginner's guide
│   ├── learning-paths.md       # Structured learning approaches
│   ├── pattern-catalog.md      # Complete pattern reference
│   ├── faq.md                  # Frequently asked questions
│   └── resources.md            # Additional learning materials
│
├── resources/                  # Learning resources
│   ├── cheatsheet/
│   │   ├── cheatsheet.md       # Pattern quick reference
│   │   └── cheatsheet.pdf      # Printable version
│   ├── diagrams/
│   │   └── pattern-decision-tree.svg
│   └── templates/
│       └── pattern-template.md # Template for new patterns
│
├── scripts/                    # Automation scripts
│   ├── setup.sh                # Environment setup
│   ├── build-all.sh            # Build all implementations
│   ├── test-all.sh             # Run all tests
│   └── generate-pattern.sh     # Generate new pattern structure
│
├── .well-known/                # Standard compliance
│   └── ai-safety.txt
│
├── README.md                   # This file
├── LICENSE                     # MIT License
├── CONTRIBUTING.md             # Contribution guidelines
├── CODE_OF_CONDUCT.md          # Community standards
├── package.json                # npm workspace configuration
├── package-lock.json           # npm dependency lock
├── .gitignore                  # Git ignore rules
├── .gitattributes              # Git file handling
└── .editorconfig               # Editor configuration
```

### Key Components

- **Stories**: Narrative framework set in the Kingdom of Gitlantis with The King, Master Architect, and Pattern Scribe
- **Patterns**: Technical implementations across 6 languages with comprehensive documentation
- **Documentation**: Learning paths, pattern catalogs, and educational resources
- **Resources**: Cheatsheets, diagrams, and templates for pattern development
- **Scripts**: Automated setup, build, test, and pattern generation tools

## Languages Supported

- C (C99)
- C++ (C++17)
- Go (1.21+)
- TypeScript (5.0+)
- Java (17+)
- Rust (1.70+)

## Quick Start

```bash
# Clone the repository
git clone https://github.com/your-username/design-patterns-unfolded.git
cd design-patterns-unfolded

# Run setup script
./scripts/setup.sh

# Build all implementations
./scripts/build-all.sh

# Run all tests
./scripts/test-all.sh
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on contributing to this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
