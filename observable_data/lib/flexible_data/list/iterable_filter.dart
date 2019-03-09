import 'package:observable_data/flexible_data/flexible_data.dart';
import 'package:observable_data/flexible_data/immutable_flexible_data.dart';
import 'package:observable_data/flexible_data/list/immutable_list_flexible_data.dart';
import 'package:observable_data/types.dart';

class IterableFilter<PrimaryType>
    extends ImmutableListFlexibleData<PrimaryType, FilterAction<PrimaryType>> {
  IterableFilter(FlexibleData parent, action) : super(parent, action);

  @override
  void passValueToChain(Object value) {
    assert(value is List);

    List<PrimaryType> newList = List();
    for (PrimaryType element in value) {
      if (action(element)) {
        newList.add(element);
      }
    }

    super.passValueToChain(newList);
  }
}