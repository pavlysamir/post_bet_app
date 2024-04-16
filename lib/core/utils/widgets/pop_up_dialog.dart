import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/widgets/custom_button_small.dart';
import '../styles.dart';

class PopUpDialog extends StatelessWidget {
  const PopUpDialog({
    super.key,
    required this.context,
    required this.function,
    required this.title,
    required this.subTitle,
    this.colorButton1 = kPrimaryKey,
    this.textColortcolor1 = Colors.white,
    this.colorButton2 = kPrimaryKey,
    this.textColortcolor2 = Colors.white,
  });
  final BuildContext context;
  final Function() function;
  final String title;
  final String subTitle;
  final Color colorButton1;
  final Color colorButton2;
  final Color textColortcolor1;
  final Color textColortcolor2;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: Styles.textStyle20BoldPoppings,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          )
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButtonSmall(
                borderColor: Colors.red,
                width: 100,
                text: 'yess',
                color: colorButton1,
                function: function,
                textColortcolor: textColortcolor1,
              ),
              CustomButtonSmall(
                borderColor: Colors.red,
                width: 100,
                text: 'nooo',
                textColortcolor: textColortcolor2,
                color: colorButton2,
                function: function,
              ),
            ],
          ),
        )
      ],
    );
  }
}
