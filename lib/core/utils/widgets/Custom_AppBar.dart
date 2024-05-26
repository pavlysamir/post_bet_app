import 'dart:io';
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
                    Image.asset(
                      AssetsData.postBetImage,
                      height: 50.h,
                      width: 120.w,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        customJustGoNavigate(
                            context: context, path: AppRouter.kEditProfile);
                      },
                      child: Row(
                        children: [
                          state is GetUserLoading
                              ? Text('Hello',
                                  style: Theme.of(context).textTheme.titleLarge)
                              : Text(
                                  '${getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.name)}',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                          const SizedBox(
                            width: 5,
                          ),
                          if (profilePic != null)
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 20,
                              child: ClipOval(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fitHeight,
                                      image: NetworkImage(
                                          "https:/${getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.profilePic)}"),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          else
                            const CircleAvatar(
                              backgroundColor: Colors.grey,
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

  ImageProvider _buildImageProvider() {
    if (profilePic is Uint8List) {
      // If 'profilePic' is a Uint8List, use MemoryImage
      return MemoryImage(profilePic as Uint8List);
    } else if (profilePic is String) {
      // If 'profilePic' is a String (file path or URL), check if it's a valid file path
      if (Uri.tryParse(profilePic)?.isAbsolute == true) {
        // If it's an absolute URL, use NetworkImage
        return NetworkImage(profilePic as String);
      } else {
        // Otherwise, assume it's a file path and use FileImage
        return FileImage(File(profilePic as String));
      }
    } else {
      // Handle other cases or throw an error
      throw ArgumentError('Invalid file type');
    }
  }
}
