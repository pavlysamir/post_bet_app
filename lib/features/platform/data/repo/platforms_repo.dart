import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:post_bet/features/platform/data/models/ayrshare_model.dart';
// import 'package:post_bet/core/api/end_ponits.dart';
// import 'package:post_bet/core/utils/service_locator.dart';
// import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
// import 'package:post_bet/features/platform/data/models/ayrshare_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

class PlatFormsRepositery {
  PlatFormsRepositery();
  static String profileKey =
      getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.profileKey);
  static const String baseUrl =
      'https://app.ayrshare.com/api/profiles/generateJWT';
  static const String authorizationHeader =
      'Bearer RTXFBZB-BW845M5-GAA8QE4-08PQ2ZR';
  static const String contentType = 'application/json';
  static const String domain = "id-z44be";
  static const String privateKey =
      "-----BEGIN RSA PRIVATE KEY-----\nMIIEogIBAAKCAQEAoIambr2xD7oheMJ9PtL0hLf51R/ncUgCG4NOoiKen2vav1ot\nhcHjg+vWHixAmbjR6a+oAn6XADj7nddTCFJOEUeCpFJrtP5Y57aC4ZL5Esd/3eS7\neFqjrcABUNSoHqRCf3CEazqDarS8j3/UTMbBYqXNGRkYrzeqJ8HvhgHBd793jTCS\njMqBGIEfTsE55D161e9c1rwPP2UWbZov1UtwmxUJKQ19UxMV6LWCB52ZyvE6iH5u\niCyBq/Nh7Qlb5RNEaB9kCmP2AQQhfMpwXXMZdefTu5J9NXjcYcMBmKL/ik9X9XN2\ned07WtpqqHxA5alEYk9Vk331/wBkz0xEkMoJsQIDAQABAoIBAAW6vJi+BEJ0kSKF\nZZE/GAtfIieDVaBHUszu1zkF/Y2g3LxA8JhCMvfHzHsD9xPNgw+BTaC2KjdPsVph\nP7VPs7nd6KmrB+1cOSnfC6WXuHRdQsD1m6PYb1hhnqJnDq+WSwnPpyhJHLzrocHI\n7RfG7crSsmLzkHwbg2MbIsyQhjpbAH1U+6TizAYYwoXnm6K+ZzPRzaZ4jHR2DlrU\nKi+qxnvn5mxUftpgKVP+5ercE5uowG6hEb8LfC8m5sP1STkONyvC3Ec/4+9qkcT7\nKYQb3oO571lxotKR+ABHj6vfir7oFWWGSDSQmVoKzs/ftbtO5kWMvvSZuxbbsKBb\nzBN5ooECgYEA2Mu65O4pjZTxzqFyz30lJWYfvKWf/evWLVsVW4d4vgDcMyIrBz4t\n/WShi2W70IWygb9bigOc/IiBx/+kRo+mHttJpgpYifBEv9EmNhNFDgBKCl+bbLXh\ngwFqkIM0URtvYZD+4HsHc4SEYo37z4z7NX3r5zd3cotR64U5diUhPPECgYEAvY37\nzYJYIIUoH/9/P/8JyKRNROn9vxtGss0oTr9mvkr/jEBE0QPjgA8PHcxcLIlY7F+i\nKSO4OKoB/hUr7zlVbXTdEg3C3mnAVR692exYabTaNExGfZqT9lg56aDWwxGUe3Z6\n75BKxS52AT5T/1wj7s27Wp8z7NJcIjHvoK9MmMECgYAIZ9XGPIm16Jl7hnz6GIMR\nMSV33gAXC0bRmV95ngYLb+MZxHBgpoOH+Jfe3MHsctKZ/z5gWoWCsRQ/GeVXqwgo\n2B3B51LJflxcB5Lws8yQn2g/gLd4/pBQ0QQ9uCiWIHcwFDwdngeK7g9n9tNVl8TB\nrTExVNA3y7kQZaj1sLjaMQKBgGNfLNOG8pZR2EA2HEq7dDCYWd234YuvS/fub6Qg\n2UcHYELxamI87KY0vtL7UJMUieaZGBUDIc+q6JKAHOEzqGJScpbFWhRpUigNjq/R\nJGR+KCpklkvAnrL1e57L7+qhq7qx2S7/8QLAIaLzPuvPLRNDDWYrsfgEK8LNdPdD\nDx/BAoGAW/T3FLAFH4yoROJlhxj/daPZsLp4UvbiNKF97qtEj+24BiaQl0yIOdtw\nU4FV92+kOl5gKjhUe/AtnginYCo1hcGK0ACQ+eWWfW5sRFTx0DQIRIkfZPO8io+Q\n6sVDVRlhjbwUA56vwzo6O/ZEwSZ+LP5gkfKr0DWXjx8gxqYZw4s=\n-----END RSA PRIVATE KEY-----";
  static const String urlComponent =
      'https://profile.ayrshare.com?domain=id-c9o06&jwt=https://profile.ayrshare.com?domain=id-c9o06&jwt=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.\neyJhcGlLZXkiOnsiaXYiOiJlZGUzMGE3MDM1MDcyOWU3YjVkNmQzZDliNTlhM2FjMSIsImNvbnRlbnQiOiIzZDA2NWViZjAzNmU2MGZiZWY0ZmQ4YTYyNWEwYzcxZTc5ZWE4ZGFlNTczMWQwYTUwZjFiZjA5YSJ9LCJwcm9maWxlS2V5Ijp7Iml2IjoiZWRlMzBhNzAzNTA3MjllN2I1ZDZkM2Q5YjU5YTNhYzEiLCJjb250ZW50IjoiN2QwNDRhYjU1MzQ0NDlkYmZkNGVmN2E5M2E5YTlkMWMyOGM3OWRmMDRhMGZjYmM1MWMwYWMxOWEifSwiaWF0IjoxNzE1ODk3NTk1LCJleHAiOjE3MTU4OTc4OTUsImF1ZCI6Imh0dHBzOi8vcHJvZmlsZS5heXJzaGFyZS5jb20iLCJpc3MiOiJpZC1jOW8wNiIsInN1YiI6InN1cHBvcnRAYXlyc2hhcmUuY29tIn0.\n';
  // getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.email);.com
  static const num expiresIn = 2600;
  static const String redirect = 'https://www.google.com/';

  Future<Either<String, String>> linkAccount() async {
    final Map<String, dynamic> data = {
      'domain': domain,
      'privateKey': privateKey,
      'profileKey': profileKey,
      'logout': true,
      'redirect': redirect,
      //'verify': true
    };

    final Dio dio = Dio();
    dio.options.headers = <String, dynamic>{
      'Authorization': authorizationHeader,
      'Content-Type': contentType,
    };

    try {
      final response = await dio.post(baseUrl, data: jsonEncode(data));

      final responseAyrshare = AyrshareResponse.fromJson(response.data);
      //final url = Uri.decodeFull(responseAyrshare.url);
      // print(url);

      //print(responseAyrshare.token);

      // File file = File(responseAyrshare.url);
      // print(file.path);
      // print(responseAyrshare.url);
      // print(myUrl);
      //List<String> parts = responseAyrshare.token.split('.');
      // String one = parts[0];
      // String two = parts[1];
      // String three = parts[2];
      // String myUrl =
      //     'https://profile.ayrshare.com?domain=id-c9o06&jwt=${responseAyrshare.token}';
      //String jjj = Uri.decodeComponent(myUrl);

      return Right(responseAyrshare.url); // Handle successful response
    } on DioError catch (error) {
      // Handle error based on error.type and error.response
      print('Error linking social account: ${error.message}');
      return Left(error.message!); // Re-throw for further handling (optional)
    }
  }

  // Future<String> generateJWT() async {
  //   final Map<String, dynamic> data = {
  //     'domain': domain,
  //     'privateKey': privateKey,
  //     'profileKey': profileKey,
  //   };
  //   var url = Uri.https(baseUrl, '/api/profiles/generateJWT');
  //   var response = await http.post(
  //     url,
  //     headers: {
  //       'Authorization': authorizationHeader,
  //       'Content-type': 'application/json'
  //     },
  //     body: json.encode(data),
  //   );
  //   return response.body;
  // }
}
