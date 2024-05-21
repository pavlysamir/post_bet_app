import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:post_bet/core/api/api_consumer.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';

class PostReposatory {
  final ApiConsumer api;

  PostReposatory(this.api);
  String baseUrlUbloadImg = 'https://app.ayrshare.com/api/media/upload';

  String baseUrlUbloadVideo = ' https://app.ayrshare.com/api/media/uploadUrl';
  // String profileKey =
  //     getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.profileKey);

  String? id = getIt
      .get<CashHelperSharedPreferences>()
      .getData(key: ApiKey.mySubscribeId);

  // static String baseUrlPosting =
  //     'https://post-bet.onrender.com/Posting/post/$id';
  // 'https://post-bet.onrender.com/Posting/post';
  String baseUrlPosting(id) {
    return 'https://post-bet.onrender.com/Posting/post/$id';
  }

  String authorizationHeader = 'Bearer Z0XN85Z-CQRMH8W-QQE6FY4-2Y85SXW';
  String contentType = 'application/json';

  Future<String> uploadFile(String filePath) async {
    final file = File(filePath);
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath,
          filename: file.path.split('/').last),
    });
    print(formData);
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

  String? accessUrl;
  Future<Either<String, String>> getUploadUrl(String fileName) async {
    try {
      File videoFile = File(fileName);
      print(fileName);
      final dio = Dio();
      dio.options.headers = <String, dynamic>{
        'Authorization': authorizationHeader,
      };
      final response = await dio.get(
        'https://app.ayrshare.com/api/media/uploadUrl',
        queryParameters: {
          'fileName': Uri.encodeComponent(fileName),
          'contentType': 'video/mp4',
        },
      );
      accessUrl = response.data['accessUrl'].toString();
      final uploadUrl = response.data['uploadUrl'] as String;

      print('yaaaaaaaaaaaaaarb $accessUrl');
      print('yaaaaaaaaaaaaaarb $uploadUrl');

      return Right(accessUrl!);
    } catch (e) {
      return Left(e.toString());
    }
  }

  bool isUrlExist = false;
  Future<Either<String, bool>> verifyUrl() async {
    try {
      final dio = Dio();
      dio.options.headers = <String, dynamic>{
        'Authorization': authorizationHeader,
        'Content-Type': 'application/json',
      };
      final response = await dio.post(
        'https://app.ayrshare.com/api/media/urlExists',
        data: {'mediaUrl': accessUrl!},
      );
      isUrlExist = response.data['status'];

      print('yaaaaaaaaaaaaaarb ${isUrlExist.toString()}');
      return Right(isUrlExist);
    } catch (e) {
      print(e.toString());
      return Left(e.toString());
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
      'mediaUrls': mediaUrl,
    };

    if (token != null) {
      dio.options.headers = <String, dynamic>{
        'Authorization': 'Bearer $token',
        'Content-Type': contentType,
      };
    }
    final jsonData = jsonEncode(data);

    int? id = getIt
        .get<CashHelperSharedPreferences>()
        .getData(key: ApiKey.mySubscribeId);
    try {
      final response = await dio.post(
        baseUrlPosting(id),
        data: jsonData,
      );
      print(response);
      return response;
    } on DioError catch (error) {
      print('Error uploading file: ${error.message}');
      rethrow; // Re-throw for further handling if needed
    }
  }

  Future<Response> createVideoPost(
    String postContent,
    List<String> selectedPlatforms,
  ) async {
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
      'mediaUrls': accessUrl,
      'isVideo': true
    };

    if (token != null) {
      dio.options.headers = <String, dynamic>{
        'Authorization': 'Bearer $token',
        'Content-Type': contentType,
      };
    }
    final jsonData = jsonEncode(data);

    int? id = getIt
        .get<CashHelperSharedPreferences>()
        .getData(key: ApiKey.mySubscribeId);
    try {
      final response = await dio.post(
        baseUrlPosting(id),
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
