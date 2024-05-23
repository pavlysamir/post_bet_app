import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/widgets/Custom_AppBar_with_title.dart';
import 'package:post_bet/core/utils/widgets/custom_button_large.dart';
import 'package:post_bet/core/utils/widgets/custom_form_field.dart';
import 'package:post_bet/features/settings/presentation/manager/settings_cubit/cubit/settings_cubit.dart';
import 'package:post_bet/generated/l10n.dart';

class EnterPromoView extends StatelessWidget {
  const EnterPromoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbareWithTitle(title: S.of(context).enterPromo),
        body: BlocListener<SettingsCubit, SettingsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  S.of(context).enterPromo,
                  style: Theme.of(context).textTheme.displayLarge,
                )),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomFormField(
                    hintText: '****',
                    controller: SettingsCubit.get(context).promocodeController,
                    validationMassage: (value) {
                      if (value.isEmpty) {
                        return 'please enter new promo code';
                      }
                    },
                    textInputType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButtonLarge(
                      text: S.of(context).submet,
                      color: kPrimaryKey,
                      textColor: Colors.white,
                      function: () {}),
                ),
              ],
            ),
          ),
        ));
  }
}
