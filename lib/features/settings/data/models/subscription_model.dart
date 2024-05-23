class SubscriptionModel {
  final String transactionUrl;
  final String chargeId;

  SubscriptionModel({
    required this.transactionUrl,
    required this.chargeId,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      transactionUrl: json['transactionUrl'] as String,
      chargeId: json['chargeId'] as String,
    );
  }
}
