import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/widgets/custom_button_large.dart';
import 'package:post_bet/core/utils/widgets/custom_form_field.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import 'package:post_bet/features/authentication/presentation/manager/login_cubit/login_cubit.dart';
import 'package:post_bet/generated/l10n.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../constants.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ForgetPasswordScreen> {
  @override
  void initState() {
    super.initState();
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("check your email"),
            ),
          );
          customJustGoNavigate(
              context: context, path: AppRouter.kVerifyNewChangePassword);
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Form(
          key: LoginCubit.get(context)!.formVerifyEmailForgetOtpKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).registerPassword,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: kPrimaryKey),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(S.of(context).enterEmail,
                        style: Styles.textStyle14Grey),
                    SizedBox(height: 30.h),
                    Text(
                      S.of(context).loginEmail,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomFormField(
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: kPrimaryKey,
                        ),
                        textInputType: TextInputType.emailAddress,
                        hintText: S.of(context).loginEmail,
                        controller: LoginCubit.get(context)!
                            .emailForForgetPasswordController,
                        validationMassage: (value) {
                          if (value.isEmpty) {
                            return 'please enter your email';
                          }
                        }),
                    SizedBox(height: 36.h),
                    state is ForgetPasswordLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: kPrimaryKey,
                          ))
                        : CustomButtonLarge(
                            text: S.of(context).resetPassword,
                            color: kPrimaryKey,
                            textColor: Colors.white,
                            function: () {
                              if (LoginCubit.get(context)!
                                  .formVerifyEmailForgetOtpKey
                                  .currentState!
                                  .validate()) {
                                LoginCubit.get(context)!.forgetPassword();
                              }
                            }),
                  ],
                ),
              ),
            ),
          ),
        ));
      },
    );
  }
}
