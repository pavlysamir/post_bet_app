import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/assets/Assets.dart';
import 'package:post_bet/core/utils/widgets/Custom_AppBar_with_title.dart';
import 'package:post_bet/core/utils/widgets/custom_button_large.dart';
import 'package:post_bet/core/utils/widgets/custom_line_seperator.dart';
import 'package:post_bet/features/home/presentation/manager/add_post_cubit/cubit/add_post_cubit.dart';
import 'package:post_bet/features/home/presentation/views/widgets/custom_description_post_field.dart';
import 'package:post_bet/generated/l10n.dart';

class CreatePostView extends StatelessWidget {
  const CreatePostView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> platformNames = [
      'instagram',
      'facebook',
      'x',
    ];
    final List<String> platformIcons = [
      AssetsData.instagramIcon,
      AssetsData.faceBookIcon,
      AssetsData.xIcon,
    ];
    return BlocProvider(
      create: (context) => AddPostCubit(),
      child: BlocConsumer<AddPostCubit, AddPostState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
              appBar: CustomAppbareWithTitle(title: S.of(context).createPost),
              bottomNavigationBar: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: CustomButtonLarge(
                    text: S.of(context).share,
                    color: kPrimaryKey,
                    textColor: Colors.white,
                    function: () {}),
              ),
              body: Column(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.image,
                                size: 25.h,
                              ),
                              onPressed: () {},
                            ),
                            SizedBox(width: 10.w),
                            IconButton(
                              icon: Icon(
                                Icons.videocam_rounded,
                                size: 25.h,
                              ),
                              onPressed: () {},
                            ),
                            SizedBox(width: 10.w),
                            IconButton(
                              icon: Icon(
                                Icons.discount,
                                size: 25.h,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const CustomLineSeperator();
                          },
                          itemCount: platformNames.length,
                          itemBuilder: (context, index) {
                            return CreatePostPlatFormItem(
                              paltformIcon: platformIcons[index],
                              paltformName: platformNames[index],
                            );
                          }),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}

class CreatePostPlatFormItem extends StatelessWidget {
  const CreatePostPlatFormItem({
    super.key,
    required this.paltformName,
    required this.paltformIcon,
  });

  final String paltformName;
  final String paltformIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (kDebugMode) {
          print('tapped');
        }
      },
      title: Text(
        paltformName,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      leading: Image.asset(paltformIcon),
    );
  }
}
