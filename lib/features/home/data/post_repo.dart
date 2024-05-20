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

  String authorizationHeader = 'Bearer RTXFBZB-BW845M5-GAA8QE4-08PQ2ZR';
  String contentType = 'application/json';

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

  Future<Either<String, String>> getUploadUrl(
      {required String fileName}) async {
    final dio = Dio();

    // Set authorization header with your API key
    dio.options.headers = <String, dynamic>{
      'Authorization': authorizationHeader,
    };

    try {
      final response = await dio.get(
        'https://app.ayrshare.com/api/media/uploadUrl',
        queryParameters: {'fileName': fileName, 'contentType': 'video/mp4'},
      );

      if (response.statusCode == 200) {
        // Handle successful response
        final data = response.data as Map<String, dynamic>;
        final uploadUrl = data['uploadUrl'] as String;

        print('qqqqqqqqqqqqqqqqqqqqqqqqqqqqqq${uploadUrl}');

        return Right(uploadUrl);
      } else {
        // Handle error
        throw Exception('Failed to get upload URL: ${response.statusCode}');
      }
    } on DioError catch (e) {
      // Handle Dio specific exceptions
      throw Exception('Error occurred: ${e.message}');
    } catch (e) {
      // Handle other exceptions
      throw Exception('An unexpected error occurred: $e');
      // try {
      //   final response = await api.get(
      //     baseUrlUbloadVideo,
      //     queryParameters: {'fileName': fileName, 'contentType': 'video/mp4'},
      //   );
      //   final upload = response.data['accessUrl'];
      //   return Right(upload);
      // } on ServerException catch (e) {
      //   return Left(e.errModel.error!);
      // }
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
}
