class MySubscriptionModel {
  final int id;
  // final int todayUsedPlanCounter;
  final String paymentStatus;
  final String startDayPlanSubscription;
  final String chargeId;
  final String transactionUrl;
  final Plan plan;

  MySubscriptionModel({
    required this.id,
    // required this.todayUsedPlanCounter,
    required this.paymentStatus,
    required this.startDayPlanSubscription,
    required this.chargeId,
    required this.transactionUrl,
    required this.plan,
  });

  factory MySubscriptionModel.fromJson(Map<String, dynamic> json) =>
      MySubscriptionModel(
        id: json['id'] as int,
        // todayUsedPlanCounter: json['todayUsedPlanCounter'] as int,
        paymentStatus: json['paymentStatus'] as String,
        startDayPlanSubscription: json['startDayPlanSubscription'] as String,
        chargeId: json['chargeId'] as String,
        transactionUrl: json['transactionUrl'] as String,
        plan: Plan.fromJson(json['plan'] as Map<String, dynamic>),
      );
}

class Plan {
  final String name;
  //final String? details;
  final int? numberOfPosts;
  //final int limitNumberOfPostsPerDay;
  final bool facebook;
  final bool instagram;
  final bool linkedIn;
  final bool twitter;
  final bool telegram;
  final bool tiktok;
  final bool pinterest;
  final bool reddit;

  Plan({
    required this.name,
    //this.details,
    required this.numberOfPosts,
    // required this.limitNumberOfPostsPerDay,
    required this.facebook,
    required this.instagram,
    required this.linkedIn,
    required this.twitter,
    required this.telegram,
    required this.tiktok,
    required this.pinterest,
    required this.reddit,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        name: json['name'] as String,
        //  details: json['details'] as String?,
        numberOfPosts: json['number_of_posts'] as int?,
        // limitNumberOfPostsPerDay: json['limit_number_of_posts_per_day'] as int,
        facebook: json['Facebook'] as bool,
        instagram: json['Instagram'] as bool,
        linkedIn: json['LinkedIn'] as bool,
        twitter: json['Twitter'] as bool,
        telegram: json['Telegram'] as bool,
        tiktok: json['TikTok'] as bool,
        pinterest: json['Pinterest'] as bool,
        reddit: json['Reddit'] as bool,
      );
}
