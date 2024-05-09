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
    final List<String> platformNames = [
      'Instagram',
      'Facebook Groub',
      'Facebook Groub',
      'X',
      'Linkedin',
      'Reddit',
      'Youtube',
      'Tiktok',
      'Pinterest',
      'Telegram',
      'Google Business'
    ];
    final List<String> platformIcons = [
      AssetsData.instagramIcon,
      AssetsData.faceBookIcon,
      AssetsData.faceBookIcon,
      AssetsData.xIcon,
      AssetsData.linkedln,
      AssetsData.reddit,
      AssetsData.youtube,
      AssetsData.tiktok,
      AssetsData.pinterest,
      AssetsData.telegram,
      AssetsData.googleBusiness
    ];
    return BlocProvider(
      create: (context) => AddPostCubit(),
      child: BlocConsumer<AddPostCubit, AddPostState>(
        listener: (context, state) {},
        builder: (context, state) {
          AddPostCubit.get(context).addPostController.text = text;
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
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryKey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Image.asset(
                        img,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
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
                  ],
                ),
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
      leading: Image.asset(
        paltformIcon,
        height: 40.h,
        width: 40.w,
      ),
    );
  }
}
