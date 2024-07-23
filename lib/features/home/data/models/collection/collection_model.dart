import 'package:flutter/foundation.dart';

@immutable
class CollectionItemModel {
  final String id;
  final String title;

  const CollectionItemModel({
    required this.id,
    required this.title,
  });

  factory CollectionItemModel.fromJson(Map<String, dynamic> json) {
    return CollectionItemModel(
      id: json['id'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}

@immutable
class CollectionModel {
  final List<CollectionItemModel> collections;

  const CollectionModel({this.collections = const []});

  factory CollectionModel.fromJson(Map<String, dynamic> json) {
    var collectionsJson = json['collections'] as List<dynamic>? ?? [];
    var collections = collectionsJson
        .map((e) => CollectionItemModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return CollectionModel(collections: collections);
  }

  Map<String, dynamic> toJson() {
    return {
      'collections': collections.map((e) => e.toJson()).toList(),
    };
  }
}
