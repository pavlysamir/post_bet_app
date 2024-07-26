import 'package:flutter/material.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import 'package:post_bet/core/utils/widgets/floating_action_button.dart';
import 'package:post_bet/core/utils/widgets/pop_up_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFloatingActionButton(
      function: () {
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
    );
  }
}
