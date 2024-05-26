class AyrsharePostResponse {
  final String id;
  final String post; // The actual content of the post (in this case, "بوست")
  final List<String> mediaUrls; // List of image URLs for the post
  final List<String>
      platforms; // List of platforms the post was sent to (e.g., "twitter")
  final List<PostId>
      postIds; // Details about the posted content on each platform
  final String profileTitle; // Title associated with the posting profile
  final DateTime
      scheduleDate; // Date and time the post was scheduled (same as created in this case)
  final bool
      shortenLinks; // Whether links in the post were shortened by Ayrshare
  final String status; // Status of the post ("success" in this case)
  final String type; // Posting type ("now" for immediate posting)
  final DateTime created;
  bool? isVideo;
  // Date and time the post was created on Ayrshare

  AyrsharePostResponse({
    required this.id,
    required this.post,
    required this.mediaUrls,
    required this.platforms,
    required this.postIds,
    required this.profileTitle,
    required this.scheduleDate,
    required this.shortenLinks,
    required this.status,
    required this.type,
    required this.created,
    this.isVideo,
  });

  factory AyrsharePostResponse.fromJson(Map<String, dynamic> json) =>
      AyrsharePostResponse(
        id: json['id'],
        post: json['post'],
        mediaUrls: json['mediaUrls'].cast<String>(), // Cast to List<String>
        platforms: json['platforms'].cast<String>(), // Cast to List<String>
        postIds: (json['postIds'] as List)
            .map((postIdJson) => PostId.fromJson(postIdJson))
            .toList(),
        profileTitle: json['profileTitle'],
        scheduleDate: DateTime.parse(json['scheduleDate']),
        shortenLinks: json['shortenLinks'],
        status: json['status'],
        type: json['type'],
        created: DateTime.parse(json['created']),
        isVideo: json['isVideo'],
      );
}

class PostId {
  final String id; // Social media platform ID for the post
  final String platform; // Platform ("twitter" in this case)
  final String postUrl; // URL of the posted content on the platform
  final String
      status; // Posting status on the platform ("success" in this case)

  PostId({
    required this.id,
    required this.platform,
    required this.postUrl,
    required this.status,
  });

  factory PostId.fromJson(Map<String, dynamic> json) => PostId(
        id: json['id'],
        platform: json['platform'],
        postUrl: json['postUrl'],
        status: json['status'],
      );
}
