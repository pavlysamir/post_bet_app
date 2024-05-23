class MessageModel {
  final int id;
  final String createdAt;
  final String updatedAt;
  final String message;
  final String email;
  final String phone;
  final String? replyMessage;
  final bool flagReply;

  MessageModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.message,
    required this.email,
    required this.phone,
    this.replyMessage,
    required this.flagReply,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      message: json['message'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      replyMessage: json['replyMessage'],
      flagReply: json['flagReply'] as bool,
    );
  }
}
