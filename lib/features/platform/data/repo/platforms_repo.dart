import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:post_bet/features/platform/data/models/ayrshare_model.dart';
// import 'package:post_bet/core/api/end_ponits.dart';
// import 'package:post_bet/core/utils/service_locator.dart';
// import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
// import 'package:post_bet/features/platform/data/models/ayrshare_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

class PlatFormsRepositery {
  PlatFormsRepositery();
  static String profileKey = 'G5YZ6SN-T5WM93F-GEYB23V-6J0CA0Q';
  //getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.profileKey);
  static const String baseUrl =
      'https://app.ayrshare.com/api/profiles/generateJWT';
  static const String authorizationHeader =
      'Bearer JZ71CXE-06T4YBE-KST6KRV-5AR78B2';
  static const String contentType = 'application/json';
  static const String domain = "id-c9o06";
  static const String privateKey =
      "-----BEGIN RSA PRIVATE KEY-----\nMIIEowIBAAKCAQEAtfv3bkiNdv8zin1M6mKrUdFYhtfQ6u0poqEAEM7YVcq9/wfA\nyD1uHvGyTVa2CGHbEc76CyNdxK34LCW7DIMoIFYZSmUzE1vSRukAlOad1VPpRgf3\nlIiNdEUyy+dpzJkJoQHzLP7qFS8O+CRupTFaJdcUokUd3YeXwMfLH+np7y9jXgSc\n9mg0726eb/3SJkHf+e8W7m8jATctg3t30xUYtXenxvUdxlQekUetkj9ITP4pxF2a\nP8CdbX48VfuptR+4XugXrPdw9zdPXTrsE50JPcTWbN35LNnFE4WKDxJ2XvOCngBR\nXnJgdE49f+m3TMx/YCeWLm07w4ptUBchQShMvwIDAQABAoIBABCoXH4rmvNU/x6X\n7eXtxoO/N1dkbXr2NB+ZlXF0at3zfbpYjH9ntsA+BxWdhce0+VdNzEUfusde1elo\nl2YDorUkXGfwZSFKVYWTHLAEf1cAZB5lFUxIcYuT1/H3yo86mjndfVOq47oGVtxE\n2ByRLLtrpA0JvubrsJV/VEBQFM8wA4i2+ZwktBRzD2+XE/A1dimvFVoMbVm+rdVI\nWU/K1OuBPRsg7Yg8L98fxr20enVuQBk9+VEgsojPs1VkW7Ks2tz3fwwG6DFK7BLl\ng95uaD2qTYgAbWLKgRBgWZ0UDccSEYUC/EWpyt7PkPhgfRg7kRM8jo9Vu1GX3cat\nKqNpEkECgYEA4fKp8e0/b9hEXIcBUYolml8vWElQEnkw8R1sBmW92fNQcYiI2z42\nIKc0l6DN3xlxf/QZ8M+vlpT1wWmtTYe/RrbgRqtJkrq+v4QYJQbWGQqZGzPFjVw6\nzdPTHH9dTn2OBVj1lsINidvvxU71OIFyOgmCroAWfrUJXcLCeKQd5/8CgYEAzjBg\nggF//OyVbSIn7hgru5oG+Y1ajPioE9EAzTGPsB4BF1/JQYk+7N3c+sgEgSrQQlzV\nIZW0iTtQzfNL7k1REn3fqKDAh28V7nky4EJFyhS4akqLSvBTdzxzQyjjr0wKZyOp\nqrcbDUO4BJ2ZpDmeKvWhl5eCbl1IBi0NIt3nm0ECgYBR4aTgvX+NwqwTdAFwUUYL\nSY9YyUixSSYJWwY400oX3+s5Gaeu/D6VWsLeaDHzNb9CBW4ZLMqPIXBmJSveuuEA\neWmRcqV4/R//O5mcYXvZG1Qc3YgsEE5nJOqOm0FvHmUHXxOxDKXnXcLomBKZ5Z9F\nlQi8wEJmrKi2R8w9+Au2dQKBgQCZpfk0x/NdQdu0IKDKz14/hW8vJcPVizKM2dGU\nFxuxLRq5FVr/KEwo7MfQZZ7dtk7NNSppxYpsPTRg1K2/ngQNGJnDqk7uXbxlIhHk\nhd5F0Zz/MB+Or3ozP2vRHzZUGgEijLPRkHNrNgx5/AtTEtCnyLUrJu8+WOrkF0xT\nsDL4QQKBgEknfRqHkCEAKN4Al6SvA8cH45fChe9NBshX5xUn1olRc9iEkXsRDMFr\nmAFNdzhs86R1n66gJ4naugRGJjYZAL/jdvN7EZ/XJskHlbvsLn1cKYL6qkOlKDru\nVopGsyhjmZNXVfSIfS+q0g5pDooYVRXth2O3FJXUpndbym0CoXGw\n-----END RSA PRIVATE KEY-----";
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
    };

    final Dio dio = Dio();
    dio.options.headers = <String, dynamic>{
      'Authorization': authorizationHeader,
      'Content-Type': contentType,
    };

    try {
      final response = await dio.post(baseUrl, data: jsonEncode(data));

      final responseAyrshare = AyrshareResponse.fromJson(response.data);
      final url = Uri.decodeFull(responseAyrshare.url);
      print(url);

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

      return Right(url); // Handle successful response
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
