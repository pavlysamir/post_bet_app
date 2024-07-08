import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import 'package:post_bet/core/utils/widgets/pop_up_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddPostContainer extends StatelessWidget {
  const AddPostContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          getIt
                      .get<CashHelperSharedPreferences>()
                      .getData(key: ApiKey.platForms) ==
                  null
              ? showDialog(
                  context: context,
                  builder: (BuildContext context) => PopUpDialogOneButton(
                    context: context,
                    function: () {
                      Navigator.pop(context);
                    },
                    title: AppLocalizations.of(context)!.gotoSubscripe,
                    subTitle: '',
                    colorButton1: kPrimaryKey,
                    textColortcolor1: Colors.white,
                    textbtn: AppLocalizations.of(context)!.ok,
                  ),
                )
              : customJustGoNavigate(
                  context: context, path: AppRouter.kAddPostView);
        },
        child: Container(
          height: 150.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.typeAnyThing),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.image,
                      size: 15.h,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 5.w),
                    Icon(
                      Icons.videocam_rounded,
                      size: 15.h,
                      color: Colors.grey,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
