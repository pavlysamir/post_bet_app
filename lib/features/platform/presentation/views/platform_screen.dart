import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/core/utils/widgets/Custom_AppBar.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/features/platform/presentation/views/widgets/platform_listview_item.dart';
import '../../../../../generated/l10n.dart';

class PlatformScreen extends StatelessWidget {
  const PlatformScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> platformNames = [
      'instagram',
      'facebook',
      'x',
      'instagram',
      'instagram',
    ];
    final List<String> platformIcons = [
      AssetsData.instagramIcon,
      AssetsData.faceBookIcon,
      AssetsData.xIcon,
      AssetsData.instagramIcon,
      AssetsData.instagramIcon,
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(
              image: 'd',
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomTitleText(text: S.of(context).platform),
            SizedBox(
              height: 40.h,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: platformNames.length,
                    itemBuilder: (context, index) {
                      return PlatformListViewItem(
                        image: platformIcons[index],
                        text: platformNames[index],
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
