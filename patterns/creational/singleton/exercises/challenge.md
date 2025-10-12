# Singleton Pattern Exercises

## Challenge 1: Thread-Safe Singleton

### Problem
Implement a thread-safe singleton in your preferred language that can handle concurrent access from multiple threads.

### Requirements
- Ensure only one instance exists
- Thread-safe initialization
- Lazy initialization
- Proper memory management

### Hints
- Use synchronization mechanisms (mutex, lock, etc.)
- Consider double-checked locking
- Test with multiple threads

### Solution Template
```typescript
class ThreadSafeSingleton {
    // Your implementation here
}
```

## Challenge 2: Singleton Registry

### Problem
Create a singleton registry that can manage multiple singleton instances by name.

### Requirements
- Register singleton instances by name
- Retrieve singleton instances by name
- Thread-safe operations
- Support for different types

### Example Usage
```typescript
const registry = SingletonRegistry.getInstance();
registry.register('logger', new Logger());
registry.register('config', new Config());

const logger = registry.get('logger');
const config = registry.get('config');
```

### Hints
- Use a Map or Dictionary to store instances
- Implement generic methods for type safety
- Consider lazy registration

## Challenge 3: Singleton Testing

### Problem
Create a testable singleton that can be easily mocked and tested.

### Requirements
- Easy to mock for testing
- Reset functionality for test isolation
- Interface-based design
- Dependency injection support

### Test Cases
```typescript
describe('TestableSingleton', () => {
    beforeEach(() => {
        // Reset singleton state
    });
    
    it('should create only one instance', () => {
        // Your test here
    });
    
    it('should be mockable', () => {
        // Your test here
    });
});
```

### Hints
- Use interfaces for abstraction
- Implement reset methods
- Consider dependency injection
- Use factory pattern for creation

## Challenge 4: Singleton with Configuration

### Problem
Create a configuration singleton that loads settings from a file and provides thread-safe access.

### Requirements
- Load configuration from file
- Thread-safe access to configuration
- Lazy loading of configuration
- Validation of configuration values

### Configuration File (config.json)
```json
{
    "database": {
        "host": "localhost",
        "port": 5432,
        "name": "myapp"
    },
    "logging": {
        "level": "info",
        "file": "app.log"
    }
}
```

### Usage Example
```typescript
const config = Config.getInstance();
const dbHost = config.get('database.host');
const logLevel = config.get('logging.level');
```

### Hints
- Use JSON parsing for configuration
- Implement nested key access
- Add validation for configuration values
- Consider configuration reloading

## Challenge 5: Singleton with Lifecycle Management

### Problem
Create a singleton that can be properly initialized and destroyed with lifecycle management.

### Requirements
- Initialization method
- Cleanup method
- State management
- Resource management

### Lifecycle Methods
```typescript
class LifecycleSingleton {
    public static getInstance(): LifecycleSingleton {
        // Your implementation
    }
    
    public initialize(): void {
        // Initialize resources
    }
    
    public cleanup(): void {
        // Cleanup resources
    }
    
    public isInitialized(): boolean {
        // Check initialization state
    }
}
```

### Hints
- Implement proper resource cleanup
- Use state flags for initialization
- Consider graceful shutdown
- Handle cleanup errors

## Challenge 6: Singleton with Dependency Injection

### Problem
Create a singleton that can accept dependencies through constructor injection while maintaining singleton behavior.

### Requirements
- Constructor dependency injection
- Singleton behavior maintained
- Easy testing with mock dependencies
- Type-safe dependency resolution

### Example Usage
```typescript
interface IDatabase {
    connect(): void;
    disconnect(): void;
}

class DatabaseSingleton {
    private static instance: DatabaseSingleton;
    private database: IDatabase;
    
    private constructor(database: IDatabase) {
        this.database = database;
    }
    
    public static getInstance(database?: IDatabase): DatabaseSingleton {
        // Your implementation
    }
}
```

### Hints
- Use optional parameters for dependencies
- Implement dependency validation
- Consider dependency resolution strategies
- Handle circular dependencies

## Challenge 7: Singleton with Event System

### Problem
Create a singleton event system that can register, unregister, and emit events across the application.

### Requirements
- Event registration and unregistration
- Event emission
- Event listener management
- Thread-safe operations
- Memory leak prevention

### Example Usage
```typescript
const eventSystem = EventSystem.getInstance();

eventSystem.on('user.login', (user) => {
    console.log(`User ${user.name} logged in`);
});

eventSystem.emit('user.login', { name: 'John', id: 1 });
```

### Hints
- Use Map for event listeners
- Implement proper cleanup
- Consider event priority
- Handle async events

## Challenge 8: Singleton with Caching

### Problem
Create a singleton cache system that can store and retrieve data with expiration and size limits.

### Requirements
- Store and retrieve data
- Expiration handling
- Size limits
- Thread-safe operations
- Memory management

### Example Usage
```typescript
const cache = Cache.getInstance();

cache.set('user:1', { name: 'John', email: 'john@example.com' }, 3600);
const user = cache.get('user:1');
cache.delete('user:1');
```

### Hints
- Use Map for storage
- Implement TTL (Time To Live)
- Consider LRU (Least Recently Used) eviction
- Add size monitoring

## Challenge 9: Singleton with Monitoring

### Problem
Create a singleton monitoring system that tracks application metrics and provides health checks.

### Requirements
- Metric collection
- Health check endpoints
- Performance monitoring
- Alert system
- Dashboard data

### Example Usage
```typescript
const monitor = Monitor.getInstance();

monitor.incrementCounter('requests');
monitor.recordLatency('database.query', 150);
monitor.setGauge('memory.usage', 85);

const health = monitor.getHealth();
const metrics = monitor.getMetrics();
```

### Hints
- Use different metric types (counter, gauge, histogram)
- Implement health check logic
- Consider metric aggregation
- Add alerting thresholds

## Challenge 10: Singleton with Plugin System

### Problem
Create a singleton plugin system that can load, manage, and execute plugins dynamically.

### Requirements
- Plugin loading and unloading
- Plugin lifecycle management
- Plugin communication
- Error handling
- Security considerations

### Example Usage
```typescript
const pluginSystem = PluginSystem.getInstance();

pluginSystem.loadPlugin('auth-plugin');
pluginSystem.executePlugin('auth-plugin', 'authenticate', { username: 'john' });
pluginSystem.unloadPlugin('auth-plugin');
```

### Hints
- Use dynamic loading mechanisms
- Implement plugin interfaces
- Consider plugin isolation
- Add security validation

## General Tips

1. **Start Simple**: Begin with basic singleton implementation
2. **Add Complexity**: Gradually add features like thread safety
3. **Test Thoroughly**: Write comprehensive tests
4. **Consider Alternatives**: Think about when singleton might not be the best choice
5. **Document Decisions**: Explain why singleton is needed
6. **Performance**: Consider performance implications
7. **Memory**: Be mindful of memory usage and cleanup

## Success Criteria

- Code compiles and runs without errors
- All tests pass
- Thread safety is properly implemented
- Memory management is correct
- Code is well-documented
- Error handling is implemented
- Performance is acceptable

Good luck with your singleton implementations! Remember to consider the trade-offs and alternatives to the singleton pattern.
