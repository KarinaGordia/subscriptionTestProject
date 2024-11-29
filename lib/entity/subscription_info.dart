class SubscriptionInfo {
  final String duration;
  final String price;
  final String? oldPrice;
  final String description;

  SubscriptionInfo({required this.duration, required this.price, this.oldPrice, required this.description});
}