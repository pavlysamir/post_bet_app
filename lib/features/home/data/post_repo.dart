import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class PostReposatory {
  PostReposatory();
  static const String baseUrlUbloadImg =
      'https://app.ayrshare.com/api/media/upload';

  static const String baseUrlPsting =
      'https://app.ayrshare.com/api/media/upload';

  static const String authorizationHeader =
      'Bearer JZ71CXE-06T4YBE-KST6KRV-5AR78B2';
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
    final dio = Dio();

    final Map<String, dynamic> data = {
      'post': postContent,
      'platform': selectedPlatforms
          .map((platform) => {'platform': platform, 'isSelected': true})
          .toList(),
      'mediaUrls': mediaUrl,
    };

    dio.options.headers = <String, dynamic>{
      'Authorization': authorizationHeader,
      'Content-Type': contentType,
    };
    final jsonData = jsonEncode(data);
    try {
      final response = await dio.post(
        baseUrlUbloadImg,
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
