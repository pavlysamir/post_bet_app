import 'package:post_bet/features/settings/data/models/my_subscription_model.dart';

class SubscriptionResponse {
  final List<MySubscriptionModel> subscriptions;

  SubscriptionResponse({
    required this.subscriptions,
  });

  factory SubscriptionResponse.fromJson(List<dynamic> json) =>
      SubscriptionResponse(
        subscriptions: json
            .map((dynamic item) =>
                MySubscriptionModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
}
