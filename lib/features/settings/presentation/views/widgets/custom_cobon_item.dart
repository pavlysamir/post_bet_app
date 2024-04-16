import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/utils/styles.dart';

class CobonItem extends StatelessWidget {
  const CobonItem({
    super.key,
    required this.cobonTitle,
    required this.cobonCode,
    required this.color,
  });

  final String cobonTitle;
  final String cobonCode;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
      height: 202.h,
      decoration: BoxDecoration(
        color: color,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              cobonTitle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle16Black,
            ),
          ),
          SizedBox(
            width: 100.w,
            child: TextFormField(
              initialValue: cobonCode,
              readOnly: true,
              style: Theme.of(context).textTheme.titleMedium,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                enabledBorder:
                    Theme.of(context).inputDecorationTheme.enabledBorder,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.white), // Border color changes to red
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
              width: double.infinity,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Read more',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
