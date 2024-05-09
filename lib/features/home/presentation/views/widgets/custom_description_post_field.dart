import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/features/home/presentation/manager/add_post_cubit/cubit/add_post_cubit.dart';
import 'package:post_bet/features/home/presentation/views/widgets/custom_view_photo_from_device.dart';
import 'package:post_bet/features/home/presentation/views/widgets/custom_view_video_from_device.dart';

class CustomDescriptionPostField extends StatelessWidget {
  const CustomDescriptionPostField({
    Key? key,
    this.controller,
    required this.validationMassage,
    required this.hintText,
    required this.textInputType,
    // required this.prefexIcon,
  }) : super(key: key);

  final TextEditingController? controller;
  final String hintText;
  final TextInputType textInputType;
  final Function(String value) validationMassage;
  // final Widget prefexIcon;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPostCubit, AddPostState>(
      builder: (context, state) {
        return Container(
          clipBehavior: Clip.none,
          //  height: 150.h,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                //offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              TextFormField(
                maxLines: 10,
                keyboardType: textInputType,
                controller: controller,
                validator: (value) {
                  return validationMassage(value!);
                },
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  enabledBorder: outlineInputBorder(),
                  focusedBorder: outlineInputBorder(),
                  hintText: hintText,
                  hintStyle: Theme.of(context).textTheme.bodyLarge,
                  //prefixIcon: prefexIcon,
                ),
              ),
              if (AddPostCubit.get(context).fileImage != null)
                Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomViewPhotoFromDevice(
                      file: AddPostCubit.get(context).fileImage!,
                      function: () {
                        AddPostCubit.get(context).clearImage();
                      },
                    ),
                  ],
                ),
              if (AddPostCubit.get(context).fileVideo != null)
                Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomViewVideoFromDevice(
                      file: AddPostCubit.get(context).fileVideo!,
                      function: () {
                        AddPostCubit.get(context).clearVideo();
                      },
                    ),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.image,
                      size: 25.h,
                    ),
                    onPressed: () {
                      AddPostCubit.get(context).pickCameraImage();
                    },
                  ),
                  SizedBox(width: 10.w),
                  IconButton(
                    icon: Icon(
                      Icons.videocam_rounded,
                      size: 25.h,
                    ),
                    onPressed: () {
                      AddPostCubit.get(context).pickCameraVideo();
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(10),
  );
}
