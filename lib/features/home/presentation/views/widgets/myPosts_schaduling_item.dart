import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/features/home/data/models/myposts_model.dart';

class MyPostsSchaduling extends StatelessWidget {
  const MyPostsSchaduling({
    super.key,
    required this.postModel,
    required this.index,
  });
  final History postModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        //height: 121.h,
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
                    postModel.created,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  // IconButton(
                  //   onPressed: () {},
                  //   icon: const Icon(Icons.edit),
                  //   color: Colors.black,
                  //   iconSize: 23.dg,
                  // ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: const Icon(Icons.delete),
                  //   color: Colors.red,
                  //   iconSize: 23.dg,
                  // ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(postModel.post),
              SizedBox(height: 20.h),
              postModel.mediaUrls.isNotEmpty
                  ? Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.network(
                          postModel.mediaUrls[0],
                        ),
                      ),
                    )
                  : const Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
