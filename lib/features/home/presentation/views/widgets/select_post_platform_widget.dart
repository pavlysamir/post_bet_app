import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/features/home/presentation/manager/add_post_cubit/cubit/add_post_cubit.dart';

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
    'Post Instagram',
    'Story Instagram',
    'Reel Instagram',
  ];
  List<String> facebook = [
    'Post FaceBook',
    'Story FaceBook',
    'Reel FaceBook',
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
                                                .selectedInstaItems
                                                .add(value);
                                          } else {
                                            // Remove item from selected list if unchecked
                                            AddPostCubit.get(context)
                                                .selectedInstaItems
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
                                                .selectedaceInstaItems
                                                .add(value);
                                            print(AddPostCubit.get(context)
                                                .selectedaceInstaItems);
                                          } else {
                                            // Remove item from selected list if unchecked
                                            AddPostCubit.get(context)
                                                .selectedaceInstaItems
                                                .remove(value);
                                            print(AddPostCubit.get(context)
                                                .selectedaceInstaItems);
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
                        // AddPostCubit.get(context)
                        //     .selectedItems
                        //     .remove((value) => value == value);
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
                              print(AddPostCubit.get(context).selectedItems);
                            } else if (!value) {
                              AddPostCubit.get(context)
                                  .selectedItems
                                  .remove(value);
                              print(AddPostCubit.get(context).selectedItems);
                              // Remove item from selected list if unchecked
                              AddPostCubit.get(context)
                                  .selectedItems
                                  .removeWhere((value) =>
                                      value !=
                                      AddPostCubit.get(context).checkBoxValues[
                                          AddPostCubit.get(context)
                                              .platformNames[widget.indrx]]);
                              print(AddPostCubit.get(context).selectedItems);
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
