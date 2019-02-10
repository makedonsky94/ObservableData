import 'package:observable_data/observable_data.dart';
import 'package:observable_data/types.dart';

class ImmutableObservableData<T> extends ObservableData<T> {

  @override
  void subscribe(SubscribeFunction<T> subscriber) {
    super.subscribe(subscriber);
    notifySubscribers();
  }
}