import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/styles.dart';
import 'package:post_bet/core/utils/widgets/Custom_AppBar_with_title.dart';
import 'package:post_bet/core/utils/widgets/custom_line_seperator.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/features/settings/presentation/views/widgets/setting_icon_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbareWithTitle(title: 'Settings'),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomLineSeperator(),
          SizedBox(height: 40.h),
          const CustomTitleText(text: 'Accounts'),
          SizedBox(height: 26.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: kBlackColor,
                ),
                SizedBox(width: 10.w),
                Text('john smith', style: Styles.textStyle14W500Black),
                SizedBox(width: 180.w),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: kPrimaryKey,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),
          const CustomLineSeperator(),
          SizedBox(height: 30.h),
          const CustomTitleText(text: 'Settings'),
          const SettingsIconWidget(
            icon: Icon(
              Icons.help_outline_sharp,
              color: Colors.white,
            ),
            title: 'Help center',
          ),
          const SettingsIconWidget(
            title: 'About Us',
          ),
          const SettingsIconWidget(
            title: 'Subscriptions',
          ),
          const SettingsIconWidget(
            title: 'Change language',
          ),
          const SettingsIconWidget(
            icon: Icon(Icons.text_snippet, color: Colors.white),
            title: 'Terms & conditions',
          ),
          const SettingsIconWidget(
            icon: Icon(Icons.delete, color: Colors.white),
            title: 'Delete account',
          ),
          const SettingsIconWidget(
            title: 'Change Theme',
          ),
          const SettingsIconWidget(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            title: 'Logout',
          ),
        ]),
      ),
    );
  }
}
