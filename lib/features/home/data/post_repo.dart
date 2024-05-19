import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';

class PostReposatory {
  PostReposatory();
  static const String baseUrlUbloadImg =
      'https://app.ayrshare.com/api/media/upload';
  static String profileKey =
      getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.profileKey);

  static const String baseUrlPosting =
      'https://post-bet.onrender.com/Posting/post';
  // 'https://post-bet.onrender.com/Posting/post';

  static const String authorizationHeader =
      'Bearer RTXFBZB-BW845M5-GAA8QE4-08PQ2ZR';
  static const String contentType = 'application/json';

  Future<String> uploadFile(String filePath) async {
    final file = File(filePath);
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath,
          filename: file.path.split('/').last),
    });

    final dio = Dio();
    dio.options.headers = <String, dynamic>{
      'Authorization': authorizationHeader,
      'Content-Type': contentType,
      //'Profile-Key': profileKey
    };

    try {
      final response = await dio.post(
        baseUrlUbloadImg,
        data: formData,
      );
      print(response.data);
      return response.data['url'];
    } on DioError catch (error) {
      print('Error uploading file: ${error.message}');
      rethrow; // Re-throw for further handling if needed
    }
  }

  Future<Response> createPost(String postContent,
      List<String> selectedPlatforms, String mediaUrl) async {
    print(selectedPlatforms
        .map((platform) => {"platform": platform, "isSelected": true})
        .toList());

    String? token =
        getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.token);

    // If token is not null, add it to the request headers as a Bearer token

    final dio = Dio();

    final Map<String, dynamic> data = {
      'post': postContent,
      'platform': selectedPlatforms
          .map((platform) => {"platform": platform, "isSelected": true})
          .toList(),
      //'mediaUrls': mediaUrl,
    };

    if (token != null) {
      dio.options.headers = <String, dynamic>{
        'Authorization': 'Bearer $token',
        'Content-Type': contentType,
      };
    }
    final jsonData = jsonEncode(data);
    try {
      final response = await dio.post(
        baseUrlPosting,
        data: jsonData,
      );
      print(response);
      return response;
    } on DioError catch (error) {
      print('Error uploading file: ${error.message}');
      rethrow; // Re-throw for further handling if needed
    }
  }
}
