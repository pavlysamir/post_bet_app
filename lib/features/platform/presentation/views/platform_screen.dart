import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/Assets/Assets.dart';

import 'package:post_bet/core/utils/widgets/Custom_AppBar.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/features/platform/presentation/manager/cubit/platform_cubit.dart';
import 'package:post_bet/features/platform/presentation/views/widgets/platform_listview_item.dart';
import 'package:post_bet/features/settings/presentation/views/tap_payment_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../generated/l10n.dart';

class PlatformScreen extends StatelessWidget {
  const PlatformScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> platformNames = [
      'Instagram',
      'Facebook Groub',
      'Facebook Groub',
      'X',
      'Linkedin',
      'Reddit',
      'Youtube',
      'Tiktok',
      'Pinterest',
      'Telegram',
      'Google Business'
    ];
    final List<String> platformIcons = [
      AssetsData.instagramIcon,
      AssetsData.faceBookIcon,
      AssetsData.faceBookIcon,
      AssetsData.xIcon,
      AssetsData.linkedln,
      AssetsData.reddit,
      AssetsData.youtube,
      AssetsData.tiktok,
      AssetsData.pinterest,
      AssetsData.telegram,
      AssetsData.googleBusiness
    ];
    return BlocConsumer<PlatformCubit, PlatformState>(
      listener: (context, state) {
        // if (state is LinkAcoountSuccess) {
        //   //launchUrl(Uri.parse(state.url), mode: LaunchMode.externalApplication);
        //   Navigator.push(context, MaterialPageRoute(builder: (context) {
        //     return WebViewPaynet(
        //       uri: state.url,
        //     );
        //   }));
        // }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  image: 'd',
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomTitleText(text: S.of(context).platform),
                SizedBox(
                  height: 40.h,
                ),
                ElevatedButton(
                    onPressed: () async {
                      PlatformCubit.get(context)!.linkAcount().then((value) {
                        launchUrl(Uri.parse(value),
                            mode: LaunchMode.externalApplication);

                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return WebViewPaynet(
                        //     uri: value,
                        //   );
                        // }));
                      });
                    },
                    child: const Text('Link Account')),
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
                            function: () async {},
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
      },
    );
  }
}
