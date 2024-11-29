class SubscriptionInfo {
  final String duration;
  final String price;
  final String? oldPrice;
  final String description;
  final bool profitableMark;

  SubscriptionInfo({
    required this.duration,
    required this.price,
    this.oldPrice,
    required this.description,
    this.profitableMark = false,
  });
}
