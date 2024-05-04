import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/features/home/presentation/views/create_template_post.dart';
import 'package:post_bet/features/home/presentation/views/widgets/custom_template_list_view_item.dart';

class CustomTemplatePostsListView extends StatelessWidget {
  const CustomTemplatePostsListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> templateImg = [
      AssetsData.eadFtr,
      AssetsData.happyEad,
      // AssetsData.moledNaby,
      AssetsData.happyBirthday
    ];
    List<String> templateText = [
      'ead fatr s3eed',
      'ead adha s3eed',
      'happy brth day'
    ];
    return SizedBox(
      height: 120.h,
      child: ListView.separated(
        clipBehavior: Clip.none,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 10.w,
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return TemplatePostsListViewItem(
            img: templateImg[index],
            text: templateText[index],
            function: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CreateTemplatePostView(
                  img: templateImg[index],
                  text: templateText[index],
                );
              }));
            },
          );
        },
      ),
    );
  }
}
