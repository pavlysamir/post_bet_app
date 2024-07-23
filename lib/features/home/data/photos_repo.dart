import 'package:dio/dio.dart';
import 'package:post_bet/features/home/data/models/collection/collection_model.dart';
import 'package:post_bet/features/home/data/models/photo/photo_model.dart';

class PhotoRepositiry {
  PhotoRepositiry({required this.client});
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

  Future<List<CollectionItemModel>> getCollections(int perPage) async {
    try {
      final result = await client.get(baseUrlPhotos("/collections/featured"),
          options: pexelAuth,
          queryParameters: {
            "per_page": perPage,
          });

      if (result.statusCode == 200) {
        final resultFromJson = CollectionModel.fromJson(result.data);
        return resultFromJson.collections;
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PhotoItemModel>> getPhotos(int page, int perPage) async {
    try {
      final result = await client.get(
        baseUrlPhotos("/curated"),
        options: pexelAuth,
        queryParameters: {
          "page": page,
          "per_page": perPage,
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
