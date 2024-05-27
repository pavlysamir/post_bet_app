import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/utils/styles.dart';
import 'package:post_bet/features/activities/data/models/ayrshare_post_model.dart';
import 'package:post_bet/features/activities/presentation/views/widgets/custom_view_post_image.dart';
import 'package:post_bet/features/activities/presentation/views/widgets/custom_view_video_post.dart';

class LastPostsContainer extends StatelessWidget {
  const LastPostsContainer({super.key, required this.post});
  final AyrsharePostResponse post;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250.h,
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
        padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.post,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              post.platforms.toString(),
              style: Styles.textStyle12BoldGrey,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                post.scheduleDate.toString(),
                style: Styles.textStyle12Orange,
              ),
              // IconButton(
              //     iconSize: 16.h,
              //     onPressed: () {
              //       showDialog(
              //         context: context,
              //         builder: (BuildContext context) => PopUpDialog(
              //           function2: () {
              //             Navigator.pop(context);
              //           },
              //           context: context,
              //           function: () {},
              //           title: 'Confirm delete post',
              //           subTitle:
              //               'if you confirm to delete this post will not be a backup',
              //           colorButton1: kPoppingsRedColor,
              //           colorButton2: Colors.red,
              //           textColortcolor1: Colors.red,
              //           textColortcolor2: Colors.white,
              //         ),
              //       );
              //     },
              //     icon: const Icon(
              //       Icons.delete,
              //       color: Colors.red,
              //     )),
            ]),
            SizedBox(
              height: 15.h,
            ),
            post.mediaUrls.isNotEmpty
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (post.isVideo == true)
                        SizedBox(
                          height: 80.h,
                          width: 200.w,
                          child: CustomViewVideoPost(
                            file: post.mediaUrls.first,
                          ),
                        ),
                      post.mediaUrls.isNotEmpty
                          ? SizedBox(
                              width: 90.w,
                              child: CustomViewPostPhoto(
                                file: post.mediaUrls[0],
                              ),
                            )
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      post.mediaUrls.length >= 2
                          ? SizedBox(
                              width: 90.w,
                              child: CustomViewPostPhoto(
                                file: post.mediaUrls[1],
                              ),
                            )
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      post.mediaUrls.length >= 3
                          ? SizedBox(
                              width: 90.w,
                              child: CustomViewPostPhoto(
                                file: post.mediaUrls[2],
                              ),
                            )
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                    ],
                  )
                : const SizedBox(),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}
