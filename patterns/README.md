# Design Patterns Catalog

Welcome to the comprehensive catalog of design patterns in the Kingdom of Gitlantis. Each pattern is presented through storytelling, technical documentation, and multi-language implementations.

## Pattern Categories

### Creational Patterns
Patterns that deal with object creation mechanisms, trying to create objects in a manner suitable to the situation.

- **Singleton**: Ensure a class has only one instance
- **Factory Method**: Create objects without specifying their exact classes
- **Abstract Factory**: Create families of related objects
- **Builder**: Construct complex objects step by step
- **Prototype**: Create objects by cloning existing instances

### Structural Patterns
Patterns that deal with object composition and relationships between entities.

- **Adapter**: Make incompatible interfaces work together
- **Bridge**: Separate abstraction from implementation
- **Composite**: Compose objects into tree structures
- **Decorator**: Add behavior to objects dynamically
- **Facade**: Provide a simplified interface to a complex subsystem
- **Flyweight**: Share common state between many objects
- **Proxy**: Provide a placeholder for another object

### Behavioral Patterns
Patterns that deal with communication between objects and the assignment of responsibilities.

- **Observer**: Notify multiple objects about state changes
- **Strategy**: Define a family of algorithms and make them interchangeable
- **Command**: Encapsulate requests as objects
- **State**: Allow an object to alter its behavior when its internal state changes
- **Template Method**: Define the skeleton of an algorithm
- **Visitor**: Add new operations without changing classes
- **Chain of Responsibility**: Pass requests along a chain of handlers
- **Iterator**: Provide a way to access elements sequentially
- **Mediator**: Define how objects interact with each other
- **Memento**: Capture and restore an object's internal state

## Learning Path

### 1. Start with Stories
Each pattern begins with a story set in the Kingdom of Gitlantis that explains:
- The problem the pattern solves
- The characters involved
- The solution and its benefits
- Real-world applications

### 2. Understand the Technical Details
After the story, dive into the technical documentation:
- Pattern structure and relationships
- Implementation guidelines
- Trade-offs and alternatives
- When to use and when to avoid

### 3. Practice with Implementations
Each pattern includes implementations in all supported languages:
- **C**: System programming and embedded systems
- **C++**: Object-oriented programming
- **Go**: Concurrent and modern system design
- **TypeScript**: Web development and type safety
- **Java**: Enterprise applications
- **Rust**: Memory-safe systems programming

### 4. Solve Exercises
Test your understanding with hands-on exercises and challenges.

## Pattern Structure

Each pattern follows this structure:

```
pattern-name/
├── README.md           # Pattern overview and navigation
├── story.md           # Narrative explanation
├── technical.md       # Technical documentation
├── diagram.svg        # Visual representation
├── implementations/   # Multi-language implementations
│   ├── c/            # C implementation
│   ├── cpp/          # C++ implementation
│   ├── go/           # Go implementation
│   ├── typescript/   # TypeScript implementation
│   ├── java/        # Java implementation
│   └── rust/         # Rust implementation
└── exercises/        # Practice exercises
    └── challenge.md
```

## Getting Started

1. **Choose a Pattern**: Browse the categories above
2. **Read the Story**: Understand the problem and solution through narrative
3. **Study the Technical Details**: Learn the implementation specifics
4. **Practice with Code**: Implement the pattern in your preferred language
5. **Solve Exercises**: Test your understanding with challenges

## Contributing

See [CONTRIBUTING.md](../../CONTRIBUTING.md) for guidelines on adding new patterns or improving existing ones.

## Resources

- [Pattern Decision Tree](../../resources/diagrams/pattern-decision-tree.svg)
- [Cheatsheet](../../resources/cheatsheet/cheatsheet.md)
- [Learning Paths](../../docs/learning-paths.md)
- [FAQ](../../docs/faq.md)
