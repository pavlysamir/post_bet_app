import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    // Access the AddPostCubit and store the reference
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
          widget.paltformName == 'Instagram' ||
                  widget.paltformName == 'Facebook'
              ? SizedBox(
                  width: 150.w,
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
                                      value: addPostTempleteCubit
                                              .checkBoxValues[value] ??
                                          false,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          addPostTempleteCubit
                                                  .checkBoxValues[value] =
                                              newValue!;
                                          if (newValue) {
                                            // Add item to selected list if checked
                                            addPostTempleteCubit
                                                .selectedInstaItems
                                                .add(value);
                                          } else {
                                            // Remove item from selected list if unchecked
                                            addPostTempleteCubit
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
                                      value: addPostTempleteCubit
                                              .checkBoxValues[value] ??
                                          false,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          addPostTempleteCubit
                                                  .checkBoxValues[value] =
                                              newValue!;
                                          if (newValue) {
                                            // Add item to selected list if checked
                                            addPostTempleteCubit
                                                .selectedaceInstaItems
                                                .add(value);
                                            print(addPostTempleteCubit
                                                .selectedaceInstaItems);
                                          } else {
                                            // Remove item from selected list if unchecked
                                            addPostTempleteCubit
                                                .selectedaceInstaItems
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
                        addPostTempleteCubit.checkBoxValues
                            .removeWhere((key, value) => key != newValue);
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
                                          addPostTempleteCubit
                                              .platformNames[widget.indrx]] =
                                      value);
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
