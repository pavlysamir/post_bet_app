import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';

class DataUserAddPost extends StatelessWidget {
  const DataUserAddPost({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic profilePic = getIt
        .get<CashHelperSharedPreferences>()
        .getData(key: ApiKey.profilePic);
    Uint8List? profileImage;
    try {
      profileImage = base64Decode(profilePic.toString());
    } catch (e) {
      print('Error decoding profile picture: $e');
      // Handle decoding error
    }
    return Row(
      children: [
        profilePic != null && profileImage != null
            ? CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 20,
                child: ClipOval(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: MemoryImage(profileImage),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              )
            : const CircleAvatar(
                backgroundColor: Colors.black,
                radius: 20,
                child: Icon(Icons.person),
              ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                '${getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.name)}',
                style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 3.h),
            Text(
                '${getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.email)}',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.grey[600])),
          ],
        ),
      ],
    );
  }
}
