import 'package:flutter/material.dart';
import 'package:post_bet/constants.dart';

class CustomLineSeperator extends StatelessWidget {
  const CustomLineSeperator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: kBlackColor.withOpacity(0.2),
    );
  }
}
