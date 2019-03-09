import 'package:observable_data/flexible_data/list/list_flexible_data.dart';

class MutableListFlexibleData<PrimaryType>
    extends ListFlexibleData<PrimaryType> {
  MutableListFlexibleData(List<PrimaryType> defaultValue) : super(null) {
    primaryValue = defaultValue;
  }

  set value(List<PrimaryType> value) {
    primaryValue = value;
    _notifyAll();
  }

  void add(PrimaryType value) {
    primaryValue.add(value);
    _notifyAll();
  }

  void addAll(Iterable<PrimaryType> value) {
    primaryValue.addAll(value);
    _notifyAll();
  }

  void remove(PrimaryType value) {
    primaryValue.remove(value);
    _notifyAll();
  }

  void removeAt(int index) {
    primaryValue.removeAt(index);
    _notifyAll();
  }

  void removeLast() {
    primaryValue.removeLast();
    _notifyAll();
  }

  void _notifyAll() {
    notifySubscribers();
    passValueToChain(primaryValue);
  }
}