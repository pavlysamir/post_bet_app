import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TemplatePostsListViewItem extends StatelessWidget {
  const TemplatePostsListViewItem(
      {super.key,
      required this.img,
      required this.text,
      required this.function});
  final String img;
  final String text;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: 170.w,
        //height: 150.h,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              //spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child:
                      Text(text, style: Theme.of(context).textTheme.bodyLarge)),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 60.h,
                width: double.infinity,
                child: Image.asset(
                  img,
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
