import 'package:flutter/material.dart';
import 'package:post_bet/core/utils/styles.dart';
import '../../../../../constants.dart';

class ChatSendBubble extends StatelessWidget {
  const ChatSendBubble({
    Key? key,
    required this.message,
  }) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        padding: const EdgeInsets.only(top: 16, bottom: 16, right: 8, left: 8),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: const BoxDecoration(
          color: kPrimaryKey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        child: Text(message, style: Styles.textStyle12BlackBoldPoppings),
      ),
    );
  }
}
