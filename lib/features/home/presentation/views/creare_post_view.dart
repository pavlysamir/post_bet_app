import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:post_bet/core/utils/widgets/Custom_AppBar_with_title.dart';
import 'package:post_bet/core/utils/widgets/custom_button_large.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import 'package:post_bet/core/utils/widgets/custom_line_seperator.dart';
import 'package:post_bet/features/home/presentation/manager/add_post_cubit/cubit/add_post_cubit.dart';
import 'package:post_bet/features/home/presentation/views/widgets/custom_description_post_field.dart';
import 'package:post_bet/features/home/presentation/views/widgets/select_post_platform_widget.dart';
import 'package:post_bet/generated/l10n.dart';

class CreatePostView extends StatelessWidget {
  const CreatePostView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String title = S.of(context).share;

    final addPostCubit = AddPostCubit.get(context);
    var myyPlatForms =
        getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.platForms);
    var platformIconss = getIt
        .get<CashHelperSharedPreferences>()
        .getData(key: ApiKey.platFormsIcons);
    return BlocConsumer<AddPostCubit, AddPostState>(
      listener: (context, state) {
        if (state is CreatePostSuccessfully) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('success Share Post'),
          ));
        }
        if (state is CreateFaceBookReelSuccessfully) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('success Share Facebook Reel'),
          ));
        }
        if (state is CreateFaceBookStorySuccessfully) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('success Share Facebook Story'),
          ));
        }
        if (state is CreateVideoPostSuccessfully) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('success Share Video Post'),
          ));
        }
        if (state is CreateFaceBookVideoPostSuccessfully) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('success Share Video Facebook Post'),
          ));
        }
        if (state is CreateFacePostSuccessfully) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('success Share Facebook Post'),
          ));
        }
        if (state is CreateInstagramReelSuccessfully) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('success Share Instagram Reel'),
          ));
        }
        if (state is CreateInstagramStorySuccessfully) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('success Share Instagram Story'),
          ));
        } else if (state is CreatePostFailure ||
            state is UploadImgFailure ||
            state is UploadVideoFailure ||
            state is UploadFaceBookImageStoryFailure ||
            state is UploadFaceBookReelFailure ||
            state is CreateFaceBookStoryFailure ||
            state is CreateVideoPostFailure ||
            state is CreateFacePostFailure ||
            state is CreateFaceBookVideoPostFailure ||
            state is UploadInstagramImageStoryFailure ||
            state is CreateInstagramReelFailure ||
            state is CreateInstagramStoryFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Failure')));
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: CustomAppbareWithTitle(title: S.of(context).createPost),
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
                            hintText: S.of(context).typeAnyThing,
                            textInputType: TextInputType.text),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: CustomButtonLarge(
                        text: title,
                        color: kPrimaryKey,
                        textColor: Colors.white,
                        function: () async {
                          if (AddPostCubit.get(context)
                                      .addPostController
                                      .text
                                      .isEmpty &&
                                  AddPostCubit.get(context).fileVideo == null &&
                                  AddPostCubit.get(context)
                                      .postImages
                                      .isEmpty ||
                              AddPostCubit.get(context)
                                  .checkBoxValues
                                  .isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(S.of(context).pleaseWrite)));
                          }

                          title = S.of(context).loading;
                          // Future.delayed(const Duration(seconds: 17))
                          //     .then((value) {
                          //   customGoAndDeleteNavigate(
                          //       context: context, path: AppRouter.kHomeLayOut);
                          // });

                          await AddPostCubit.get(context)
                              .handleAction()
                              .then((value) {
                            Future.delayed(const Duration(seconds: 18))
                                .then((value) {
                              customGoAndDeleteNavigate(
                                  context: context,
                                  path: AppRouter.kHomeLayOut);
                            });
                          });

                          print(AddPostCubit.get(context).checkBoxValues);
                          print(AddPostCubit.get(context).selectedItems);
                        }),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return const CustomLineSeperator();
                        },
                        itemCount: getIt
                            .get<CashHelperSharedPreferences>()
                            .getData(key: ApiKey.platForms)
                            .length,
                        itemBuilder: (context, index) {
                          return CreatePostPlatFormItem(
                            indrx: index,
                            paltformIcon: getIt
                                .get<CashHelperSharedPreferences>()
                                .getData(key: ApiKey.platFormsIcons)[index],
                            paltformName: getIt
                                .get<CashHelperSharedPreferences>()
                                .getData(key: ApiKey.platForms)[index],
                            platformDescription: getIt
                                        .get<CashHelperSharedPreferences>()
                                        .getData(key: ApiKey.platFormsIcons)
                                        .length ==
                                    5
                                ? AddPostCubit.get(context)
                                    .descriptionPlatformsmall[index]
                                : AddPostCubit.get(context)
                                    .descriptionPlatform[index],
                          );
                        }),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
