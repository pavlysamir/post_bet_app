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

import 'package:post_bet/features/home/presentation/manager/add_post_templete/add_post_templete_cubit.dart';
import 'package:post_bet/features/home/presentation/views/widgets/custom_description_post_field.dart';
import 'package:post_bet/features/home/presentation/views/widgets/select_temlete_post_plateform_widget.dart';
import 'package:post_bet/generated/l10n.dart';

class CreateTemplatePostView extends StatelessWidget {
  const CreateTemplatePostView({
    super.key,
    required this.img,
    required this.text,
  });

  final String img;
  final String text;

  @override
  Widget build(BuildContext context) {
    String title = S.of(context).share;

    return BlocConsumer<AddPostTempleteCubit, AddPostTempleteState>(
      listener: (context, state) {
        if (state is CreatePostSuccessfully) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('success Share Post'),
          ));
        }
        if (state is CreateFaceBookStorySuccessfully) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('success Share Facebook Story'),
          ));
        }
        if (state is CreateFacePostSuccessfully) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('success Share Facebook Post'),
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
        AddPostTempleteCubit.get(context).addPostTempleteController.text = text;
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
                            img: img,
                            controller: AddPostTempleteCubit.get(context)
                                .addPostTempleteController,
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
                  SizedBox(
                    height: 12.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: CustomButtonLarge(
                        text: title,
                        color: kPrimaryKey,
                        textColor: Colors.white,
                        function: () async {
                          if (AddPostTempleteCubit.get(context)
                              .checkBoxValues
                              .isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(S.of(context).pleaseWrite)));
                          }

                          title = S.of(context).loading;

                          if (AddPostTempleteCubit.get(context)
                              .selectedaceInstaItems
                              .contains('Post .')) {
                            await AddPostTempleteCubit.get(context)
                                .uploadFaceBokImage(image: img);
                          }
                          if (AddPostTempleteCubit.get(context)
                              .selectedInstaItems
                              .contains('Post')) {
                            await AddPostTempleteCubit.get(context)
                                .uploadInstagramImage(image: img);
                          }
                          if (AddPostTempleteCubit.get(context)
                              .platformNames
                              .isNotEmpty) {
                            await AddPostTempleteCubit.get(context)
                                .uploadImage(image: img);
                          }
                          Future.delayed(const Duration(seconds: 18))
                              .then((value) {
                            customGoAndDeleteNavigate(
                                context: context, path: AppRouter.kHomeLayOut);
                          });
                          print(
                              AddPostTempleteCubit.get(context).checkBoxValues);
                          print(
                              AddPostTempleteCubit.get(context).selectedItems);
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
                          return CreateTempletePostPlatFormItem(
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
                                ? AddPostTempleteCubit.get(context)
                                    .descriptionPlatformsmall[index]
                                : AddPostTempleteCubit.get(context)
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
