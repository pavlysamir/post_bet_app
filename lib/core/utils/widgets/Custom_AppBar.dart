import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import 'package:post_bet/core/utils/widgets/custom_line_seperator.dart';
import 'package:post_bet/features/authentication/presentation/manager/login_cubit/login_cubit.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  dynamic profilePic =
      getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.profilePic);

  @override
  Widget build(BuildContext context) {
    Uint8List? profileImage;
    try {
      profileImage = base64Decode(profilePic.toString());
    } catch (e) {
      print('Error decoding profile picture: $e');
      // Handle decoding error
    }

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        customJustGoNavigate(
                          context: context,
                          path: AppRouter.kSettingScreen,
                        );
                      },
                      icon: const Icon(Icons.menu),
                    ),
                    const Spacer(),
                    Image.asset(
                      AssetsData.newDesignLogoName,
                      height: 50.h,
                      width: 120.w,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        customJustGoNavigate(
                          context: context,
                          path: AppRouter.kEditProfile,
                        );
                      },
                      child: Row(
                        children: [
                          profilePic != null && profileImage != null
                              ? CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 20,
                                  child: ClipOval(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const CustomLineSeperator(),
            ],
          ),
        );
      },
    );
  }
}
