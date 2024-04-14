import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import '../../../constants.dart';
import '../styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  AssetsData.postBetName,
                ),
                const Spacer(),
                Text(name, style: Styles.textStyle14Black),
                const SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 20,
                  child: ClipOval(
                      child: Container(
                    color: kBlackColor,
                  )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: kBlackColor.withOpacity(0.4),
          ),
        ],
      ),
    );
  }
}
