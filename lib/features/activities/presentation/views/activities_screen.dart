import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/widgets/Custom_AppBar.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/features/activities/presentation/manager/cubit/get_posts_cubit.dart';
import 'package:post_bet/features/activities/presentation/views/widgets/last_posts_list_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetPostsCubit.get(context).getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<GetPostsCubit, GetPostsState>(
        listener: (context, state) {
          if (state is GetPostsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: state is GetPostsLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryKey,
                    ),
                  )
                : GetPostsCubit.get(context).posts.isEmpty
                    ? Center(
                        child: Text(AppLocalizations.of(context)!.noPosts),
                      )
                    : state is GetPostsSuccess
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomAppBar(
                                image: 'd',
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              CustomTitleText(
                                  text:
                                      AppLocalizations.of(context)!.lastPosts),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: LastPostsListView(
                                    post: GetPostsCubit.get(context).posts,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                              color: kPrimaryKey,
                            ),
                          ),
          );
        },
      ),
    );
  }
}
