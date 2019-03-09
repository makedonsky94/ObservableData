import 'package:flutter/foundation.dart';
import 'package:observable_data/observable_data.dart';
import 'package:observable_data/types.dart';

abstract class FlexibleData<PrimaryType> extends ObservableData<PrimaryType> {
  @protected List<FlexibleData> childNodes = new List();
  @protected FlexibleData parentNode;

  FlexibleData(FlexibleData parent) {
    this.parentNode = parent;
  }

  FlexibleData<MapperType> map<MapperType>(
      MapAction<PrimaryType, MapperType> action);

  FlexibleData<PrimaryType> filter(FilterAction<PrimaryType> action);


  @override
  void subscribe(SubscribeFunction<PrimaryType> subscriber) {
    super.subscribe(subscriber);
    requestValueFromParent();
  }

  @protected void passValueToChain(Object value) {
    primaryValue = value;
    notifySubscribers();

    for (FlexibleData node in childNodes) {
      node.passValueToChain(primaryValue);
    }
  }

  @protected requestValueFromParent() {
    if (parentNode != null) {
      parentNode.requestValueFromParent();
    } else {
      passValueToChain(primaryValue);
    }
  }
}