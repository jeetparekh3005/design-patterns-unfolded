# Pattern Catalog

A comprehensive catalog of all design patterns available in the Kingdom of Gitlantis, organized by category and implementation status.

## Pattern Categories

### Creational Patterns
Patterns that deal with object creation mechanisms, trying to create objects in a manner suitable to the situation.

| Pattern | Status | Story | Technical | Implementations | Exercises |
|---------|--------|-------|-----------|-----------------|-----------|
| **Singleton** | Complete | | | All 6 languages | |
| **Factory Method** | In Progress | | | All 6 languages | |
| **Abstract Factory** | Planned | | | | |
| **Builder** | Planned | | | | |
| **Prototype** | Planned | | | | |

### Structural Patterns
Patterns that deal with object composition and relationships between entities.

| Pattern | Status | Story | Technical | Implementations | Exercises |
|---------|--------|-------|-----------|-----------------|-----------|
| **Adapter** | Planned | | | | |
| **Bridge** | Planned | | | | |
| **Composite** | Planned | | | | |
| **Decorator** | Planned | | | | |
| **Facade** | Planned | | | | |
| **Flyweight** | Planned | | | | |
| **Proxy** | Planned | | | | |

### Behavioral Patterns
Patterns that deal with communication between objects and the assignment of responsibilities.

| Pattern | Status | Story | Technical | Implementations | Exercises |
|---------|--------|-------|-----------|-----------------|-----------|
| **Observer** | Planned | | | | |
| **Strategy** | Planned | | | | |
| **Command** | Planned | | | | |
| **State** | Planned | | | | |
| **Template Method** | Planned | | | | |
| **Visitor** | Planned | | | | |
| **Chain of Responsibility** | Planned | | | | |
| **Iterator** | Planned | | | | |
| **Mediator** | Planned | | | | |
| **Memento** | Planned | | | | |

## Status Legend

- **Complete**: Story, technical docs, implementations, and exercises ready
- **In Progress**: Currently being developed
- **Planned**: Scheduled for development
- **Not Started**: Not yet planned

## Implementation Languages

All patterns are implemented in six programming languages:

### C (C99)
- **Target**: System programming and embedded systems
- **Features**: Manual memory management, low-level control
- **Use Cases**: Operating systems, embedded devices, performance-critical applications

### C++ (C++17)
- **Target**: Object-oriented programming
- **Features**: Classes, inheritance, polymorphism, RAII
- **Use Cases**: Game development, desktop applications, system software

### Go (1.21+)
- **Target**: Concurrent and modern system design
- **Features**: Goroutines, channels, interfaces, garbage collection
- **Use Cases**: Web services, microservices, distributed systems

### TypeScript (5.0+)
- **Target**: Web development and type safety
- **Features**: Static typing, interfaces, generics, modern JavaScript
- **Use Cases**: Web applications, Node.js services, frontend frameworks

### Java (17+)
- **Target**: Enterprise applications
- **Features**: Platform independence, strong typing, extensive libraries
- **Use Cases**: Enterprise software, Android development, large-scale applications

### Rust (1.70+)
- **Target**: Memory-safe systems programming
- **Features**: Ownership system, zero-cost abstractions, memory safety
- **Use Cases**: System programming, web assembly, performance-critical applications

## Pattern Details

### Singleton Pattern
**The Crown of Unity** - Ensures a class has only one instance and provides global access to it.

- **Story**: The Architect King's crown - there can be only one true ruler
- **Problem**: Need for a single instance of a class
- **Solution**: Private constructor, static instance, global access
- **Use Cases**: Database connections, logging, configuration
- **Trade-offs**: Global state vs. controlled access

### Factory Method Pattern
**The Forge of Creation** - Creates objects without specifying their exact classes.

- **Story**: The magical forge that creates tools based on materials
- **Problem**: Need to create objects without knowing their exact types
- **Solution**: Abstract factory method, concrete implementations
- **Use Cases**: UI components, database drivers, plugin systems
- **Trade-offs**: Flexibility vs. complexity

### Abstract Factory Pattern
**The Master Builder's Workshop** - Creates families of related objects.

- **Story**: The master builder who creates matching furniture sets
- **Problem**: Need to create families of related objects
- **Solution**: Abstract factory interface, concrete factory implementations
- **Use Cases**: UI themes, database abstractions, cross-platform components
- **Trade-offs**: Consistency vs. complexity

### Builder Pattern
**The Architect's Blueprint** - Constructs complex objects step by step.

- **Story**: The architect who builds castles one room at a time
- **Problem**: Complex object construction with many optional parts
- **Solution**: Step-by-step construction, fluent interface
- **Use Cases**: Configuration objects, query builders, document parsers
- **Trade-offs**: Readability vs. verbosity

### Prototype Pattern
**The Clone Master** - Creates objects by cloning existing instances.

- **Story**: The magical mirror that creates perfect copies
- **Problem**: Expensive object creation or need for similar objects
- **Solution**: Clone existing instances, customize as needed
- **Use Cases**: Game objects, document templates, configuration presets
- **Trade-offs**: Performance vs. memory usage

## Learning Recommendations

### Beginner Path
1. **Start with Singleton** - Simple and widely used
2. **Learn Factory Method** - Common in many applications
3. **Explore Builder** - Great for complex object creation
4. **Study Observer** - Essential for event-driven programming

### Intermediate Path
1. **Master Creational Patterns** - Understand object creation
2. **Learn Structural Patterns** - Understand object composition
3. **Study Behavioral Patterns** - Understand object interaction
4. **Combine Patterns** - Use multiple patterns together

### Advanced Path
1. **Deep Dive into Each Category** - Master all patterns
2. **Study Pattern Relationships** - How patterns work together
3. **Create New Patterns** - Identify and document new patterns
4. **Contribute to the Repository** - Share your knowledge

## Contributing to the Catalog

### Adding New Patterns
1. **Choose a Pattern** - Select from the planned list
2. **Write the Story** - Create an engaging narrative
3. **Document Technical Details** - Explain the implementation
4. **Implement in All Languages** - Provide code examples
5. **Create Exercises** - Design practice challenges
6. **Update the Catalog** - Mark as complete

### Improving Existing Patterns
1. **Enhance Stories** - Make narratives more engaging
2. **Improve Technical Docs** - Add more details and examples
3. **Update Implementations** - Fix bugs and add features
4. **Create More Exercises** - Add additional challenges
5. **Add Real-World Examples** - Show practical applications

## Resources

### Quick Reference
- [Cheatsheet](../../resources/cheatsheet/cheatsheet.md) - Pattern quick reference
- [Decision Tree](../../resources/diagrams/pattern-decision-tree.svg) - Choose the right pattern
- [Templates](../../resources/templates/pattern-template.md) - Documentation template

### Learning Materials
- [Getting Started](getting-started.md) - Your first steps
- [Learning Paths](learning-paths.md) - Structured approaches
- [Resources](resources.md) - Additional materials
- [FAQ](faq.md) - Common questions

### Community
- [Contributing Guidelines](../../CONTRIBUTING.md) - How to contribute
- [Code of Conduct](../../CODE_OF_CONDUCT.md) - Community guidelines
- [Issue Templates](../../.github/ISSUE_TEMPLATE/) - Report issues and request features

---

Explore the Pattern Catalog and discover the power of design patterns through storytelling and hands-on practice in the Kingdom of Gitlantis!
