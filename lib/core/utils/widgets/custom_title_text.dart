import 'package:flutter/material.dart';
import 'package:post_bet/core/utils/styles.dart';

class CustomTitleText extends StatelessWidget {
  const CustomTitleText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        style: Styles.textStyle24BoldBlack,
      ),
    );
  }
}
