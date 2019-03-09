import 'package:flutter/foundation.dart';
import 'package:observable_data/flexible_data/flexible_data.dart';
import 'package:observable_data/flexible_data/list/list_flexible_data.dart';

class ImmutableListFlexibleData<PrimaryType, ActionType>
    extends ListFlexibleData<PrimaryType> {

  @protected ActionType action;

  ImmutableListFlexibleData(FlexibleData parent, ActionType action)
      : super(parent) {
    this.action = action;
  }
}
