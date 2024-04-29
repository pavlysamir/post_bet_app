import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/core/utils/widgets/custom_line_seperator.dart';
import 'package:post_bet/features/authentication/presentation/manager/login_cubit/login_cubit.dart';
import '../../../constants.dart';

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
                        : Text(LoginCubit.get(context)!.userData!.name,
                            style: Theme.of(context).textTheme.titleLarge),
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
              const CustomLineSeperator(),
            ],
          ),
        );
      },
    );
  }
}
