import 'package:post_bet/features/authentication/data/models/auth_model/auth_data_model.dart';

class ProfileResponseModle {
  final bool success;
  final int status;
  final AuthDataModel data;

  ProfileResponseModle({
    required this.success,
    required this.status,
    required this.data,
  });

  factory ProfileResponseModle.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModle(
      success: json['success'],
      status: json['status'],
      data: AuthDataModel.fromJson(json['data']),
    );
  }
}
