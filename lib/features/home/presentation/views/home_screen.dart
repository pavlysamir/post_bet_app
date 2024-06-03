import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/widgets/Custom_AppBar.dart';
import 'package:post_bet/core/utils/widgets/custom_line_seperator.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/features/home/data/post_repo.dart';
import 'package:post_bet/features/home/presentation/manager/add_post_cubit/cubit/add_post_cubit.dart';
import 'package:post_bet/features/home/presentation/views/widgets/add_post_container.dart';
import 'package:post_bet/features/home/presentation/views/widgets/custom_teplate_list_view.dart';
import 'package:post_bet/features/home/presentation/views/widgets/custom_whatCanPost_container.dart';
import 'package:post_bet/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
//  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostCubit(getIt.get<PostReposatory>()),
      child: BlocConsumer<AddPostCubit, AddPostState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
              body: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                SliverToBoxAdapter(
                  child: SafeArea(
                    child: Form(
                      // key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomAppBar(
                            image: 'd',
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          CustomTitleText(text: S.of(context).createPost),
                          SizedBox(
                            height: 15.h,
                          ),
                          const AddPostContainer(),
                          SizedBox(
                            height: 25.h,
                          ),
                          SizedBox(
                            height: 34.h,
                          ),
                          const CustomLineSeperator(),
                          SizedBox(
                            height: 34.h,
                          ),
                          CustomTitleText(text: S.of(context).template),
                          SizedBox(
                            height: 30.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: CustomTemplatePostsListView(),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomLineSeperator(),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTitleText(text: S.of(context).whatUCanPost),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                S.of(context).seeAll,
                                style: const TextStyle(color: kPrimaryKey),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      const CustomWhatCanPostContainer(),
                      SizedBox(
                        height: 30.h,
                      ),
                    ],
                  ),
                ),
              ]));
        },
      ),
    );
  }
}
