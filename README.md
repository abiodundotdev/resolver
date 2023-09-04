# Resolver (DEV MODE)

A Simplified Dependency Injector/Service Locator. Inspired by Resolver in Swift and Dagger in Android. Resolver is just simplifying how you add and resolve dependencies in your container not replacing GetIt nor Injector. 
(Currently under development, but its gonna be amazing, you will love it)

## 🎖 Installing

```yaml
dependencies:
  resolver : ^1.0.0
```

### ⚡️ Import
```dart
import 'package:resolver/resolver.dart';
```

## 🎮 How To Use

#### Property inject
```dart
     @Resolve<Service>()
     late Service service
```

#### Property inject
```dart
   var service = @Resolve<Service>().resolve
```

#### Constructor inject
```dart
   class Client{
    Client(@Resolve<Service>() service){}
   }
```
#### method inject
```dart
   class Client{
    void method(@Resolve<Service>() service){}
   }
```


#### Register dependency
```dart
  extension XResolver on Resolver {
  void registerAll() {
    register<A>(() => SingletonFactory(A()));
    register<B>(() => ProviderFactory(B()));
  }
}
```

## Additional information
This package is currently under development, do not use in any production code, or use for testing, not fully tested, 