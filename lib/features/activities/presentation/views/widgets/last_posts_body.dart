import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/utils/styles.dart';

class LastPostsBody extends StatelessWidget {
  const LastPostsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130.h,
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'this is my post',
              style: Styles.textStyle12BoldPoppings,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and happy to post this shit',
              style: Styles.textStyle12BoldGrey,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                '18-3-2024 18:06',
                style: Styles.textStyle12Orange,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 14,
                  )),
            ]),
          ],
        ),
      ),
    );
  }
}
