import 'package:post_bet/features/authentication/data/models/user_data_model/user_data_model.dart';

class UserDataResponseModel {
  final bool success;
  final int status;
  final UserDataModel data;

  UserDataResponseModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory UserDataResponseModel.fromJson(Map<String, dynamic> json) {
    return UserDataResponseModel(
      success: json['success'],
      status: json['status'],
      data: UserDataModel.fromJson(json['data']),
    );
  }
}
