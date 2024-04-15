import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/utils/widgets/custom_line_seperator.dart';
import 'package:post_bet/features/activities/presentation/views/widgets/last_posts_body.dart';

class LastPostsListViewItem extends StatelessWidget {
  const LastPostsListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.h,
        ),
        Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            child: const LastPostsContainer()),
        SizedBox(
          height: 40.h,
        ),
        const CustomLineSeperator(),
      ],
    );
  }
}
