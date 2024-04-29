import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/utils/widgets/Custom_AppBar.dart';
import 'package:post_bet/core/utils/widgets/custom_line_seperator.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/features/home/presentation/manager/add_post_cubit/cubit/add_post_cubit.dart';
import 'package:post_bet/features/home/presentation/views/widgets/add_post_container.dart';
import 'package:post_bet/features/home/presentation/views/widgets/custom_history_posts_list_view.dart';
import 'package:post_bet/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
//  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostCubit(),
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
                          const CustomAppBar(
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
                          // Padding(
                          //     padding:
                          //         const EdgeInsets.symmetric(horizontal: 44),
                          //     child: CustomButtonLarge(
                          //         text: S.of(context).share,
                          //         color: kPrimaryKey,
                          //         textColor: Colors.white,
                          //         function: () {})),
                          SizedBox(
                            height: 34.h,
                          ),
                          const CustomLineSeperator(),
                          SizedBox(
                            height: 34.h,
                          ),
                          CustomTitleText(text: S.of(context).history),
                          SizedBox(
                            height: 30.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: CustomHistoryPostsListView(),
                )
              ]));
        },
      ),
    );
  }
}
