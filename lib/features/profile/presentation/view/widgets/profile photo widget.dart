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
        return Align(
          alignment: Alignment.center,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
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
              IconButton(
                onPressed: () {
                  editProfileCubit.pickCameraImage();
                },
                icon: Icon(
                  color: kPrimaryKey,
                  Icons.photo_camera,
                  size: 32.h,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
