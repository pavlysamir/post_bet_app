class RegisterModel {
  final bool success;
  final int status;
  final String data;

  RegisterModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      success: json['success'],
      status: json['status'],
      data: json['data'],
    );
  }
}
