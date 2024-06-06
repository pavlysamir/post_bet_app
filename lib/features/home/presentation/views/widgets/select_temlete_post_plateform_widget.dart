import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/features/home/presentation/manager/add_post_templete/add_post_templete_cubit.dart';

class CreateTempletePostPlatFormItem extends StatefulWidget {
  const CreateTempletePostPlatFormItem({
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
  State<CreateTempletePostPlatFormItem> createState() =>
      _CreatePostPlatFormItemState();
}

class _CreatePostPlatFormItemState
    extends State<CreateTempletePostPlatFormItem> {
  String dropdownValue = 'Post';
  bool initialValue = false;
  bool initialValue2 = false;
  late AddPostTempleteCubit addPostTempleteCubit;

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
    // Access the addPostTempleteCubit and store the reference
    addPostTempleteCubit = AddPostTempleteCubit.get(context);
  }

  @override
  void dispose() {
    // Safely use the stored reference
    addPostTempleteCubit.checkBoxValues.clear();
    addPostTempleteCubit.selectedInstaItems.clear();
    addPostTempleteCubit.selectedItems.clear();
    addPostTempleteCubit.addPostTempleteController.text = '';

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
                            addPostTempleteCubit.selectedInstaItems.add(
                                addPostTempleteCubit
                                    .platformNames[widget.indrx]);
                            addPostTempleteCubit.checkBoxValues[
                                addPostTempleteCubit
                                    .platformNames[widget.indrx]] = value;
                            print(addPostTempleteCubit.checkBoxValues);
                            print(addPostTempleteCubit.selectedItems);
                          } else {
                            addPostTempleteCubit.selectedInstaItems.remove(
                                addPostTempleteCubit
                                    .platformNames[widget.indrx]);
                            print(addPostTempleteCubit.selectedInstaItems);
                            addPostTempleteCubit.selectedInstaItems.remove(
                                addPostTempleteCubit.checkBoxValues[
                                    addPostTempleteCubit
                                        .platformNames[widget.indrx]] = value);
                            print(addPostTempleteCubit.selectedInstaItems);
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
                                addPostTempleteCubit.selectedaceInstaItems.add(
                                    addPostTempleteCubit
                                        .platformNames[widget.indrx]);
                                addPostTempleteCubit.checkBoxValues[
                                    addPostTempleteCubit
                                        .platformNames[widget.indrx]] = value;
                                print(addPostTempleteCubit.checkBoxValues);
                                print(addPostTempleteCubit.selectedItems);
                              } else {
                                addPostTempleteCubit.selectedaceInstaItems
                                    .remove(addPostTempleteCubit
                                        .platformNames[widget.indrx]);
                                print(
                                    addPostTempleteCubit.selectedaceInstaItems);
                                addPostTempleteCubit.selectedaceInstaItems
                                    .remove(addPostTempleteCubit.checkBoxValues[
                                            addPostTempleteCubit
                                                .platformNames[widget.indrx]] =
                                        value);
                                print(
                                    addPostTempleteCubit.selectedaceInstaItems);
                              }
                            });
                          },
                        );
                      },
                    )
                  // ignore: unnecessary_this
                  : StatefulBuilder(
                      builder: (context, setState) {
                        return Checkbox(
                            checkColor: Colors.white,
                            activeColor: kPrimaryKey,
                            value: initialValue,
                            onChanged: (value) {
                              setState(() {
                                initialValue = value!;
                                // addPostTempleteCubit.checkBoxValues[
                                //     addPostTempleteCubit
                                //         .platformNames[widget.indrx]] = value;
                                if (value) {
                                  addPostTempleteCubit.selectedItems.add(
                                      addPostTempleteCubit
                                          .platformNames[widget.indrx]);
                                  addPostTempleteCubit.checkBoxValues[
                                      addPostTempleteCubit
                                          .platformNames[widget.indrx]] = value;
                                  print(addPostTempleteCubit.checkBoxValues);
                                  print(addPostTempleteCubit.selectedItems);
                                  // Add item to selected list if checked
                                } else {
                                  addPostTempleteCubit.selectedItems.remove(
                                      addPostTempleteCubit
                                          .platformNames[widget.indrx]);
                                  print(addPostTempleteCubit.selectedItems);
                                  addPostTempleteCubit.selectedItems.remove(
                                      addPostTempleteCubit.checkBoxValues[
                                          addPostTempleteCubit.platformNames[
                                              widget.indrx]] = value);
                                  print(addPostTempleteCubit.selectedItems);
                                  // Remove item from selected list if unchecked
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
