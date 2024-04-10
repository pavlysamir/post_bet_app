import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/features/home/presentation/views/widgets/history_posts_list_view_item.dart';

class CustomHistoryPostsListView extends StatelessWidget {
  const CustomHistoryPostsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        clipBehavior: Clip.none,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 10.w,
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const HistoryPostsListViewItem();
        },
      ),
    );
  }
}
