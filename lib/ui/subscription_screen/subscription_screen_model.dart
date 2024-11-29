import 'package:flutter/material.dart';
import 'package:subscription_test/entity/entity.dart';

class SubscriptionScreenModel extends ChangeNotifier{
  final List<SubscriptionInfo> _subscriptionInfo = [
    SubscriptionInfo(duration: '1 месяц', price: '1000р', description: 'Описание'),
    SubscriptionInfo(duration: '6 месяцев', price: '10 000р',oldPrice: '12 000р', description: 'Описание', profitableMark: true),
  ];

  List<SubscriptionInfo> get subscriptionInfo => _subscriptionInfo;
}

class SubscriptionScreenModelProvider extends InheritedNotifier {
  final SubscriptionScreenModel model;

  const SubscriptionScreenModelProvider({
    super.key,
    required this.model,
    required super.child,
  }) : super(notifier: model);

  static SubscriptionScreenModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SubscriptionScreenModelProvider>();
  }

  static SubscriptionScreenModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<SubscriptionScreenModelProvider>()
        ?.widget;
    return widget is SubscriptionScreenModelProvider ? widget : null;
  }
}