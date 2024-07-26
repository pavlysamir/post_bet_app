import 'package:post_bet/features/home/data/models/photo/photo_model.dart';

abstract class SearchRepository {
  Future<List<PhotoItemModel>> searchPhotoByKeyword(
    int page,
    int perPage,
    String keyword,
  );
}
