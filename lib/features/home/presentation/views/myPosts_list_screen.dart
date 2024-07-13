import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import 'package:post_bet/features/home/presentation/views/widgets/myPosts_schaduling_item.dart';

class MyPostsListSchaduling extends StatelessWidget {
  const MyPostsListSchaduling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.createPost,
        ),
        actions: [
          IconButton(
              onPressed: () {
                customJustGoNavigate(
                    context: context, path: AppRouter.kSchadulaPostsScreen);
              },
              icon: const Icon(Icons.calendar_month))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.basic,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 20.h),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const MyPostsSchaduling();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
