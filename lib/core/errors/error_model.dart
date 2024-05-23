import 'package:post_bet/core/api/end_ponits.dart';

class ErrorModel {
  final int? status;
  final String? errorMessage;
  final String? error;

  ErrorModel({
    required this.status,
    required this.errorMessage,
    required this.error,
  });
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData[ApiKey.status],
      errorMessage: jsonData[ApiKey.errorMessage] ?? 'Unknown error',
      error: jsonData[ApiKey.error] ?? 'Unknown error',
    );
  }
}
