import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/utils/app_router.dart';

import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';

import 'package:post_bet/features/home/presentation/manager/add_post_cubit/cubit/add_post_cubit.dart';
import 'package:post_bet/features/home/presentation/views/widgets/custom_description_post_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({
    super.key,
  });

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  @override
  void initState() {
    // TODO: implement initState
    AddPostCubit.get(context).clearImage();
    AddPostCubit.get(context).addPostController.clear();
    AddPostCubit.get(context).clearVideo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPostCubit, AddPostState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.createPost),
              actions: [
                IconButton(
                    onPressed: () {
                      customJustGoNavigate(
                          context: context,
                          path: AppRouter.kSchadulaPostsScreen);
                    },
                    icon: const Icon(Icons.calendar_month))
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CustomDescriptionPostField(
                            controller:
                                AddPostCubit.get(context).addPostController,
                            validationMassage: (value) {
                              if (value.isEmpty) {
                                return 'please write anything';
                              }
                            },
                            hintText:
                                AppLocalizations.of(context)!.typeAnyThing,
                            textInputType: TextInputType.text),
                      ],
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
