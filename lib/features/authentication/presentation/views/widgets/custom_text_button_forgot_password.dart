import 'package:flutter/material.dart';

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
        child: Text('Forget password ?', style: Styles.textStyle12Orange),
      ),
    );
  }
}
