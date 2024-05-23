import 'package:post_bet/features/profile/data/models/profile_data_model.dart';

class ProfileResponseModle {
  final bool success;
  final int status;
  final ProfileDataModel data;

  ProfileResponseModle({
    required this.success,
    required this.status,
    required this.data,
  });

  factory ProfileResponseModle.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModle(
      success: json['success'],
      status: json['status'],
      data: ProfileDataModel.fromJson(json['data']),
    );
  }
}
