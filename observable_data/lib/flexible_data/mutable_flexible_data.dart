import 'package:observable_data/factory/observable_factory.dart';
import 'package:observable_data/flexible_data/flexible_data.dart';
import 'package:observable_data/types.dart';

class MutableFlexibleData<PrimaryType> extends FlexibleData<PrimaryType> {
  MutableFlexibleData(PrimaryType defaultValue) : super(null) {
    primaryValue = defaultValue;
  }

  @override
  FlexibleData<PrimaryType> filter(FilterAction<PrimaryType> action) {
    var data = ObservableFactory.provideFilter(this, action);
    childNodes.add(data);
    return data;
  }

  @override
  FlexibleData<MapperType> map<MapperType>(
      MapAction<PrimaryType, MapperType> action) {
    var data = ObservableFactory.provideMapper(this, action);
    childNodes.add(data);
    return data;
  }

  set value(PrimaryType value) {
    primaryValue = value;
    notifySubscribers();
    passValueToChain(primaryValue);
  }
}