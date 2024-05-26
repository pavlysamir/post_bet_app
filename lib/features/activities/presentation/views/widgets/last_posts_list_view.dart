import 'package:flutter/material.dart';
import 'package:post_bet/features/activities/data/models/ayrshare_post_model.dart';
import 'package:post_bet/features/activities/presentation/views/widgets/last_posts_listview_item.dart';

class LastPostsListView extends StatelessWidget {
  const LastPostsListView({Key? key, required this.post}) : super(key: key);
  final List<AyrsharePostResponse> post;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        post.length,
        (index) => LastPostsListViewItem(
          post: post[index],
        ),
      ),
    );
  }
}
