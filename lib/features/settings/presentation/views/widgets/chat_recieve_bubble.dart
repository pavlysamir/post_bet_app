import 'package:flutter/material.dart';
import 'package:post_bet/core/utils/styles.dart';

class ChatReceiveBubble extends StatelessWidget {
  const ChatReceiveBubble({
    Key? key,
    required this.message,
  }) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
          padding:
              const EdgeInsets.only(top: 16, bottom: 16, right: 8, left: 8),
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: const BoxDecoration(
            color: Color(0xffe0e0e0),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Text(
              //'${messageModel.text}'
              message,
              style: Styles.textStyle12BlackBoldPoppings)),
    );
  }
}
