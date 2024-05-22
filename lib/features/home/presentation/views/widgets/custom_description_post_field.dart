import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
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
    this.img,
    // required this.prefexIcon,
  }) : super(key: key);

  final TextEditingController? controller;
  final String hintText;
  final String? img;

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
              state is LoadingPickImage
                  ? const Center(
                      child: CircularProgressIndicator(color: kPrimaryKey),
                    )
                  : const SizedBox(),
              if (AddPostCubit.get(context).postImages.isNotEmpty)
                Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomViewPhotoFromDevice(
                      file: AddPostCubit.get(context).postImages[0],
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
                      file: AddPostCubit.get(context).displayVideo!,
                      function: () {
                        AddPostCubit.get(context).clearVideo();
                      },
                    ),
                  ],
                ),
              if (img != null)
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: const BoxDecoration(
                      // border: Border.all(color: kPrimaryKey),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Image.asset(
                    img!,
                    fit: BoxFit.cover,
                  ),
                ),
              if (img == null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.image,
                        size: 25.h,
                      ),
                      onPressed: () {
                        AddPostCubit.get(context).getPostImageFromDevice();
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
