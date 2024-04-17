import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/widgets/custom_button_small.dart';
import 'package:post_bet/generated/l10n.dart';
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
      backgroundColor: Theme.of(context).cardColor,
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall,
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
                text: S.of(context).yes,
                color: colorButton1,
                function: function,
                textColortcolor: textColortcolor1,
              ),
              CustomButtonSmall(
                borderColor: Colors.red,
                width: 100,
                text: S.of(context).no,
                textColortcolor: textColortcolor2,
                color: colorButton2,
                function: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
