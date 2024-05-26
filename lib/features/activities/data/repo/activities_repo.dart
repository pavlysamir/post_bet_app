import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';

import 'package:post_bet/features/activities/data/models/ayrshare_post_model.dart';

class ActivitiesRepo {
  ActivitiesRepo();

  String baseUrlGtPosts = 'https://app.ayrshare.com/api/history';
  String authorizationHeader = 'Bearer TH8S6RT-67ZMT2F-HTB3ZSH-PFEAPER';
  static const String privateKey =
      "-----BEGIN RSA PRIVATE KEY-----\nMIIEpAIBAAKCAQEAwIXFODkBUC09mGBjgVjnmqNhTt1ZokH7FeHfuuxZlNLuDUdj\n30rWSGn8HgF4QQDADS2sAjJNPnGfSVTESElow98BwLPsKHoATdockWv0Bk6GCTS4\nsM+W9VNOvy14RUM9+WaFRbmHczXSuENxwoUMKZHD3NOUTC0rmwP+5V34tgL1P311\njkEjJv31ljAZG2a/dNxJHScGVZp5mfedpk/lVYrOIFnd/Jh3RCzXHtOePvcbEC1n\n2uSSXbguPRqWd/a2uIpc0B8hUBSXgiXw/OGtO6PBIwF+9w4SzUvEQ3S195tKma4Y\nanf99XI/qVTLIi0Of9aiWAPXgyWoqwUdtPz9xQIDAQABAoIBADxKSBJMy8v7dvQe\nj1rE6DbFnmYPrI/DIOnf4+wKMx2HlrQC3NRi/8sKocEVzb5xiTM3T8waS5VYCL1y\ntcs7bfsU/dwGnFiqqCi5OsQRrghBk/kTERmR0OD/10PIbgcmwSQ2xlqo+LGMM/Kv\ncFMtzjrAYrlnauQWKzcu36adsJLyvBmO60VWpu0aWXttKoEgLv5gwtiqECpdhh3T\nuWFB5SALVnBQaQ4k1XQR4+gdTPBpa5sXqbgeN1+qmRj4Bd/ilXjDchQSmFHPsFhW\nevTs81kMOf7byGBrHohhWOAEfOWgwZKpfuYD9L45SCae7oIosCaZ7kzhalllRUTA\nLZRNLJsCgYEA4+CVusG+MLKgmzfNk3JhGKrUqm6zkUgJ6hzQ0teLbUe9ZJ2gS2Bq\nCY2ehqJ8Ijx5F78vGt/7WBudYZbhSzBEr5wW+NDXNtc5dMIdBitGzasNB/Zn+06o\n2NLWida8q3ShKdFiPFJdkvf78CCGrX74WKUzak1FCQn42mMOw3zE6hMCgYEA2Eg1\nnDK6A6owzYVJscgY8+l/S0pu7nVhGvNlaBlMqZMR3fFUUHzDEWESGOdZb5PF3coo\nW4O1cz0Y0BW93uSGfAvBiGnSOs8SoOArNAh+7EmtC0x45KSdsdR9dSIHffvRh9CI\nwskHetxB4tdrGw+EYyN88ffZ/Vt8kMlU+oK588cCgYAh+0K4x92By5FxtB+e5kae\ndBMkmz+B4blAxS1K08PB9xnCIFNgCi+l3w2NzDswq83vAZ6XpmEH4Y5VmDdejAMi\nIOe4EQSW8/9obu3/FoMHdoOJ9W/KJQ++zaoaggA+nTTPVJ8OmcXEfeB/DYqn4rBM\nH86MApvR3j/S6USxWDDRKwKBgQCwHoUBT9FnoJQjF7G+AnpHTNGqhs80gQL1BlSC\nY2+o+qjm+Vi2PhI+ubQZ8XJDyKqsg60/cE42q/7jm4DE24SjyJLtOXbHCs5ZkJG9\nyllIomo2NCyRy3baU3ViB7bgIUordWWYcEkWA/vm85I1M/qTHFfnVfP+OxyBbmEz\nqXYxCwKBgQDLrcBxEwdDTBxVnK7RdAEPen3M49RZ76jkAIvMeyujG4X+dkR68VPH\nduZvrg6zy/yZnu1SwirUpBwTGh5GZj9/aSeWavOzDu97OUrGMoD4V1F3xqMogTIn\nEtnExOIJtmqwevUdZGmP7cGmIbhhcYy9I12NrsM2OVuF3mUIUbXgSQ==\n-----END RSA PRIVATE KEY-----";

  String contentType = 'application/json';

  Future<Either<String, List<AyrsharePostResponse>>> getPosts() async {
    final dio = Dio();
    dio.options.headers = <String, dynamic>{
      'Authorization': 'Bearer TH8S6RT-67ZMT2F-HTB3ZSH-PFEAPER',
      'Profile-Key': getIt
          .get<CashHelperSharedPreferences>()
          .getData(key: ApiKey.profileKey),
    };

    try {
      final response = await dio.get(baseUrlGtPosts, queryParameters: {
        'lastDays': 0,
        'status': 'success',
      });
      List<AyrsharePostResponse> posts = [];
      for (var post in response.data) {
        posts.add(AyrsharePostResponse.fromJson(post));
      }
      print(response.data);
      return Right(posts);
    } on DioError catch (error) {
      print('Error uploading file: ${error.message}');
      rethrow; // Re-throw for further handling if needed
    }
  }
}
