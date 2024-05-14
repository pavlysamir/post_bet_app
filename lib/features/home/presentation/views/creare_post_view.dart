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
  const CreatePostView({
    super.key,
  });

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

class CreatePostPlatFormItem extends StatefulWidget {
  const CreatePostPlatFormItem({
    super.key,
    required this.paltformName,
    required this.paltformIcon,
  });

  final String paltformName;
  final String paltformIcon;

  @override
  State<CreatePostPlatFormItem> createState() => _CreatePostPlatFormItemState();
}

class _CreatePostPlatFormItemState extends State<CreatePostPlatFormItem> {
  String dropdownValue = 'Post';
  bool initialValue = false;
  bool initialValue2 = false;
  final Map<String, bool> _checkBoxValues = {};
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.paltformName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          widget.paltformName == 'Instagram'
              ?
// Step 2.
              SizedBox(
                  width: 120.w,
                  child: DropdownButton<String>(
                    // Step 3. Set the initial dropdown value.
                    value: dropdownValue,

                    // Step 4. Define dropdown items with associated checkboxes.
                    items: <String>[
                      'Post',
                      'Story',
                      'Reel',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              value,
                              style: const TextStyle(fontSize: 15),
                            ),
                            StatefulBuilder(
                              builder: (context, setState) => Checkbox(
                                // Step 1. Use a separate state variable for each checkbox.
                                value: _checkBoxValues[value] ??
                                    false, // Initialize to false
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    _checkBoxValues[value] = newValue!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),

                    // Step 5. Update dropdown value and handle checkbox state changes.
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                        // Reset checkboxes for other items (optional)
                        _checkBoxValues
                            .removeWhere((key, value) => key != newValue);
                      });
                    },
                  ),
                ) // ignore: unnecessary_this
              : Checkbox(
                  value: initialValue,
                  onChanged: (value) {
                    setState(() {
                      initialValue = value!;
                    });
                  }),
        ],
      ),
      leading: Image.asset(
        widget.paltformIcon,
        height: 40.h,
        width: 40.w,
      ),
    );
  }
}
