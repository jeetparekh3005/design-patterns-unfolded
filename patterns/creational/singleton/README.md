# Singleton Pattern

## The Crown of Unity

In the Kingdom of Gitlantis, there can be only one true ruler - The Architect King. Just as the kingdom has but one king, the Singleton pattern ensures that a class has only one instance and provides global access to it.

## Pattern Overview

The Singleton pattern is a creational design pattern that ensures a class has only one instance, while providing a global access point to this instance.

## When to Use

- **Database Connections**: Ensure only one connection pool exists
- **Logging Systems**: Centralize logging through a single instance
- **Configuration Management**: Maintain a single source of configuration
- **Cache Systems**: Ensure only one cache instance exists
- **Thread Pools**: Manage a single thread pool for the application

## Structure

```
Singleton
├── -instance: Singleton
├── +getInstance(): Singleton
└── -constructor()
```

## Key Components

- **Private Constructor**: Prevents direct instantiation
- **Static Instance Variable**: Holds the single instance
- **Static Getter Method**: Provides access to the instance
- **Lazy Initialization**: Creates instance only when needed

## Implementation Notes

### Thread Safety
- **C/C++**: Use mutex or atomic operations
- **Go**: Use sync.Once for thread-safe initialization
- **TypeScript/JavaScript**: Use module pattern or class with static methods
- **Java**: Use synchronized methods or double-checked locking
- **Rust**: Use OnceCell or LazyStatic for thread-safe initialization

### Memory Management
- **C**: Manual memory management with proper cleanup
- **C++**: RAII principles with smart pointers
- **Go**: Garbage collection handles memory automatically
- **TypeScript**: Garbage collection handles memory automatically
- **Java**: Garbage collection handles memory automatically
- **Rust**: Ownership system ensures memory safety

## Trade-offs

### Advantages
- **Single Instance**: Guarantees only one instance exists
- **Global Access**: Provides easy access to the instance
- **Lazy Initialization**: Creates instance only when needed
- **Memory Efficient**: Saves memory by reusing the same instance

### Disadvantages
- **Global State**: Can lead to hidden dependencies
- **Testing Difficulties**: Hard to mock and test
- **Thread Safety Complexity**: Requires careful implementation
- **Violates Single Responsibility**: Mixes instance management with business logic

## Alternatives

- **Dependency Injection**: Use DI containers instead of singletons
- **Static Classes**: Use static methods for stateless operations
- **Service Locator**: Use service locator pattern for dependency resolution
- **Factory Pattern**: Use factories to control object creation

## Real-World Examples

- **Database Connection Pools**: Single pool for database connections
- **Logger Instances**: Centralized logging system
- **Configuration Managers**: Single source of configuration
- **Cache Managers**: Centralized caching system
- **Thread Pools**: Single thread pool for the application

## Implementation Languages

- [C Implementation](implementations/c/) - System programming approach
- [C++ Implementation](implementations/cpp/) - Object-oriented approach
- [Go Implementation](implementations/go/) - Concurrent programming approach
- [TypeScript Implementation](implementations/typescript/) - Web development approach
- [Java Implementation](implementations/java/) - Enterprise approach
- [Rust Implementation](implementations/rust/) - Memory-safe approach

## Exercises

- [Challenge 1: Thread-Safe Singleton](exercises/challenge.md#challenge-1)
- [Challenge 2: Singleton Registry](exercises/challenge.md#challenge-2)
- [Challenge 3: Singleton Testing](exercises/challenge.md#challenge-3)

## Next Steps

1. **Read the Story**: Understand the pattern through narrative
2. **Study Technical Details**: Learn implementation specifics
3. **Choose a Language**: Pick your preferred implementation
4. **Practice Coding**: Implement the pattern yourself
5. **Solve Exercises**: Test your understanding

## Related Patterns

- **Factory Method**: May use singleton for factory instances
- **Abstract Factory**: May use singleton for factory management
- **Builder**: May use singleton for builder instances
- **Prototype**: Alternative to singleton for object creation

Begin your journey with the Singleton pattern and learn the power of controlled object creation!
