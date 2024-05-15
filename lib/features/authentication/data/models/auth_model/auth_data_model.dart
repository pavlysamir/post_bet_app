class AuthDataModel {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String email;
  final bool isActive;
  final bool suspended;
  final String userType;
  final String? profileImage;
  final String? otp;
  final String? profileKey;
  final String? refId;
  final DateTime? otpRequestDate;
  final bool verifiedOtp;
  final DateTime lastLoginTime;
  final bool haveAccount;
  final bool firstTime;
  final String token;

  AuthDataModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.email,
    required this.isActive,
    required this.suspended,
    required this.userType,
    this.profileImage,
    this.otp,
    this.profileKey,
    this.refId,
    this.otpRequestDate,
    required this.verifiedOtp,
    required this.lastLoginTime,
    required this.haveAccount,
    required this.firstTime,
    required this.token,
  });

  factory AuthDataModel.fromJson(Map<String, dynamic> json) {
    return AuthDataModel(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      name: json['name'],
      email: json['email'],
      isActive: json['isActive'],
      suspended: json['suspended'],
      userType: json['userType'],
      profileImage: json['profileImage'],
      otp: json['otp'],
      profileKey: json['profileKey'],
      refId: json['refId'],
      otpRequestDate: json['otpRequestDate'] != null
          ? DateTime.parse(json['otpRequestDate'])
          : null,
      verifiedOtp: json['verifiedOtp'],
      lastLoginTime: DateTime.parse(json['lastLoginTime']),
      haveAccount: json['haveAccount'],
      firstTime: json['firstTime'],
      token: json['token'],
    );
  }
}
