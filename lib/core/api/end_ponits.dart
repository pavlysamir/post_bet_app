class EndPoint {
  static String baseUrlSubscraption = "https://post-bet.onrender.com";
  static String baseUrl = "http://195.35.0.65:4000";
  //'http://195.35.0.65:4000';
  // "https://post-bet.onrender.com";
  static String login = "/Auth/login";
  static String signUp = "/Auth/signUp";
  static const String baseUrlLinkSocial =
      'https://app.ayrshare.com/api/profiles/generateJWT';
  static const String authorizationHeader =
      'Bearer ZE5QBZX-0EVMJB0-MEZKHHT-H0ZEPEV';
  static const String contentType = 'application/json';
  static String getOtp = "/Auth/verify-otp";
  static String forgotPassword = "/Auth/forget-password";
  static String changeForgetPassword = "/Auth/change-forget-password";
  static String verfyAccount = "/Auth/verifyAccount";

  static String subscraption = "/plans/subscribe";

  static String getUserDataEndPoint(id) {
    return "/User/$id";
  }

  static String confirnSubscribeEndPoint(refId) {
    return "/plans/subscribe/confirmPayment/$refId";
  }

  static String plans = "/plans";
  static String contactUs = "/contactUs";
  static String promocode = "/promocode";

  static String changePassword = "/Auth/change-password";
  static String mySubscraption = "/plans/mySubscribtions";

  // static String mySubscraption(id) {
  //   return "/plans/mySubscribtions/$id";
  // }

  //   static String getPlaneDataEndPoint(padgeNumber,) {
  //   return "/plans/$id";
  // }
  //
  //https://post-bet.onrender.com/plans/mySubscribtions
}

class ApiKey {
  static String status = "statusCode";
  static String errorMessage = "message";
  static String error = "errors";
  static String email = "email";
  static String password = "password";
  static String otp = "otp";
  static String newForgetPassword = "newPassword";
  static String token = "token";
  static String message = "message";
  static String id = "id";
  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profileImage";
  static String authorizationHeader = "Authorization";
  static String verfyAccount = "verfyAccount";
  static String oldPassword = "oldPassword";
  static String newPassword = "newPassword";
  static String promoCode = "promoCode";
  static String planId = "planId";
  static String profileKey = "profileKey";

  static String refId = "refId";
  static String chargeId = "chargeId";
  static String transactionUrl = "transactionUrl";
  static String plan = "plan";
  static String mySubscribeId = "subscrabtionId";
  static String limitNumberOfPostsPerDay = "limitNumberOfPostsPerDay";
}
