import 'package:flutter/material.dart';
import 'package:post_bet/generated/l10n.dart';

import '../../../../../core/utils/styles.dart';

class CustomTextButtonForgotPassword extends StatelessWidget {
  const CustomTextButtonForgotPassword({super.key, required this.function});
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: function,
        child:
            Text(S.of(context).forgotPassword, style: Styles.textStyle12Orange),
      ),
    );
  }
}
