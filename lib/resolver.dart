library resolver;

class Resolver extends ResolverRegistering {
  static Map<String, dynamic> registeredDependencies = {};
  void register<T>(FactoryRegistrant registrant,
      {String name = "",
      bool overide = false,
      ResolverScope scope = ResolverScope.provider}) {
    final _identity = identifier(T);
    final factory = registrant.call();

    return;
  }

  String identifier<T>(T type, [String name = ""]) {
    if (name.isNotEmpty) {
      return name;
    }
    return "${type.runtimeType}";
  }

  T get<T>([String name = ""]) {
    if (name.isNotEmpty) {
      return registeredDependencies[name];
    }
    final _identity = identifier(T);
    return registeredDependencies[_identity];
  }
}

enum ResolverScope { singleton, provider }

abstract class Factory<T> {
  T? instance;
}

class SingletonFactory<T> implements Factory<T> {
  @override
  T? instance;
  SingletonFactory(T inst) {
    instance = inst;
  }
}

class ProviderFactory<T> implements Factory<T> {
  @override
  T? instance;
  ProviderFactory(T inst) {
    instance = inst;
  }
}

typedef FactoryRegistrant = Factory Function();

class ResolverRegistering {
  void registerAll() {}
}

extension XResolver on Resolver {
  void registerAll() {
    register<A>(() => SingletonFactory(A()));
    register<B>(() => ProviderFactory(B()));
  }
}

class A {
  void printname() {
    print("My name is Qazeem Abiodun");
  }
}

class B {
  void printname() {
    print("My name is Qazeem Adelani");
  }
}
