import 'package:observable_data/flexible_data/flexible_data.dart';
import 'package:observable_data/flexible_data/immutable_flexible_data.dart';
import 'package:observable_data/types.dart';

class Mapper<PrimaryType, BaseType>
    extends ImmutableFlexibleData<PrimaryType, MapAction<BaseType, PrimaryType>> {
  Mapper(FlexibleData parent, action) : super(parent, action);

  @override
  void passValueToChain(Object value) {
    primaryValue = action(value);
    notifySubscribers();

    for (FlexibleData node in childNodes) {
      node.passValueToChain(primaryValue);
    }
  }
}