class EndPoint {
  static String baseUrl = "https://post-bet.onrender.com";
  static String login = "/Auth/login";
  static String signUp = "/Auth/signUp";
  static String getUserDataEndPoint(id) {
    return "/User/$id";
  }
}

class ApiKey {
  static String status = "statusCode";
  static String errorMessage = "message";
  static String error = "errors";

  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String message = "message";
  static String id = "id";
  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";
  static String authorizationHeader = "Authorization";
}
