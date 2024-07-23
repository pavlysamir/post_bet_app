import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';

import 'package:post_bet/features/home/presentation/manager/add_post_cubit/cubit/add_post_cubit.dart';
import 'package:post_bet/features/home/presentation/views/widgets/myPosts_schaduling_item.dart';

class MyPostsListSchaduling extends StatelessWidget {
  const MyPostsListSchaduling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AddPostCubit, AddPostState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is MyPostsLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: kPrimaryKey,
                ))
              : SingleChildScrollView(
                  child: SafeArea(
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
                              itemCount:
                                  AddPostCubit.get(context).myPosts.length,
                              itemBuilder: (context, index) {
                                return MyPostsSchaduling(
                                  postModel:
                                      AddPostCubit.get(context).myPosts[index],
                                  index: index,
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
