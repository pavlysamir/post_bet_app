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
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
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
                child: Text('this is my post', style: Styles.textStyle12)),
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
