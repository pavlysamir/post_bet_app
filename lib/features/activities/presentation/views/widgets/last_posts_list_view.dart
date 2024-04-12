import 'package:flutter/material.dart';
import 'package:post_bet/features/activities/presentation/views/widgets/last_posts_listview_item.dart';

class LastPostsListView extends StatelessWidget {
  const LastPostsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        10,
        (index) => const LastPostsListViewItem(),
      ),
    );
  }
}
