typedef SubscribeFunction<T> = Function(T value);
typedef Action<T> = Function(T value);
typedef MapAction<T, V> = V Function(T value);
typedef FilterAction<T> = bool Function(T value);