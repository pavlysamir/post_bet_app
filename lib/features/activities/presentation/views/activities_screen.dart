import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/utils/widgets/Custom_AppBar.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/features/activities/presentation/views/widgets/last_posts_listview_item.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(
            name: 'Bavly sa',
            image: 'd',
          ),
          SizedBox(
            height: 40.h,
          ),
          const CustomTitleText(text: 'Your latest posts'),
          Expanded(
            child: ListView.builder(
                clipBehavior: Clip.none,
                //physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const LastPostsListViewItem();
                }),
          ),
        ],
      ),
    );
  }
}
