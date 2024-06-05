import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:post_bet/core/api/api_consumer.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/errors/exceptions.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

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
    return 'https://postbet.ae/Posting/post/$id';
  }

  String authorizationHeader =
      'Bearer ${getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.profileKey)}';
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
      'Authorization':
          'Bearer ${getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.profileKey)}',
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
    } on ServerException catch (e) {
      return e.errModel.error!;
    }
  }

  Future<String> uploadTempleteFile(String assetPath) async {
    // Load the image from assets as bytes
    final ByteData byteData = await rootBundle.load(assetPath);
    final List<int> imageData = byteData.buffer.asUint8List();

    // Create a MultipartFile from the image bytes
    final multipartFile = MultipartFile.fromBytes(
      imageData,
      filename: assetPath.split('/').last,
    );

    final formData = FormData.fromMap({
      'file': multipartFile,
    });

    print(formData);

    final dio = Dio();
    (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options.headers = <String, dynamic>{
      'Authorization':
          'Bearer ${getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.profileKey)}',
      'Content-Type': 'multipart/form-data',
    };

    try {
      final response = await dio.post(
        baseUrlUbloadImg, // Replace this with your actual upload URL
        data: formData,
      );
      print(response.data);
      return response.data['url'];
    } on ServerException catch (e) {
      return e.errModel.error!;
    }
  }

  // String? accessUrl;
  // Future<Either<String, String>> getUploadUrl(String fileName) async {
  //   try {
  //     File videoFile = File(fileName);
  //     print(fileName);
  //     final dio = Dio();
  //     dio.options.headers = <String, dynamic>{
  //       'Authorization': authorizationHeader,
  //     };
  //     final response = await dio.get(
  //       'https://app.ayrshare.com/api/media/uploadUrl',
  //       queryParameters: {
  //         'fileName': Uri.encodeComponent(fileName),
  //         'contentType': 'video/mp4',
  //       },
  //     );
  //     accessUrl = response.data['accessUrl'].toString();
  //     final uploadUrl = response.data['uploadUrl'] as String;

  //     print('yaaaaaaaaaaaaaarb $accessUrl');
  //     print('yaaaaaaaaaaaaaarb $uploadUrl');

  //     return Right(accessUrl!);
  //   } catch (e) {
  //     return Left(e.toString());
  //   }
  // }

  // bool isUrlExist = false;
  // Future<Either<String, bool>> verifyUrl() async {
  //   try {
  //     final dio = Dio();
  //     dio.options.headers = <String, dynamic>{
  //       'Authorization': authorizationHeader,
  //       'Content-Type': 'application/json',
  //     };
  //     final response = await dio.post(
  //       'https://app.ayrshare.com/api/media/urlExists',
  //       data: {'mediaUrl': accessUrl!},
  //     );
  //     isUrlExist = response.data['status'];

  //     print('yaaaaaaaaaaaaaarb ${isUrlExist.toString()}');
  //     return Right(isUrlExist);
  //   } catch (e) {
  //     print(e.toString());
  //     return Left(e.toString());
  //   }
  // }

  Future<Response> createPost(String postContent,
      List<String> selectedPlatforms, List<String> mediaUrl) async {
    print(selectedPlatforms
        .map((platform) => {"platform": platform, "isSelected": true})
        .toList());

    String? token =
        getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.token);

    // If token is not null, add it to the request headers as a Bearer token

    final dio = Dio();
    (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

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

    print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb $id');
    try {
      final response = await dio.post(
        baseUrlPosting(id),
        data: data,
      );
      print(response);
      return response;
    } on DioError catch (error) {
      print('Error uploading file: ${error.message}');
      rethrow; // Re-throw for further handling if needed
    }
  }

  Future<Response> createFaceBookPost(String postContent,
      List<String> selectedPlatforms, List<String> mediaUrl) async {
    print(selectedPlatforms
        .map((platform) => {"platform": platform, "isSelected": true})
        .toList());

    String? token =
        getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.token);

    // If token is not null, add it to the request headers as a Bearer token

    final dio = Dio();
    (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    final Map<String, dynamic> data = {
      'post': postContent,
      'platform': [
        {"platform": "Facebook", "isSelected": true}
      ],
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

    print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb $id');
    try {
      final response = await dio.post(
        baseUrlPosting(id),
        data: data,
      );
      print(response);
      return response;
    } on DioError catch (error) {
      print('Error uploading file: ${error.message}');
      rethrow; // Re-throw for further handling if needed
    }
  }

  Future<Response> createInstagramPost(String postContent,
      List<String> selectedPlatforms, List<String> mediaUrl) async {
    print(selectedPlatforms
        .map((platform) => {"platform": platform, "isSelected": true})
        .toList());

    String? token =
        getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.token);

    // If token is not null, add it to the request headers as a Bearer token

    final dio = Dio();
    (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    final Map<String, dynamic> data = {
      'post': postContent,
      'platform': [
        {"platform": "Instagram", "isSelected": true}
      ],
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

    print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb $id');
    try {
      final response = await dio.post(
        baseUrlPosting(id),
        data: data,
      );
      print(response);
      return response;
    } on DioError catch (error) {
      print('Error uploading file: ${error.message}');
      rethrow; // Re-throw for further handling if needed
    }
  }

  Future<Response> createTextPost(
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
    (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    final Map<String, dynamic> data = {
      'post': postContent,
      'platform': selectedPlatforms
          .map((platform) => {"platform": platform, "isSelected": true})
          .toList(),
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

    print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb $id');
    try {
      final response = await dio.post(
        baseUrlPosting(id),
        data: data,
      );
      print(response);
      return response;
    } on DioError catch (error) {
      print('Error uploading file: ${error.message}');
      rethrow; // Re-throw for further handling if needed
    }
  }

  Future<Response> createFaceBookTextPost(
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
    (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    final Map<String, dynamic> data = {
      'post': postContent,
      'platform': [
        {"platform": "Facebook", "isSelected": true}
      ],
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

    print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb $id');
    try {
      final response = await dio.post(
        baseUrlPosting(id),
        data: data,
      );
      print(response);
      return response;
    } on DioError catch (error) {
      print('Error uploading file: ${error.message}');
      rethrow; // Re-throw for further handling if needed
    }
  }

  Future<Response> createInstagramTextPost(
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
    (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    final Map<String, dynamic> data = {
      'post': postContent,
      'platform': [
        {"platform": "Instagram", "isSelected": true}
      ],
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

    print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb $id');
    try {
      final response = await dio.post(
        baseUrlPosting(id),
        data: data,
      );
      print(response);
      return response;
    } on DioError catch (error) {
      print('Error uploading file: ${error.message}');
      rethrow; // Re-throw for further handling if needed
    }
  }

  Future<Response> createVideoPost(String postContent,
      List<String> selectedPlatforms, String mediaUrl) async {
    print(
        '111111111111111111111111111111111 ${selectedPlatforms.map((platform) => {
              "platform": platform,
              "isSelected": true
            }).toList()}');

    String? token =
        getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.token);

    final dio = Dio();
    (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    final Map<String, dynamic> data = {
      'post': postContent,
      'platform': selectedPlatforms
          .map((platform) => {"platform": platform, "isSelected": true})
          .toList(),
      'mediaUrls': [mediaUrl],
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
        data: data,
      );
      print(response);
      return response;
    } on DioError catch (error) {
      print('Error uploading file: ${error.message}');
      rethrow; // Re-throw for further handling if needed
    }
  }

  Future<Response> createFaceBookVideoPost(String postContent,
      List<String> selectedPlatforms, String mediaUrl) async {
    print(selectedPlatforms
        .map((platform) => {"platform": platform, "isSelected": true})
        .toList());

    String? token =
        getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.token);

    final dio = Dio();
    (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    final Map<String, dynamic> data = {
      'post': postContent,
      'platform': [
        {"platform": "Facebook", "isSelected": true}
      ],
      'mediaUrls': [mediaUrl],
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
        data: data,
      );
      print(response);
      return response;
    } on DioError catch (error) {
      print('Error uploading file: ${error.message}');
      rethrow; // Re-throw for further handling if needed
    }
  }

  Future<Response> createInstagramVideoPost(String postContent,
      List<String> selectedPlatforms, String mediaUrl) async {
    print(selectedPlatforms
        .map((platform) => {"platform": platform, "isSelected": true})
        .toList());

    String? token =
        getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.token);

    final dio = Dio();
    (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    final Map<String, dynamic> data = {
      'post': postContent,
      'platform': [
        {"platform": "Instagram", "isSelected": true}
      ],
      'mediaUrls': [mediaUrl],
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
        data: data,
      );
      print(response);
      return response;
    } on DioError catch (error) {
      print('Error uploading file: ${error.message}');
      rethrow; // Re-throw for further handling if needed
    }
  }

  Future<Response> createFaceeBookReel(
      String postContent, String mediaUrl) async {
    String? token =
        getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.token);

    // If token is not null, add it to the request headers as a Bearer token

    final dio = Dio();
    (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    final Map<String, dynamic> data = {
      "post": "", // Ignored by stories
      "platforms": ["facebook"],
      "mediaUrls": [mediaUrl],
      "faceBookOptions": {"reels": true},
      "isVideo": true
    };

    if (token != null) {
      dio.options.headers = <String, dynamic>{
        'Authorization':
            'Bearer ${getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.profileKey)}',
        // 'Bearer $token',
        'Content-Type': contentType,
      };
    }

    final jsonData = jsonEncode(data);

    int? id = getIt
        .get<CashHelperSharedPreferences>()
        .getData(key: ApiKey.mySubscribeId);

    print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb $id');
    try {
      final response = await dio.post(
        //baseUrlPosting(id),
        'https://app.ayrshare.com/api/post',
        data: data,
      );
      print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr $response');
      return response;
    } on DioError catch (error) {
      print('Error uploading file: ${error.message}');
      rethrow; // Re-throw for further handling if needed
    }
  }

  Future<Response> createInstagramReel(
      String postContent, String mediaUrl) async {
    String? token =
        getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.token);

    // If token is not null, add it to the request headers as a Bearer token

    final dio = Dio();
    (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    final Map<String, dynamic> data = {
      "post": "",
      "mediaUrls": [mediaUrl],
      "instagramOptions": {
        "reels": true, // required for Reels
      },
      "isVideo": true
    };

    if (token != null) {
      dio.options.headers = <String, dynamic>{
        'Authorization':
            'Bearer ${getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.profileKey)}',
        // 'Bearer $token',
        'Content-Type': contentType,
      };
    }
    final jsonData = jsonEncode(data);

    int? id = getIt
        .get<CashHelperSharedPreferences>()
        .getData(key: ApiKey.mySubscribeId);

    print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb $id');
    try {
      final response = await dio.post(
        //baseUrlPosting(id),
        'https://app.ayrshare.com/api/post',
        data: data,
      );
      print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr $response');
      return response;
    } on DioError catch (error) {
      print('Error uploading file: ${error.message}');
      rethrow; // Re-throw for further handling if needed
    }
  }

  Future<Response> createFaceeBookImageStory(
      String postContent, String mediaUrl) async {
    String? token =
        getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.token);

    // If token is not null, add it to the request headers as a Bearer token

    final dio = Dio();
    (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    final Map<String, dynamic> data = {
      "post": "", // Ignored by stories
      "platforms": ["facebook"],
      "mediaUrls": [mediaUrl],
      "faceBookOptions": {"stories": true}
    };

    if (token != null) {
      dio.options.headers = <String, dynamic>{
        'Authorization':
            'Bearer ${getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.profileKey)}',
        // 'Bearer $token',
        'Content-Type': contentType,
      };
    }
    final jsonData = jsonEncode(data);

    int? id = getIt
        .get<CashHelperSharedPreferences>()
        .getData(key: ApiKey.mySubscribeId);

    print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb $id');
    try {
      final response = await dio.post(
        //baseUrlPosting(id),
        'https://app.ayrshare.com/api/post',
        data: data,
      );
      print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr $response');
      return response;
    } on DioError catch (error) {
      print('Error uploading file: ${error.message}');
      rethrow; // Re-throw for further handling if needed
    }
  }

  Future<Response> createFaceeBookVideoStory(
      String postContent, String mediaUrl) async {
    String? token =
        getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.token);

    // If token is not null, add it to the request headers as a Bearer token

    final dio = Dio();
    (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    final Map<String, dynamic> data = {
      "post": "", // Ignored by stories
      "platforms": ["facebook"],
      "mediaUrls": [mediaUrl],
      "faceBookOptions": {"stories": true},
      "isVideo": true
    };

    if (token != null) {
      dio.options.headers = <String, dynamic>{
        'Authorization':
            'Bearer ${getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.profileKey)}',
        // 'Bearer $token',
        'Content-Type': contentType,
      };
    }
    final jsonData = jsonEncode(data);

    int? id = getIt
        .get<CashHelperSharedPreferences>()
        .getData(key: ApiKey.mySubscribeId);

    print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb $id');
    try {
      final response = await dio.post(
        //baseUrlPosting(id),
        'https://app.ayrshare.com/api/post',
        data: data,
      );
      print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr $response');
      return response;
    } on DioError catch (error) {
      print('Error uploading file: ${error.message}');
      rethrow; // Re-throw for further handling if needed
    }
  }

  Future<Response> createInstagramImageStory(
      String postContent, String mediaUrl) async {
    String? token =
        getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.token);

    // If token is not null, add it to the request headers as a Bearer token

    final dio = Dio();
    (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    final Map<String, dynamic> data = {
      "post": "", // Ignored by stories
      "platforms": ["instagram"],
      "mediaUrls": [mediaUrl],
      "instagramOptions": {"stories": true},
    };

    if (token != null) {
      dio.options.headers = <String, dynamic>{
        'Authorization':
            'Bearer ${getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.profileKey)}',
        // 'Bearer $token',
        'Content-Type': contentType,
      };
    }
    final jsonData = jsonEncode(data);

    int? id = getIt
        .get<CashHelperSharedPreferences>()
        .getData(key: ApiKey.mySubscribeId);

    print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb $id');
    try {
      final response = await dio.post(
        //baseUrlPosting(id),
        'https://app.ayrshare.com/api/post',
        data: data,
      );
      print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr $response');
      return response;
    } on DioError catch (error) {
      print('Error uploading file: ${error.message}');
      rethrow; // Re-throw for further handling if needed
    }
  }

  Future<Response> createInstagramVideoStory(
      String postContent, String mediaUrl) async {
    String? token =
        getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.token);

    // If token is not null, add it to the request headers as a Bearer token

    final dio = Dio();
    (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    final Map<String, dynamic> data = {
      "post": "", // Ignored by stories
      "platforms": ["instagram"],
      "mediaUrls": [mediaUrl],
      "instagramOptions": {"stories": true},
      "isVideo": true
    };

    if (token != null) {
      dio.options.headers = <String, dynamic>{
        'Authorization':
            'Bearer ${getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.profileKey)}',
        // 'Bearer $token',
        'Content-Type': contentType,
      };
    }
    final jsonData = jsonEncode(data);

    int? id = getIt
        .get<CashHelperSharedPreferences>()
        .getData(key: ApiKey.mySubscribeId);

    print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb $id');
    try {
      final response = await dio.post(
        //baseUrlPosting(id),
        'https://app.ayrshare.com/api/post',
        data: data,
      );
      print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr $response');
      return response;
    } on DioError catch (error) {
      print('Error uploading file: ${error.message}');
      rethrow; // Re-throw for further handling if needed
    }
  }
}
