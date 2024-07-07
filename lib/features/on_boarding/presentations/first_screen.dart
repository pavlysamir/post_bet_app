import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/styles.dart';
import 'package:post_bet/core/utils/widgets/custom_button_small.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                width: 300.w,
                height: 300.h,
                AssetsData.newDesignLogo,
              ),
              SizedBox(height: 100.h),
              Text('مرحباً بك في بوست بت',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: kPrimaryKey),
                  textAlign: TextAlign.center),
              SizedBox(height: 12.h),
              Expanded(
                  child: Text(
                'مشاركة المنشورات والصور ومقاطع الفيديو بنقرة واحدة فقط',
                style: Styles.textStyle14Grey,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              )),
              CustomButtonSmall(
                text: 'البدء من هنا',
                color: kPrimaryKey,
                function: () {
                  customGoAndDeleteNavigate(
                      context: context, path: AppRouter.kOnBoarding);
                },
                borderColor: kPrimaryKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
