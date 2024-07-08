import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/widgets/custom_button_large.dart';
import 'package:post_bet/core/utils/widgets/custom_form_field.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import 'package:post_bet/features/authentication/presentation/manager/login_cubit/login_cubit.dart';
import 'package:post_bet/features/authentication/presentation/views/widgets/custom_login_clip_wave.dart';
import 'package:post_bet/features/authentication/presentation/views/widgets/custom_text_button_forgot_password.dart';
import 'package:post_bet/features/settings/presentation/views/terms_conditions_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
          await LoginCubit.get(context)!.getUserProfile().then((value) {
            //SettingsCubit.get(context).mySubscription();
          });
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        } else if (state is GetUserSuccess) {
          customGoAndDeleteNavigate(
              context: context, path: AppRouter.kHomeLayOut);
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Form(
          key: LoginCubit.get(context)!.formKey,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  CustomPaint(
                    size: const Size(430, 194),
                    painter: RPSCustomPainter(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!.login,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: kPrimaryKey),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(AppLocalizations.of(context)!.welcomeBack,
                            style: Styles.textStyle16Black),
                        SizedBox(height: 41.h),
                        CustomFormField(
                            // prefixIcon: const Icon(
                            //   Icons.email_outlined,
                            //   color: kPrimaryKey,
                            // ),
                            textInputType: TextInputType.emailAddress,
                            hintText: AppLocalizations.of(context)!.loginEmail,
                            controller:
                                LoginCubit.get(context)!.emailController,
                            validationMassage: (value) {
                              if (value.isEmpty) {
                                return AppLocalizations.of(context)!.enterCode;
                              }
                            }),
                        SizedBox(height: 18.h),
                        CustomFormField(
                          isEyeTrue: LoginCubit.get(context)!.ifPasswordVisible,
                          // prefixIcon: const Icon(
                          //   Icons.lock,
                          //   color: kPrimaryKey,
                          // ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              LoginCubit.get(context)!.isVisiblePasswordEye();
                            },
                            icon: Icon(LoginCubit.get(context)!.iconData),
                          ),
                          textInputType: TextInputType.visiblePassword,
                          hintText: '*************',
                          controller:
                              LoginCubit.get(context)!.passwordController,
                          validationMassage: (value) {
                            if (value.isEmpty) {
                              return 'please enter your password';
                            }
                          },
                        ),
                        SizedBox(height: 2.h),
                        CustomTextButtonForgotPassword(function: () {
                          customJustGoNavigate(
                              context: context,
                              path: AppRouter.kForgotPassword);
                        }),
                        SizedBox(height: 45.h),
                        state is LoginLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: kPrimaryKey,
                              ))
                            : CustomButtonLarge(
                                text: AppLocalizations.of(context)!.loginButton,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.agreeTerms,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            const SizedBox(
                              width: 1,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return TermsAndConditionsScreen();
                                }));
                              },
                              child: Text(
                                  AppLocalizations.of(context)!
                                      .termsAndConditions,
                                  style: Styles.textStyle14Orange),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            customGoAndDeleteNavigate(
                                context: context,
                                path: AppRouter.kRegistretion);
                          },
                          child: Text(
                              AppLocalizations.of(context)!.dontHaveAccount,
                              style: Styles.textStyle12Orange),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
