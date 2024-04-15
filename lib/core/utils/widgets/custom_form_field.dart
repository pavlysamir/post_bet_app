import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField(
      {super.key,
      required this.controller,
      required this.validationMassage,
      required this.hintText,
      required this.textInputType,
      this.suffixIcon,
      this.prefixIcon,
      this.isEyeTrue = false});
  final TextEditingController controller;
  //final String validationMassage;
  final String hintText;
  final TextInputType textInputType;
  IconButton? suffixIcon;
  Icon? prefixIcon;
  final Function(String value) validationMassage;
  final bool isEyeTrue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.titleMedium,
      obscureText: isEyeTrue,
      keyboardType: textInputType,
      controller: controller,
      validator: (value) {
        return validationMassage(value!);
      },
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      // focusNode: FocusNode(),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        //filled: true,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        //fillColor: Colors.grey[200],
        enabledBorder: outlineInputBorder(context),
        focusedBorder: outlineInputBorder(context),
        errorBorder: outlineInputBorderError(),
        hintText: hintText,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 40,
          minHeight: 40,
        ),
        hintStyle: Styles.textStyle14Grey,
      ),
    );
  }
}

InputBorder? outlineInputBorder(BuildContext context) {
  return Theme.of(context).inputDecorationTheme.enabledBorder;
}

OutlineInputBorder outlineInputBorderError() {
  return OutlineInputBorder(
    borderSide:
        const BorderSide(color: Colors.red), // Border color changes to red
    borderRadius: BorderRadius.circular(14),
  );
}
