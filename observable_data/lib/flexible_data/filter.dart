import 'package:observable_data/flexible_data/flexible_data.dart';
import 'package:observable_data/flexible_data/immutable_flexible_data.dart';
import 'package:observable_data/types.dart';

class Filter<PrimaryType>
    extends ImmutableFlexibleData<PrimaryType, FilterAction<PrimaryType>> {
  Filter(FlexibleData parent, action) : super(parent, action);

  @override
  void passValueToChain(Object value) {
    if (!action(value)) return;

    super.passValueToChain(value);
  }
}