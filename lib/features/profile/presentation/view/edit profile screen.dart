import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/core/utils/styles.dart';
import 'package:post_bet/core/utils/widgets/Custom_AppBar_with_title.dart';
import 'package:post_bet/core/utils/widgets/custom_line_seperator.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/features/profile/presentation/view/widgets/profile%20photo%20widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbareWithTitle(title: 'Edit Profile'),
      body: Column(
        children: [
          const CustomLineSeperator(),
          SizedBox(height: 20.h),
          //Profile photo
          const ProfilePhotoWidget(),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('John Smith', style: Styles.textStyle27W600),
              IconButton(
                  onPressed: () {}, icon: Image.asset(AssetsData.penIcon)),
            ],
          ),
        ],
      ),
    );
  }
}
