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

  String? id = getIt
      .get<CashHelperSharedPreferences>()
      .getData(key: ApiKey.mySubscribeId);

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
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
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

  Future<Response> createPost(String postContent,
      List<String> selectedPlatforms, List<String> mediaUrl) async {
    print(selectedPlatforms
        .map((platform) => {"platform": platform, "isSelected": true})
        .toList());

    String? token =
        getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.token);

    // If token is not null, add it to the request headers as a Bearer token

    final dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
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
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
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
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
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
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
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
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
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
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
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
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
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
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
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
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
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
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
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
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
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
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
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
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
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
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
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

  Future<Response> createYouTubeVideoPost(
      String postContent, String mediaUrl) async {
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
      "post": postContent,
      "platform": [
        {"platform": "Youtube", "isSelected": true}
      ],
      "mediaUrls": [mediaUrl],
      "youTubeOptions": {
        "title": postContent, //required
        "visibility": "public", //optional
        // "thumbNail": "string", //optional
        // "playListId": "string", //optional
        //"tags": [""],
        "madeForKids": false,
        "shorts": false, //optional
        "notifySubscribers": true,
        // "categoryId": 0, //optional
        // "publishAt": "" //optional
      },
      "isVideo": true
    };

    if (token != null) {
      dio.options.headers = <String, dynamic>{
        'Authorization': 'Bearer $token',
        'Content-Type': contentType,
      };
    }

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
}
