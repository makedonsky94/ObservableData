import 'package:observable_data/flexible_data/flexible_data.dart';
import 'package:observable_data/flexible_data/list/immutable_list_flexible_data.dart';
import 'package:observable_data/types.dart';

class IterableAction<PrimaryType>
    extends ImmutableListFlexibleData<PrimaryType, Action<PrimaryType>> {
  IterableAction(FlexibleData parent, action) : super(parent, action);

  @override
  void passValueToChain(Object value) {
    assert(value is List);

    for (Object element in value) {
      action(element);
    }

    super.passValueToChain(value);
  }
}