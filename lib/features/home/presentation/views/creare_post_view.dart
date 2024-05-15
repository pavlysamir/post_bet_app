import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
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
    return BlocConsumer<AddPostCubit, AddPostState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: CustomAppbareWithTitle(title: S.of(context).createPost),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: CustomButtonLarge(
                  text: S.of(context).share,
                  color: kPrimaryKey,
                  textColor: Colors.white,
                  function: () {
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

class CreatePostPlatFormItem extends StatefulWidget {
  const CreatePostPlatFormItem({
    super.key,
    required this.paltformName,
    required this.paltformIcon,
    required this.indrx,
  });

  final String paltformName;
  final String paltformIcon;
  final int indrx;

  @override
  State<CreatePostPlatFormItem> createState() => _CreatePostPlatFormItemState();
}

class _CreatePostPlatFormItemState extends State<CreatePostPlatFormItem> {
  String dropdownValue = 'Post';
  bool initialValue = false;
  bool initialValue2 = false;

  List<String> instagram = [
    'Post',
    'Story',
    'Reel',
  ];
  List<String> facebook = [
    'Groubs',
    'Pages',
  ];
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
          widget.paltformName == 'Instagram' ||
                  widget.paltformName == 'Facebook'
              ? SizedBox(
                  width: 200.w,
                  child: DropdownButton<String>(
                    // value: dropdownValue,
                    items: widget.paltformName == 'Instagram'
                        ? instagram
                            .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    value,
                                    style: TextStyle(fontSize: 15.sp),
                                  ),
                                  StatefulBuilder(
                                    builder: (context, setState) => Checkbox(
                                      value: AddPostCubit.get(context)
                                              .checkBoxValues[value] ??
                                          false,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          AddPostCubit.get(context)
                                                  .checkBoxValues[value] =
                                              newValue!;
                                          if (newValue) {
                                            // Add item to selected list if checked
                                            AddPostCubit.get(context)
                                                .selectedItems
                                                .add(value);
                                          } else {
                                            // Remove item from selected list if unchecked
                                            AddPostCubit.get(context)
                                                .selectedItems
                                                .remove(value);
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList()
                        : facebook
                            .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    value,
                                    style: TextStyle(fontSize: 15.sp),
                                  ),
                                  StatefulBuilder(
                                    builder: (context, setState) => Checkbox(
                                      value: AddPostCubit.get(context)
                                              .checkBoxValues[value] ??
                                          false,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          AddPostCubit.get(context)
                                                  .checkBoxValues[value] =
                                              newValue!;
                                          if (newValue) {
                                            // Add item to selected list if checked
                                            AddPostCubit.get(context)
                                                .selectedItems
                                                .add(value);
                                          } else {
                                            // Remove item from selected list if unchecked
                                            AddPostCubit.get(context)
                                                .selectedItems
                                                .remove(value);
                                          }
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
                        AddPostCubit.get(context)
                            .checkBoxValues
                            .removeWhere((key, value) => key != newValue);
                        AddPostCubit.get(context)
                            .selectedItems
                            .removeWhere((value) => value != newValue);
                      });
                    },
                  ),
                ) // ignore: unnecessary_this
              : StatefulBuilder(
                  builder: (context, setState) {
                    return Checkbox(
                        value: initialValue,
                        onChanged: (value) {
                          setState(() {
                            initialValue = value!;
                            AddPostCubit.get(context).checkBoxValues[
                                AddPostCubit.get(context)
                                    .platformNames[widget.indrx]] = value;
                            if (value) {
                              // Add item to selected list if checked
                              AddPostCubit.get(context).selectedItems.add(
                                  AddPostCubit.get(context)
                                      .platformNames[widget.indrx]);
                            } else if (!value) {
                              // Remove item from selected list if unchecked
                              AddPostCubit.get(context)
                                  .selectedItems
                                  .removeWhere((value) =>
                                      value !=
                                      AddPostCubit.get(context).checkBoxValues[
                                          AddPostCubit.get(context)
                                              .platformNames[widget.indrx]]);
                              print('ddddd00');
                            }
                          });
                        });
                  },
                ),
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
