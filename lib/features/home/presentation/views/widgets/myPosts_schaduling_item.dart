import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPostsSchaduling extends StatelessWidget {
  const MyPostsSchaduling({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 121.h,
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'غدا الساعة 10:00 صباحا',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    color: Colors.black,
                    iconSize: 23.dg,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                    iconSize: 23.dg,
                  ),
                ],
              ),
              const Text('يسعدنا أن نعلن عن إطلاق منتجنا الجديد!')
            ],
          ),
        ),
      ),
    );
  }
}
