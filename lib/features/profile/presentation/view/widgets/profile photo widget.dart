import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/features/profile/presentation/manager/edit%20profile%20cubit.dart';
import 'package:post_bet/features/profile/presentation/manager/edit%20profile%20state.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({required this.editProfileCubit, super.key});
  final EditProfileCubit editProfileCubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            editProfileCubit.pickCameraImage();
          },
          child: Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                ClipOval(
                  child: CircleAvatar(
                      radius: 75.h,
                      backgroundColor: k5A5A5A,
                      child: editProfileCubit.file == null
                          ? null
                          : Image.file(
                              editProfileCubit.file!,
                              fit: BoxFit.fill,
                              width: double.infinity,
                              height: double.infinity,
                            )),
                ),
                Positioned(
                  top: 110.h,
                  left: 110.w,
                  right: 120.w,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      color: kPrimaryKey,
                      Icons.photo_camera,
                      size: 32.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
