import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonLarge extends StatelessWidget {
  const CustomButtonLarge(
      {Key? key,
      required this.text,
      required this.color,
      required this.textColor,
      required this.function,
      this.icon})
      : super(key: key);
  final String text;
  final Color color;
  final Color textColor;
  final Function() function;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: 40.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: kPrimaryKey),
          borderRadius: const BorderRadius.all(Radius.circular(100)),
        ),
        child: Center(
            child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.labelLarge,
            children: [
              TextSpan(
                  text: text,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis, color: textColor)),
              WidgetSpan(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: icon,
              )),
            ],
          ),
        )),
      ),
    );
  }
}
