import 'package:flutter/foundation.dart';

@immutable
class PhotoSrcModel {
  final String original;
  final String large;
  final String portrait;

  const PhotoSrcModel({
    required this.original,
    required this.large,
    required this.portrait,
  });

  factory PhotoSrcModel.fromJson(Map<String, dynamic> json) {
    return PhotoSrcModel(
      original: json['original'] as String,
      large: json['large'] as String,
      portrait: json['portrait'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'original': original,
      'large': large,
      'portrait': portrait,
    };
  }
}

@immutable
class PhotoItemModel {
  final int id;
  final String url;
  final String photographer;
  final String avgColor;
  final PhotoSrcModel src;
  final String? alt;

  const PhotoItemModel({
    required this.id,
    required this.url,
    required this.photographer,
    required this.avgColor,
    required this.src,
    this.alt,
  });

  factory PhotoItemModel.fromJson(Map<String, dynamic> json) {
    return PhotoItemModel(
      id: json['id'] as int,
      url: json['url'] as String,
      photographer: json['photographer'] as String,
      avgColor: json['avg_color'] as String,
      src: PhotoSrcModel.fromJson(json['src'] as Map<String, dynamic>),
      alt: json['alt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'photographer': photographer,
      'avg_color': avgColor,
      'src': src.toJson(),
      'alt': alt,
    };
  }
}

@immutable
class PhotoModel {
  final List<PhotoItemModel> photos;
  final int? page;
  final int? perPage;
  final int? totalResult;

  const PhotoModel({
    this.photos = const [],
    this.page,
    this.perPage,
    this.totalResult,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    var photosJson = json['photos'] as List<dynamic>? ?? [];
    var photos = photosJson
        .map((e) => PhotoItemModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return PhotoModel(
      photos: photos,
      page: json['page'] as int?,
      perPage: json['per_page'] as int?,
      totalResult: json['total_results'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'photos': photos.map((e) => e.toJson()).toList(),
      'page': page,
      'per_page': perPage,
      'total_results': totalResult,
    };
  }
}
