class ProfileResponseModle {
  final bool success;
  final int status;
  final String data;

  ProfileResponseModle({
    required this.success,
    required this.status,
    required this.data,
  });

  factory ProfileResponseModle.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModle(
      success: json['success'],
      status: json['status'],
      data: json['data'],
    );
  }
}
