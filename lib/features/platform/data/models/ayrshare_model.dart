class AyrshareResponse {
  final String status;
  final String title;
  final String token;

  final String url;

  AyrshareResponse({
    required this.status,
    required this.title,
    required this.token,
    required this.url,
  });

  factory AyrshareResponse.fromJson(Map<String, dynamic> json) =>
      AyrshareResponse(
        status: json['status'],
        title: json['title'],
        token: json['token'],
        url: json['url'],
      );
}
