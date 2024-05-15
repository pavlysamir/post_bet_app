class AyrshareResponse {
  final String status;
  final String title;
  final String token;

  final String url;
  //final String emailSent;
  // final String expiresIn;

  AyrshareResponse({
    required this.status,
    required this.title,
    required this.token,
    required this.url,
    //required this.emailSent,
    // required this.expiresIn,
  });

  factory AyrshareResponse.fromJson(Map<String, dynamic> json) =>
      AyrshareResponse(
        status: json['status'],
        title: json['title'],
        token: json['token'],
        url: json['url'],
        //emailSent: json['emailSent'],
        //expiresIn: json['expires_in'],
      );
}
