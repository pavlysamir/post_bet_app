class EndPoint {
  static String baseUrlSubscraption = "https://post-bet.onrender.com";
  static String baseUrl = "https://post-bet.onrender.com";
  static String login = "/Auth/login";
  static String signUp = "/Auth/signUp";

  static String getOtp = "/Auth/verify-otp";
  static String forgotPassword = "/Auth/forget-password";
  static String changeForgetPassword = "/Auth/change-forget-password";

  static String verfyAccount = "/Auth/verifyAccount";

  static String subscraption = "/plans/subscribe";

  static String getUserDataEndPoint(id) {
    return "/User/$id";
  }

  static String plans = "/plans";
  static String contactUs = "/contactUs";
  static String promocode = "/promocode";

  static String changePassword = "/Auth/change-password";
  //   static String getPlaneDataEndPoint(padgeNumber,) {
  //   return "/plans/$id";
  // }
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
}
