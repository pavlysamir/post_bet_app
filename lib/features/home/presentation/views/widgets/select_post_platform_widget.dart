import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/features/home/presentation/manager/add_post_cubit/cubit/add_post_cubit.dart';

class CreatePostPlatFormItem extends StatefulWidget {
  const CreatePostPlatFormItem({
    super.key,
    required this.paltformName,
    required this.paltformIcon,
    required this.indrx,
    required this.platformDescription,
  });

  final String paltformName;
  final String paltformIcon;
  final int indrx;
  final String platformDescription;

  @override
  State<CreatePostPlatFormItem> createState() => _CreatePostPlatFormItemState();
}

class _CreatePostPlatFormItemState extends State<CreatePostPlatFormItem> {
  String dropdownValue = 'Post';
  bool initialValue = false;
  bool initialValue2 = false;

  late AddPostCubit addPostCubit;

  List<String> instagram = [
    'Post',
    'Story',
    'Reel',
  ];
  List<String> facebook = [
    'Post .',
    'Story .',
    'Reel .',
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access the AddPostCubit and store the reference
    addPostCubit = AddPostCubit.get(context);
  }

  @override
  void dispose() {
    // Safely use the stored reference
    addPostCubit.checkBoxValues.clear();
    addPostCubit.selectedInstaItems.clear();
    addPostCubit.selectedaceInstaItems.clear();
    addPostCubit.selectedItems.clear();
    addPostCubit.addPostController.text = '';
    addPostCubit.postImages.clear();
    addPostCubit.fileVideo = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.paltformName,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                widget.platformDescription,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
          widget.paltformName == 'Instagram Post' ||
                  widget.paltformName == 'Instagram Story' ||
                  widget.paltformName == 'Instagram Reel'
              ? StatefulBuilder(
                  builder: (context, setState) {
                    return Checkbox(
                      checkColor: Colors.white,
                      activeColor: kPrimaryKey,
                      value: initialValue,
                      onChanged: (value) {
                        setState(() {
                          initialValue = value!;
                          if (value) {
                            addPostCubit.selectedInstaItems
                                .add(addPostCubit.platformNames[widget.indrx]);
                            addPostCubit.checkBoxValues[addPostCubit
                                .platformNames[widget.indrx]] = value;
                            print(addPostCubit.checkBoxValues);
                            print(addPostCubit.selectedItems);
                          } else {
                            addPostCubit.selectedInstaItems.remove(
                                addPostCubit.platformNames[widget.indrx]);
                            print(addPostCubit.selectedInstaItems);
                            addPostCubit.selectedInstaItems.remove(
                                addPostCubit.checkBoxValues[addPostCubit
                                    .platformNames[widget.indrx]] = value);
                            print(addPostCubit.selectedInstaItems);
                          }
                        });
                      },
                    );
                  },
                )
              : widget.paltformName == 'Facebook Post' ||
                      widget.paltformName == 'Facebook Story' ||
                      widget.paltformName == 'Facebook Reel'
                  ? StatefulBuilder(
                      builder: (context, setState) {
                        return Checkbox(
                          checkColor: Colors.white,
                          activeColor: kPrimaryKey,
                          value: initialValue,
                          onChanged: (value) {
                            setState(() {
                              initialValue = value!;
                              if (value) {
                                addPostCubit.selectedaceInstaItems.add(
                                    addPostCubit.platformNames[widget.indrx]);
                                addPostCubit.checkBoxValues[addPostCubit
                                    .platformNames[widget.indrx]] = value;
                                print(addPostCubit.checkBoxValues);
                                print(addPostCubit.selectedItems);
                              } else {
                                addPostCubit.selectedaceInstaItems.remove(
                                    addPostCubit.platformNames[widget.indrx]);
                                print(addPostCubit.selectedaceInstaItems);
                                addPostCubit.selectedaceInstaItems.remove(
                                    addPostCubit.checkBoxValues[addPostCubit
                                        .platformNames[widget.indrx]] = value);
                                print(addPostCubit.selectedaceInstaItems);
                              }
                            });
                          },
                        );
                      },
                    )
                  : StatefulBuilder(
                      builder: (context, setState) {
                        return Checkbox(
                          checkColor: Colors.white,
                          activeColor: kPrimaryKey,
                          value: initialValue,
                          onChanged: (value) {
                            setState(() {
                              initialValue = value!;
                              if (value) {
                                addPostCubit.selectedItems.add(
                                    addPostCubit.platformNames[widget.indrx]);
                                addPostCubit.checkBoxValues[addPostCubit
                                    .platformNames[widget.indrx]] = value;
                                print(addPostCubit.checkBoxValues);
                                print(addPostCubit.selectedItems);
                              } else {
                                addPostCubit.selectedItems.remove(
                                    addPostCubit.platformNames[widget.indrx]);
                                print(addPostCubit.selectedItems);
                                addPostCubit.selectedItems.remove(
                                    addPostCubit.checkBoxValues[addPostCubit
                                        .platformNames[widget.indrx]] = value);
                                print(addPostCubit.selectedItems);
                              }
                            });
                          },
                        );
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
