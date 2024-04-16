import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/utils/widgets/Custom_AppBar.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/features/activities/presentation/views/widgets/last_posts_list_view.dart';
import '../../../../../generated/l10n.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            CustomTitleText(text: S.of(context).lastPosts),
            const Expanded(
              child: SingleChildScrollView(
                child: LastPostsListView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
