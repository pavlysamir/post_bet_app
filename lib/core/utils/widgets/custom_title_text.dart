import 'package:flutter/material.dart';

class CustomTitleText extends StatelessWidget {
  const CustomTitleText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        style: Theme.of(context).textTheme.displaySmall,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
