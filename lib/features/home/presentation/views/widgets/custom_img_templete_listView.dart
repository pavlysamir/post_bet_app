import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/features/home/presentation/views/widgets/custom_img_templete_item.dart';

class CustomImgTempleteListview extends StatelessWidget {
  const CustomImgTempleteListview({super.key});

  @override
  Widget build(BuildContext context) {
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
        itemCount: 10,
        itemBuilder: (context, index) {
          return CustomImgTempleteItem(
            function: () {},
            img: AssetsData.example,
          );
        },
      ),
    );
  }
}
