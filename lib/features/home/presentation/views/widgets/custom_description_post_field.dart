import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDescriptionPostField extends StatelessWidget {
  const CustomDescriptionPostField({
    Key? key,
    required this.controller,
    required this.validationMassage,
    required this.hintText,
    required this.textInputType,
    // required this.prefexIcon,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final Function(String value) validationMassage;
  // final Widget prefexIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: SizedBox(
        height: 125.h,
        child: TextFormField(
          maxLines: 10,
          keyboardType: textInputType,
          controller: controller,
          validator: (value) {
            return validationMassage(value!);
          },
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            filled: true,
            fillColor: Theme.of(context).cardColor,
            enabledBorder: outlineInputBorder(),
            focusedBorder: outlineInputBorder(),
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyLarge,
            //prefixIcon: prefexIcon,
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.circular(10),
  );
}
