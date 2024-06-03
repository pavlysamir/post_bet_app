class UserResponse {
  final bool success;
  final int status;
  final UserData data;

  UserResponse({
    required this.success,
    required this.status,
    required this.data,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      success: json['success'],
      status: json['status'],
      data: UserData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'status': status,
      'data': data.toJson(),
    };
  }
}

class UserData {
  final int id;
  final String createdAt;
  final String updatedAt;
  final String? name;
  final String email;
  final bool isActive;
  final bool suspended;
  final String userType;
  final String? profileImage;
  final String? otp;
  final String? profileKey;
  final String? refId;
  final String? otpRequestDate;
  final bool verifiedOtp;
  final String lastLoginTime;
  final bool haveAccount;
  final bool firstTime;
  final List<UserProgramSubscription> userProgramSubscriptions;
  final String token;

  UserData({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.name,
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
    required this.userProgramSubscriptions,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      name: json['name'],
      email: json['email'],
      isActive: json['isActive'],
      suspended: json['suspended'],
      userType: json['userType'],
      profileImage: json['profileImage'],
      otp: json['otp'],
      profileKey: json['profileKey'],
      refId: json['refId'],
      otpRequestDate: json['otpRequestDate'],
      verifiedOtp: json['verifiedOtp'],
      lastLoginTime: json['lastLoginTime'],
      haveAccount: json['haveAccount'],
      firstTime: json['firstTime'],
      userProgramSubscriptions: (json['userProgramSubscriptions'] as List)
          .map((e) => UserProgramSubscription.fromJson(e))
          .toList(),
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'name': name,
      'email': email,
      'isActive': isActive,
      'suspended': suspended,
      'userType': userType,
      'profileImage': profileImage,
      'otp': otp,
      'profileKey': profileKey,
      'refId': refId,
      'otpRequestDate': otpRequestDate,
      'verifiedOtp': verifiedOtp,
      'lastLoginTime': lastLoginTime,
      'haveAccount': haveAccount,
      'firstTime': firstTime,
      'userProgramSubscriptions':
          userProgramSubscriptions.map((e) => e.toJson()).toList(),
      'token': token,
    };
  }
}

class UserProgramSubscription {
  final int id;
  final String paymentStatus;
  final String startDayPlanSubscription;
  final int planUsedCounter;
  final Plan plan;

  UserProgramSubscription({
    required this.id,
    required this.paymentStatus,
    required this.startDayPlanSubscription,
    required this.planUsedCounter,
    required this.plan,
  });

  factory UserProgramSubscription.fromJson(Map<String, dynamic> json) {
    return UserProgramSubscription(
      id: json['id'],
      paymentStatus: json['paymentStatus'],
      startDayPlanSubscription: json['startDayPlanSubscription'],
      planUsedCounter: json['planUsedCounter'],
      plan: Plan.fromJson(json['plan']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'paymentStatus': paymentStatus,
      'startDayPlanSubscription': startDayPlanSubscription,
      'planUsedCounter': planUsedCounter,
      'plan': plan.toJson(),
    };
  }
}

class Plan {
  final int id;
  final String name;

  Plan({
    required this.id,
    required this.name,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class MySubscriptionResponse {
  final List<UserProgramSubscription> subscriptions;

  MySubscriptionResponse({
    required this.subscriptions,
  });

  factory MySubscriptionResponse.fromJson(List<dynamic> json) =>
      MySubscriptionResponse(
        subscriptions: json
            .map((dynamic item) => UserProgramSubscription.fromJson(item))
            .toList(),
      );
}
