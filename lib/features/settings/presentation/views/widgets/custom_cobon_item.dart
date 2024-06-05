import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:post_bet/generated/l10n.dart';

class CobonItem extends StatelessWidget {
  const CobonItem({
    super.key,
    required this.cobonTitle,
    required this.cobonCode,
    required this.color,
    required this.packageType,
  });

  final String cobonTitle;
  final String cobonCode;
  final String packageType;
  final Color color;

  @override
  Widget build(BuildContext context) {
    String isoString = cobonTitle;
    DateTime dateTime = DateTime.parse(isoString);
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return Container(
        //padding: EdgeInsets.all(8.h),
        height: 250.h,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
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
        child: Container(
            color: Colors.white,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                height: 15.h,
              ),
              CircleAvatar(
                radius: 60.r,
                backgroundColor: Colors.black,
                child: Center(
                  child: Text(
                    packageType,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  '${S.of(context).expireData} $formattedDate',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 80.w,
                height: 40.h,
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
              SizedBox(
                height: 12.h,
              )
              // TextButton(
              //   onPressed: () {},
              //   child: Container(
              //     height: 40.h,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(14),
              //     ),
              //     width: double.infinity,
              //     child: Align(
              //       alignment: Alignment.center,
              //       child: Text(
              //         'Read more',
              //         style: Theme.of(context).textTheme.titleLarge,
              //       ),
              //     ),
              //   ),
              // )
            ])));
  }
}
