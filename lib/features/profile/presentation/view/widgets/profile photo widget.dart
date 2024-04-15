import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: [
          CircleAvatar(
              radius: 75.h,
              backgroundColor: k5A5A5A,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50,
                child: ClipOval(
                  child: CachedNetworkImage(
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                    imageUrl: '',
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                          color: kPrimaryKey, strokeWidth: 1),
                    ),
                  ),
                ),
              )),
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
    );
  }
}
