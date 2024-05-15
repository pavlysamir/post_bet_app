import 'dart:convert';

import 'package:dio/dio.dart';

class PlatFormsRepositery {
  PlatFormsRepositery();

  static const String baseUrl =
      'https://app.ayrshare.com/api/profiles/generateJWT';
  static const String authorizationHeader =
      'Bearer ZE5QBZX-0EVMJB0-MEZKHHT-H0ZEPEV';
  static const String contentType = 'application/json';
  static const String domain = "id-aa20p";
  static const String privateKey =
      "-----BEGIN RSA PRIVATE KEY-----\nMIIFLTBXBgkqhkiG9w0BBQ0wSjApBgkqhkiG9w0BBQwwHAQIr6xdTpQSmxQCAggA\nMAwGCCqGSIb3DQIJBQAwHQYJYIZIAWUDBAEqBBAGSG0wtZKWU7rdQvcmPwxPBIIE\n0GuOLu6mK3SVIH/akEDsCuYKRReiFJa8yHX0AaVzmaQY9kCjJBr6Of8hzFY6RSPK\nopeSTPNytxZDHAIlcdkQkSs4U6oKMsJnTGg2aIphF3jOTtNhRkGqreThYsKFUoUt\nGlyw9FizWo/qxN27TGxtyf9osu8eSeMvb5Ms0jjpwaih6/wpNT/y2uj48fFNtPXX\n6tRHzJKzgYfhAGhkUBemSiD9QT39BwYhN1QW913FFSM9CexDrMR4AYVTTPmZoTcT\nD8s3KmieH2RafkGo4PPLq/m7ry9/+pJweQC81Bl85qujo3MoIi+8Nk9kGDB6RYo9\nVyq5mMRyMY1lPvblZwRyTGkmSOvoBJI6CHWX5d0x4RYZwQXSIFv/0Rbnv3VD+Tz0\nd5MxFYNOMTr5fmT5oN4aDy/ma55X7WrNcc9Jrmjs9bC4wmgdn6S2c+cGlRx5UhbZ\nQxOyBd9F2pLPxnGwqGVxqIB+dOAXZkE1/oniy5GUo6EMD3h2+I9i7OTkliRCSFlM\nVZeTh+mTHEpoc2BSlAbAYL4PV1Vu8VB3B4JonyQwPglfp0tsUfQxMDe5mqyFw+vz\ngPS7c7U7UFgyOYWX+OOcNt76S0Px6JgIuPEr44U5LVFtKcDWEmFs3sedVUVsx/Ln\n3YEfRzGeIUE34aWq5/9q2WAIDSG9PzvmbJjGav+PwQghIntO4Md7LO9bQ43BneFk\nI/eR0ujSkHZ+BDrOThu9M3orOtZ1sNlBYLAVJI1wiH3noLCXHqfzY7OawAtk3PrT\nodE2RtcmqPZCiOyH9YqcUARCtHQDRlkTHUqKRG4AQyBW0VOYKGRjxpj0iT0s5ysG\n4xbrf8F0MAXTGhR7m283T66sqTWrBTngLL4Vw5Ol65ANIfX+ByxtU4sqg0ReNq/4\njIke+fyZb0oWEV0+F2KHhh5YC5MeveEVbWSznzYe4UvPiYixP9IV21d6oUsBX2jU\n7HaLxc6mWAAv0fV5fzRrl7NbS/nuVhcL4VcH53HYSJK4hBsk4XyAdNm/j+tfaSS8\nwywHzolICe2T9TeQsh3Xh59BTvHOIf9rU4WoHhLPrxCeIC/eqJF8NLCkHt3wQNhK\nJTiP7C8NaHVQ3ZweDqKPniRIrsXjwKp/WooIFEVQNnPgs0VdR4hQgfKWnd78bM8f\nVaLUJiiffjYJXDtjUwNS0qX/nbiDu55T5Wrur73tQtjWzGg7mOCzLgOJWbyVR8j/\nXQGCxykj/yjEiRPxGB8alw50x614isVkgr08yjd9fK5iV6TgFPBTCnpKBXNhgVg5\nKypfZTDJ8r5oYBW8c0XYeQ8dJakN4O2A8Qs1EHluDfwz7hlZ087gFePQgtoyT+S7\nHPONCa4H92+uD9+/oGndtjN1GKNPD54t19lKZjwAqqBriJVePVGn48GiEbt1jWOZ\nhtQUup1Wg1Qi3HD0/kI/UpvbMNJFm2BOMf6E8T/3ew77chELZ1ZyxTEbJ5ydE39S\n0NQGpZFxJKw2Oh42XmL73DAlSMgAEyTKStwUMkMn33WB2aisSGx1Cf+kmMXNTGRy\ncNJIvulNxJjueMSTTqwrj9T5I8c0fNFgJRZpltguKMLKGxLkikgPw9ugLKwieBsz\nC0Q07VkfyGz1ZhfVhxoQF0ap80HT026ad4Na1isXKxB\n-----END RSA PRIVATE KEY-----";
  static const String profileKey = "MMB3RE0-DX1MYQF-J064PE8-F89Q370";
  static String email = "husseinfayed86@gmail.com";

  // getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.email);
  static const num expiresIn = 10;
  static const String redirect = 'https://www.google.com/';

  Future<Response<dynamic>> linkAccount() async {
    final Map<String, dynamic> data = {
      'domain': domain,
      'privateKey': privateKey,
      'profileKey': profileKey,
      'email': {
        'to': email,
      },
      'expiresIn': expiresIn,
      'redirect': redirect,
    };
    print(jsonEncode(data));

    final Dio dio = Dio();
    dio.options.headers = <String, dynamic>{
      'Authorization': authorizationHeader,
      'Content-Type': contentType,
    };

    try {
      final response = await dio.post(baseUrl, data: jsonEncode(data));
      return response; // Handle successful response
    } on DioError catch (error) {
      // Handle error based on error.type and error.response
      print('Error linking social account: ${error.message}');
      rethrow; // Re-throw for further handling (optional)
    }
  }
}
