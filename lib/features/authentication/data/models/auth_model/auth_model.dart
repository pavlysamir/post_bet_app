import 'package:post_bet/features/authentication/data/models/auth_model/auth_data_model.dart';

class AuthResponseModle {
  final bool success;
  final int status;
  final AuthDataModel data;

  AuthResponseModle({
    required this.success,
    required this.status,
    required this.data,
  });

  factory AuthResponseModle.fromJson(Map<String, dynamic> json) {
    return AuthResponseModle(
      success: json['success'],
      status: json['status'],
      data: AuthDataModel.fromJson(json['data']),
    );
  }
}
