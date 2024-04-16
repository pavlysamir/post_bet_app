import 'package:flutter/material.dart';
import 'package:post_bet/constants.dart';

class CustomAppbareWithTitle extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppbareWithTitle({required this.title, super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_back_ios,
          color: kPrimaryKey,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
