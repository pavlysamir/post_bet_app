import 'package:dio/dio.dart';
import 'package:post_bet/features/home/data/models/photo/photo_model.dart';
import 'package:post_bet/features/seach_photo/repository/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository {
  final Dio client;
  String baseUrlPhotos(endPoint) {
    return 'https://api.pexels.com/v1/$endPoint';
  }

  Options pexelAuth = Options(
    headers: {
      "Authorization":
          "563492ad6f917000010000019dcc48df08bc4c60b6ce013ea1a31373",
    },
  );

  SearchRepositoryImpl({
    required this.client,
  });

  @override
  Future<List<PhotoItemModel>> searchPhotoByKeyword(
    int page,
    int perPage,
    String keyword,
  ) async {
    try {
      final result = await client.get(
        baseUrlPhotos("/search"),
        options: pexelAuth,
        queryParameters: {
          "page": page,
          "per_page": perPage,
          "query": keyword,
        },
      );

      if (result.statusCode == 200) {
        final resultFromJson = PhotoModel.fromJson(result.data);
        return resultFromJson.photos;
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
