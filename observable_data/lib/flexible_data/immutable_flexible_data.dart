import 'package:meta/meta.dart';
import 'package:observable_data/factory/observable_factory.dart';
import 'package:observable_data/flexible_data/flexible_data.dart';
import 'package:observable_data/types.dart';

class ImmutableFlexibleData<PrimaryType, ActionType>
    extends FlexibleData<PrimaryType> {

  @protected ActionType action;

  ImmutableFlexibleData(
      FlexibleData parent,
      ActionType action) : super(parent) {
    this.action = action;
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
}