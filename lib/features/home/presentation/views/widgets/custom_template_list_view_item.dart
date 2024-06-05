import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/generated/l10n.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  img,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Align(
                  alignment: Alignment.topLeft,
                  child:
                      Text(text, style: Theme.of(context).textTheme.bodyLarge)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(S.of(context).amazingMessage,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.grey))),
            ),
          ],
        ),
      ),
    );
  }
}
