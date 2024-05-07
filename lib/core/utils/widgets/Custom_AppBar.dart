import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:post_bet/core/utils/widgets/custom_line_seperator.dart';
import 'package:post_bet/features/authentication/presentation/manager/login_cubit/login_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

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
                      AssetsData.postBetName,
                    ),
                    const Spacer(),
                    state is GetUserLoading
                        ? Text('Hello',
                            style: Theme.of(context).textTheme.titleLarge)
                        : Text(
                            '${getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.name)}',
                            style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(
                      width: 5,
                    ),
                    getIt
                                .get<CashHelperSharedPreferences>()
                                .getData(key: ApiKey.profilePic) !=
                            null
                        ? CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 20,
                            child: ClipOval(
                              child: File(getIt
                                          .get<CashHelperSharedPreferences>()
                                          .getData(key: ApiKey.profilePic))
                                      .existsSync() // Check if the file exists
                                  ? Image.file(
                                      fit: BoxFit.fill,
                                      width: double.infinity,
                                      File(getIt
                                          .get<CashHelperSharedPreferences>()
                                          .getData(key: ApiKey.profilePic)),
                                    )
                                  : const Icon(Icons.person),
                            ),
                          )
                        : const CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 20,
                            child: Icon(Icons.person),
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
