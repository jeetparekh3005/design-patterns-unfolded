# Singleton Pattern - Technical Documentation

## Overview

The Singleton pattern is a creational design pattern that ensures a class has only one instance and provides a global access point to that instance. It's one of the most well-known and frequently used design patterns.

## Intent

- Ensure a class has only one instance
- Provide global access to that instance
- Control the instantiation process

## Motivation

Sometimes you need to ensure that only one instance of a class exists in your application. This is common for:
- Database connections
- Logging systems
- Configuration managers
- Cache systems
- Thread pools

## Structure

```
Singleton
├── -instance: Singleton
├── +getInstance(): Singleton
└── -constructor()
```

## Participants

- **Singleton**: Defines an instance operation that lets clients access its unique instance

## Collaborations

- Clients access a Singleton instance solely through the getInstance() method

## Implementation

### Basic Implementation

```typescript
class Singleton {
    private static instance: Singleton;
    
    private constructor() {
        // Private constructor prevents direct instantiation
    }
    
    public static getInstance(): Singleton {
        if (!Singleton.instance) {
            Singleton.instance = new Singleton();
        }
        return Singleton.instance;
    }
}
```

### Thread-Safe Implementation

```typescript
class ThreadSafeSingleton {
    private static instance: ThreadSafeSingleton;
    private static readonly lock = new Object();
    
    private constructor() {}
    
    public static getInstance(): ThreadSafeSingleton {
        if (!ThreadSafeSingleton.instance) {
            synchronized(ThreadSafeSingleton.lock) {
                if (!ThreadSafeSingleton.instance) {
                    ThreadSafeSingleton.instance = new ThreadSafeSingleton();
                }
            }
        }
        return ThreadSafeSingleton.instance;
    }
}
```

## Key Implementation Details

### 1. Private Constructor
- Prevents direct instantiation from outside the class
- Ensures only the class itself can create instances

### 2. Static Instance Variable
- Holds the single instance of the class
- Must be static to be accessible from static methods

### 3. Static Getter Method
- Provides the only way to access the instance
- Implements lazy initialization
- Should be thread-safe in multi-threaded environments

### 4. Lazy Initialization
- Instance is created only when first requested
- Saves memory if the instance is never used
- Can be implemented with or without thread safety

## Thread Safety Considerations

### Double-Checked Locking
```typescript
class DoubleCheckedSingleton {
    private static instance: DoubleCheckedSingleton;
    private static readonly lock = new Object();
    
    private constructor() {}
    
    public static getInstance(): DoubleCheckedSingleton {
        if (!DoubleCheckedSingleton.instance) {
            synchronized(DoubleCheckedSingleton.lock) {
                if (!DoubleCheckedSingleton.instance) {
                    DoubleCheckedSingleton.instance = new DoubleCheckedSingleton();
                }
            }
        }
        return DoubleCheckedSingleton.instance;
    }
}
```

### Eager Initialization
```typescript
class EagerSingleton {
    private static readonly instance = new EagerSingleton();
    
    private constructor() {}
    
    public static getInstance(): EagerSingleton {
        return EagerSingleton.instance;
    }
}
```

## Memory Management

### C/C++
- Manual memory management required
- Use smart pointers for automatic cleanup
- Implement proper destructor

### Go
- Garbage collection handles memory automatically
- Use sync.Once for thread-safe initialization

### TypeScript/JavaScript
- Garbage collection handles memory automatically
- Use module pattern for simpler implementation

### Java
- Garbage collection handles memory automatically
- Use synchronized methods or double-checked locking

### Rust
- Ownership system ensures memory safety
- Use OnceCell or LazyStatic for thread-safe initialization

## Common Pitfalls

### 1. Thread Safety
- Basic implementation is not thread-safe
- Use synchronization mechanisms
- Consider eager initialization for simplicity

### 2. Testing Difficulties
- Hard to mock and test
- Consider dependency injection
- Use interfaces for better testability

### 3. Global State
- Can lead to hidden dependencies
- Makes code harder to understand
- Consider alternatives like dependency injection

### 4. Overuse
- Don't make everything a singleton
- Use only when truly necessary
- Consider alternatives for better design

## Alternatives

### 1. Dependency Injection
```typescript
class Service {
    constructor(private config: Config) {}
}

// Inject dependency instead of using singleton
const service = new Service(config);
```

### 2. Static Classes
```typescript
class UtilityClass {
    public static doSomething(): void {
        // Stateless operations
    }
}
```

### 3. Service Locator
```typescript
class ServiceLocator {
    private static services = new Map<string, any>();
    
    public static register<T>(name: string, service: T): void {
        this.services.set(name, service);
    }
    
    public static get<T>(name: string): T {
        return this.services.get(name);
    }
}
```

## Real-World Examples

### Database Connection Pool
```typescript
class DatabaseConnectionPool {
    private static instance: DatabaseConnectionPool;
    private connections: Connection[] = [];
    
    private constructor() {
        // Initialize connection pool
    }
    
    public static getInstance(): DatabaseConnectionPool {
        if (!DatabaseConnectionPool.instance) {
            DatabaseConnectionPool.instance = new DatabaseConnectionPool();
        }
        return DatabaseConnectionPool.instance;
    }
    
    public getConnection(): Connection {
        // Return available connection
    }
    
    public releaseConnection(connection: Connection): void {
        // Return connection to pool
    }
}
```

### Logger
```typescript
class Logger {
    private static instance: Logger;
    private logs: string[] = [];
    
    private constructor() {}
    
    public static getInstance(): Logger {
        if (!Logger.instance) {
            Logger.instance = new Logger();
        }
        return Logger.instance;
    }
    
    public log(message: string): void {
        this.logs.push(message);
        console.log(message);
    }
    
    public getLogs(): string[] {
        return [...this.logs];
    }
}
```

## Testing Strategies

### 1. Reset Instance
```typescript
class TestableSingleton {
    private static instance: TestableSingleton;
    
    private constructor() {}
    
    public static getInstance(): TestableSingleton {
        if (!TestableSingleton.instance) {
            TestableSingleton.instance = new TestableSingleton();
        }
        return TestableSingleton.instance;
    }
    
    public static reset(): void {
        TestableSingleton.instance = null;
    }
}
```

### 2. Use Interfaces
```typescript
interface ILogger {
    log(message: string): void;
}

class Logger implements ILogger {
    private static instance: Logger;
    
    private constructor() {}
    
    public static getInstance(): ILogger {
        if (!Logger.instance) {
            Logger.instance = new Logger();
        }
        return Logger.instance;
    }
    
    public log(message: string): void {
        console.log(message);
    }
}
```

## Performance Considerations

### Lazy vs Eager Initialization
- **Lazy**: Better memory usage, but thread safety complexity
- **Eager**: Simpler, but always allocates memory

### Thread Safety Overhead
- Synchronization has performance cost
- Consider if thread safety is actually needed
- Use read-only operations when possible

## Best Practices

1. **Use Sparingly**: Only when you truly need a single instance
2. **Thread Safety**: Implement proper synchronization
3. **Testing**: Make it testable with interfaces
4. **Documentation**: Clearly document why singleton is needed
5. **Alternatives**: Consider dependency injection first

## Conclusion

The Singleton pattern is powerful but should be used judiciously. It's perfect for services that should be shared across the entire application, but consider alternatives like dependency injection for better testability and flexibility.

Remember: The Singleton pattern ensures there's only one instance, but with great power comes great responsibility. Use it wisely!
