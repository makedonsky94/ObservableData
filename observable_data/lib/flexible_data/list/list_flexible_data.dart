import 'package:observable_data/factory/observable_factory.dart';
import 'package:observable_data/flexible_data/flexible_data.dart';
import 'package:observable_data/types.dart';

abstract class ListFlexibleData<PrimaryType>
    extends FlexibleData<List<PrimaryType>> {
  ListFlexibleData(FlexibleData parent) : super(parent);

  @override
  FlexibleData<List<PrimaryType>> filter(
      FilterAction<List<PrimaryType>> action) {
    var data = ObservableFactory.provideFilter(this, action);
    childNodes.add(data);
    return data;
  }

  @override
  FlexibleData<MapperType> map<MapperType>(
      MapAction<List<PrimaryType>, MapperType> action) {
    var data = ObservableFactory.provideMapper(this, action);
    childNodes.add(data);
    return data;
  }

  ListFlexibleData<PrimaryType> forEachFilter(
      FilterAction<PrimaryType> action) {
    var data = ObservableFactory.provideIterableFilter(this, action);
    childNodes.add(data);
    return data;
  }

  ListFlexibleData<PrimaryType> forEach(Action<PrimaryType> action) {
    var data = ObservableFactory.provideIterableAction(this, action);
    childNodes.add(data);
    return data;
  }
}
