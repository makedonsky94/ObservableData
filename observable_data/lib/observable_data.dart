library observable_data;

import 'package:meta/meta.dart';
import 'package:observable_data/types.dart';

abstract class ObservableData<T> {
  List<SubscribeFunction<T>> _subscribers = new List();

  @protected T primaryValue;

  T get value => primaryValue;

  void subscribe(SubscribeFunction<T> subscriber) {
    _subscribers.add(subscriber);
  }

  void unsubscribe(SubscribeFunction<T> subscriber) {
    _subscribers.remove(subscriber);
  }

  @protected void notifySubscribers() {
    for (SubscribeFunction<T> subscriber in _subscribers) {
      subscriber(primaryValue);
    }
  }
}
