import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/widgets/Custom_AppBar_with_title.dart';
import 'package:post_bet/core/utils/widgets/custom_button_large.dart';
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
    return BlocConsumer<AddPostCubit, AddPostState>(
      listener: (context, state) {
        if (state is CreatePostSuccessfully ||
            state is CreateFaceBookReelSuccessfully ||
            state is CreateFaceBookStorySuccessfully ||
            state is CreateVideoPostSuccessfully) {
          //AddPostCubit.get(context).clearpostContant();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('success'),
          ));
        } else if (state is CreatePostFailure || state is UploadImgFailure) {
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //   content: state is CreatePostFailure
          //       ? Text(state.errMessage)
          //       : const Text('Failure'),
          // ));
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: CustomAppbareWithTitle(title: S.of(context).createPost),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: CustomButtonLarge(
                  text: state is UploadImageLoading ||
                          state is CreatePostLoading ||
                          state is UploadVideoLoading ||
                          state is UploadFaceBookImageStoryLoading ||
                          state is UploadFaceBookReelLoading ||
                          state is CreateFaceBookStoryLoading
                      ? 'loading..'
                      : S.of(context).share,
                  color: kPrimaryKey,
                  textColor: Colors.white,
                  function: () async {
                    // AddPostCubit.get(context).addPostController.text != null
                    //     ?
                    //AddPostCubit.get(context).createPost();

                    if (AddPostCubit.get(context).imageFile != null &&
                        AddPostCubit.get(context)
                            .selectedaceInstaItems
                            .contains('Story FaceBook')) {
                      await AddPostCubit.get(context).uploadImageStory();
                    }
                    if (AddPostCubit.get(context).imageFile != null &&
                        AddPostCubit.get(context)
                            .selectedInstaItems
                            .contains('Story Instagram')) {
                      await AddPostCubit.get(context)
                          .uploadInstagramImageStory();
                    }
                    if (AddPostCubit.get(context).imageFile != null &&
                        AddPostCubit.get(context)
                            .selectedaceInstaItems
                            .contains('Post FaceBook')) {
                      await AddPostCubit.get(context).uploadFaceBokImage();
                    }
                    if (AddPostCubit.get(context).imageFile != null &&
                        AddPostCubit.get(context)
                            .selectedInstaItems
                            .contains('Post Instagram')) {
                      await AddPostCubit.get(context).uploadInstagramImage();
                    }
                    if (AddPostCubit.get(context).postImages.isNotEmpty &&
                        AddPostCubit.get(context).platformNames.isNotEmpty) {
                      await AddPostCubit.get(context).uploadImage();
                    }
                    if (AddPostCubit.get(context).fileVideo != null &&
                        AddPostCubit.get(context)
                            .selectedaceInstaItems
                            .contains('Reel FaceBook')) {
                      await AddPostCubit.get(context).uploadReelVideo();
                    }
                    if (AddPostCubit.get(context).fileVideo != null &&
                        AddPostCubit.get(context)
                            .selectedInstaItems
                            .contains('Reel Instagram')) {
                      await AddPostCubit.get(context)
                          .uploadInstagramReelVideo();
                    }

                    if (AddPostCubit.get(context).fileVideo != null &&
                        AddPostCubit.get(context)
                            .selectedInstaItems
                            .contains('Story Instagram')) {
                      await AddPostCubit.get(context)
                          .uploadVideoStoryInstagramVideo();
                    }
                    if (AddPostCubit.get(context).fileVideo != null &&
                        AddPostCubit.get(context)
                            .selectedaceInstaItems
                            .contains('Story FaceBook')) {
                      await AddPostCubit.get(context)
                          .uploadVideoStoryFsaceBookVideo();
                    }

                    if (AddPostCubit.get(context).fileVideo != null &&
                        AddPostCubit.get(context)
                            .selectedaceInstaItems
                            .contains('Post FaceBook')) {
                      await AddPostCubit.get(context).uploadFaceBookVideo();
                    }
                    if (AddPostCubit.get(context).fileVideo != null &&
                        AddPostCubit.get(context)
                            .selectedInstaItems
                            .contains('Post Instagram')) {
                      await AddPostCubit.get(context).uploadInstagramVideo();
                    }
                    if (AddPostCubit.get(context).fileVideo != null &&
                        AddPostCubit.get(context).platformNames.isNotEmpty &&
                        AddPostCubit.get(context).selectedaceInstaItems == [] &&
                        AddPostCubit.get(context).selectedInstaItems == []) {
                      await AddPostCubit.get(context).uploadVideo();
                      //  AddPostCubit.get(context).fileVideo!.path);
                    }
                    if (AddPostCubit.get(context).addPostController.text !=
                            null &&
                        AddPostCubit.get(context).fileVideo == null &&
                        AddPostCubit.get(context).postImages.isEmpty) {
                      await AddPostCubit.get(context).createTextPost();
                    }
                    if (AddPostCubit.get(context)
                            .selectedaceInstaItems
                            .contains('Post FaceBook') &&
                        AddPostCubit.get(context).addPostController.text !=
                            null &&
                        AddPostCubit.get(context).fileVideo == null &&
                        AddPostCubit.get(context).postImages.isEmpty) {
                      await AddPostCubit.get(context).createFaceBookTextPost();
                    }
                    if (AddPostCubit.get(context)
                            .selectedInstaItems
                            .contains('Post Instagram') &&
                        AddPostCubit.get(context).postImages.isEmpty &&
                        AddPostCubit.get(context).fileVideo == null &&
                        AddPostCubit.get(context).addPostController.text !=
                            null) {
                      await AddPostCubit.get(context).createInstagramTextPost();
                    }
                    print(AddPostCubit.get(context).checkBoxValues);
                    print(AddPostCubit.get(context).selectedItems);
                  }),
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
                            hintText: S.of(context).typeAnyThing,
                            textInputType: TextInputType.text),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return const CustomLineSeperator();
                        },
                        itemCount:
                            AddPostCubit.get(context).platformNames.length,
                        itemBuilder: (context, index) {
                          return CreatePostPlatFormItem(
                            indrx: index,
                            paltformIcon:
                                AddPostCubit.get(context).platformIcons[index],
                            paltformName:
                                AddPostCubit.get(context).platformNames[index],
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
