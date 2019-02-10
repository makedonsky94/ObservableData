import 'package:observable_data/flexible_data/filter.dart';
import 'package:observable_data/flexible_data/flexible_data.dart';
import 'package:observable_data/flexible_data/mapper.dart';
import 'package:observable_data/types.dart';

class ObservableFactory {
  static FlexibleData<V> provideMapper<T, V>(
      FlexibleData<T> parent,
      MapAction<T, V> mapAction) {
    return Mapper<V, T>(parent, mapAction);
  }

  static FlexibleData<T> provideFilter<T>(
      FlexibleData<T> parent,
      FilterAction<T> filterAction) {
    return Filter(parent, filterAction);
  }
}