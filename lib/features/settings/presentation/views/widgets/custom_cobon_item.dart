import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Container(
        //padding: EdgeInsets.all(8.h),
        height: 202.h,
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
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: color,
                child: Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: color,
                      child: Text(
                        textAlign: TextAlign.center,
                        packageType,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                  color: Colors.white,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            cobonTitle,
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
                              enabledBorder: Theme.of(context)
                                  .inputDecorationTheme
                                  .enabledBorder,
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors
                                        .white), // Border color changes to red
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
                      ])),
            )
          ],
        ));
  }
}
