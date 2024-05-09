import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/widgets/custom_button_large.dart';
import 'package:post_bet/core/utils/widgets/custom_form_field.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import 'package:post_bet/features/authentication/presentation/manager/login_cubit/login_cubit.dart';
import 'package:post_bet/features/authentication/presentation/views/widgets/custom_text_button_forgot_password.dart';
import 'package:post_bet/generated/l10n.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("success"),
            ),
          );
          await LoginCubit.get(context)!.getUserProfile();
          customGoAndDeleteNavigate(
              context: context, path: AppRouter.kHomeLayOut);
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Form(
          key: LoginCubit.get(context)!.formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).login,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: kPrimaryKey),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(S.of(context).welcomeBack,
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
                        controller: LoginCubit.get(context)!.emailController,
                        validationMassage: (value) {
                          if (value.isEmpty) {
                            return S.of(context).enterCode;
                          }
                        }),
                    SizedBox(height: 30.h),
                    Text(
                      S.of(context).password,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomFormField(
                      isEyeTrue: LoginCubit.get(context)!.ifPasswordVisible,
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: kPrimaryKey,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          LoginCubit.get(context)!.isVisiblePasswordEye();
                        },
                        icon: Icon(LoginCubit.get(context)!.iconData),
                      ),
                      textInputType: TextInputType.visiblePassword,
                      hintText: '*************',
                      controller: LoginCubit.get(context)!.passwordController,
                      validationMassage: (value) {
                        if (value.isEmpty) {
                          return 'please enter your password';
                        }
                      },
                    ),
                    SizedBox(height: 2.h),
                    CustomTextButtonForgotPassword(function: () {
                      customJustGoNavigate(
                          context: context, path: AppRouter.kForgotPassword);
                    }),
                    state is LoginLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: kPrimaryKey,
                          ))
                        : CustomButtonLarge(
                            text: S.of(context).loginButton,
                            color: kPrimaryKey,
                            textColor: Colors.white,
                            function: () {
                              if (LoginCubit.get(context)!
                                  .formKey
                                  .currentState!
                                  .validate()) {
                                LoginCubit.get(context)!.signIn();
                              }
                            }),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          customGoAndDeleteNavigate(
                              context: context, path: AppRouter.kRegistretion);
                        },
                        child: Text(S.of(context).dontHaveAccount,
                            style: Styles.textStyle12Orange),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    )
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
