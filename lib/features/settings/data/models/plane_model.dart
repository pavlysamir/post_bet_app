class PlanModel {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String details;
  final int price;
  final int? numberOfPosts;
  final int? limitNumberOfPostsPerDay;
  final int vat;
  final bool isActive;
  final bool isFree;
  final bool facebook;
  final bool instagram;
  final bool linkedin;
  final bool telegram;
  final bool twitter;
  final bool tiktok;
  final bool pinterest;
  final bool reddit;

  PlanModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.details,
    required this.price,
    required this.numberOfPosts,
    this.limitNumberOfPostsPerDay,
    required this.vat,
    required this.isActive,
    required this.isFree,
    required this.facebook,
    required this.instagram,
    required this.linkedin,
    required this.telegram,
    required this.twitter,
    required this.tiktok,
    required this.pinterest,
    required this.reddit,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) => PlanModel(
        id: json['id'] as int,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        name: json['name'] as String,
        details: json['details'] as String,
        price: json['price'] as int,
        numberOfPosts: json['number_of_posts'] as int?,
        limitNumberOfPostsPerDay: json['limit_number_of_posts_per_day'] as int?,
        vat: json['vat'] as int,
        isActive: json['isActive'] as bool,
        isFree: json['isFree'] as bool,
        facebook: json['Facebook'] as bool,
        instagram: json['Instagram'] as bool,
        linkedin: json['LinkedIn'] as bool,
        twitter: json['Twitter'] as bool,
        telegram: json['Telegram'] as bool,
        tiktok: json['TikTok'] as bool,
        pinterest: json['Pinterest'] as bool,
        reddit: json['Reddit'] as bool,
      );
}
