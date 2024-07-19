class PostHistory {
  final bool success;
  final int status;
  final Data data;

  PostHistory(
      {required this.success, required this.status, required this.data});

  factory PostHistory.fromJson(Map<String, dynamic> json) {
    return PostHistory(
      success: json['success'],
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final List<History> history;
  final String refId;
  final int count;

  Data({required this.history, required this.refId, required this.count});

  factory Data.fromJson(Map<String, dynamic> json) {
    var list = json['history'] as List;
    List<History> historyList = list.map((i) => History.fromJson(i)).toList();
    return Data(
      history: historyList,
      refId: json['refId'],
      count: json['count'],
    );
  }
}

class History {
  final String created;
  final List<dynamic> errors;
  final String id;
  final List<String> mediaUrls;
  final List<String> platforms;
  final String post;
  final List<PostId> postIds;
  final String profileTitle;
  final String refId;
  final String scheduleDate;
  final bool shortenLinks;
  final String status;
  final String type;

  final bool isVideo;

  History({
    required this.created,
    required this.errors,
    required this.id,
    required this.mediaUrls,
    required this.platforms,
    required this.post,
    required this.postIds,
    required this.profileTitle,
    required this.refId,
    required this.scheduleDate,
    required this.shortenLinks,
    required this.status,
    required this.type,
    this.isVideo = false,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    var listPostIds = json['postIds'] as List;
    List<PostId> postIdList =
        listPostIds.map((i) => PostId.fromJson(i)).toList();
    return History(
      created: json['created'],
      errors: json['errors'],
      id: json['id'],
      mediaUrls: List<String>.from(json['mediaUrls']),
      platforms: List<String>.from(json['platforms']),
      post: json['post'],
      postIds: postIdList,
      profileTitle: json['profileTitle'],
      refId: json['refId'] ?? '',
      scheduleDate: json['scheduleDate'],
      shortenLinks: json['shortenLinks'],
      status: json['status'],
      type: json['type'],
      isVideo: json['isVideo'] ?? false,
    );
  }
}

class PostId {
  final String postUrl;
  final String id;
  final String platform;
  final String status;

  PostId(
      {required this.postUrl,
      required this.id,
      required this.platform,
      required this.status});

  factory PostId.fromJson(Map<String, dynamic> json) {
    return PostId(
      postUrl: json['postUrl'],
      id: json['id'],
      platform: json['platform'],
      status: json['status'],
    );
  }
}
