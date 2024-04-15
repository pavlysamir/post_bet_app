import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/utils/styles.dart';

class HistoryPostsListViewItem extends StatelessWidget {
  const HistoryPostsListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: Text('this is my post',
                    style: Theme.of(context).textTheme.bodyLarge)),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry....',
              style: Styles.textStyle12BoldGrey,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
