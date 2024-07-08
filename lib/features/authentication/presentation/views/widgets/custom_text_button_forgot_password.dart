import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/utils/styles.dart';

class CustomTextButtonForgotPassword extends StatelessWidget {
  const CustomTextButtonForgotPassword({super.key, required this.function});
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: TextButton(
        onPressed: function,
        child: Text(AppLocalizations.of(context)!.forgotPassword,
            style: Styles.textStyle12Orange.copyWith(
              decoration: TextDecoration.underline,
            )),
      ),
    );
  }
}
