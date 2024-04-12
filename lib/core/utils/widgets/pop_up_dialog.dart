import 'package:flutter/material.dart';
import 'package:post_bet/core/utils/widgets/custom_button_small.dart';
import '../styles.dart';

class PopUpDialog extends StatelessWidget {
  const PopUpDialog({
    super.key,
    required this.context,
    required this.function,
    required this.text,
  });
  final BuildContext context;
  final Function() function;
  final String text;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: Styles.title1textStyle20,
            textAlign: TextAlign.center,
          )
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButtonSmall(
                text: '',
                color: const Color(0xffFF6A6A),
                function: function,
                textColortcolor: Colors.red,
              ),
              CustomButtonSmall(
                text: '',
                color: Colors.red,
                function: function,
              ),
            ],
          ),
        )
      ],
    );
  }
}
