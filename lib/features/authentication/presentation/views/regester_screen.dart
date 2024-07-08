import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:post_bet/core/functions/validation_handling.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/widgets/custom_button_large.dart';
import 'package:post_bet/core/utils/widgets/custom_form_field.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import 'package:post_bet/features/authentication/data/repo/auth_repo.dart';
import 'package:post_bet/features/authentication/presentation/manager/register_cubit/registration_cubit.dart';
import 'package:post_bet/features/authentication/presentation/views/widgets/custom_login_wave_2.dart';
import 'package:post_bet/features/settings/presentation/views/terms_conditions_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/utils/styles.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Future<void> preventScreenshot() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  @override
  void initState() {
    super.initState();
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationCubit(getIt.get<AuthRepository>()),
      child: BlocConsumer<RegistrationCubit, RegistrationState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.data),
            ));

            customGoAndDeleteNavigate(
                context: context, path: AppRouter.kVerifyEmail);
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errMessage),
            ));
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: Form(
            key: RegistrationCubit.get(context)!.formKey,
            child: SingleChildScrollView(
              child: SafeArea(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    CustomPaint(
                      size: const Size(428, 210),
                      painter: RPSCustomPainter2(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 60.h,
                          ),
                          Text(
                            AppLocalizations.of(context)!.register,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(color: kPrimaryKey),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(AppLocalizations.of(context)!.createAccount,
                              style: Styles.textStyle14Grey
                                  .copyWith(color: Colors.black)),
                          SizedBox(height: 30.h),
                          CustomFormField(
                              textInputType: TextInputType.emailAddress,
                              hintText:
                                  AppLocalizations.of(context)!.loginEmail,
                              controller: RegistrationCubit.get(context)!
                                  .emailController,
                              validationMassage: conditionOfValidationEmail),
                          SizedBox(height: 30.h),
                          CustomFormField(
                              textInputType: TextInputType.text,
                              hintText: AppLocalizations.of(context)!.name,
                              controller: RegistrationCubit.get(context)!
                                  .nameController,
                              validationMassage: conditionOfValidationName),
                          SizedBox(height: 30.h),
                          CustomFormField(
                              isEyeTrue: RegistrationCubit.get(context)!
                                  .ifPasswordVisible,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  RegistrationCubit.get(context)!
                                      .isVisiblePasswordEye();
                                },
                                icon: Icon(
                                    size: 18,
                                    color: Colors.grey,
                                    RegistrationCubit.get(context)!
                                        .iconDataPassword),
                              ),
                              textInputType: TextInputType.visiblePassword,
                              hintText: AppLocalizations.of(context)!.password,
                              controller: RegistrationCubit.get(context)!
                                  .passwordController,
                              validationMassage: conditionOfValidationPassWord),
                          SizedBox(height: 30.h),
                          CustomFormField(
                            isEyeTrue: RegistrationCubit.get(context)!
                                .ifConfirmPasswordVisible,
                            suffixIcon: IconButton(
                              color: Colors.grey,
                              onPressed: () {
                                RegistrationCubit.get(context)!
                                    .isVisibleConformPasswordEye();
                              },
                              icon: Icon(
                                  size: 18,
                                  RegistrationCubit.get(context)!
                                      .iconDataConfirmPassword),
                            ),
                            textInputType: TextInputType.visiblePassword,
                            hintText:
                                AppLocalizations.of(context)!.confirmPassword,
                            controller: RegistrationCubit.get(context)!
                                .confirmPasswordController,
                            validationMassage: (value) {
                              if (value ==
                                  RegistrationCubit.get(context)!
                                      .passwordController
                                      .text) {
                                return null;
                              } else {
                                return 'does\'t match ';
                              }
                            },
                          ),
                          SizedBox(height: 30.h),
                          state is SignUpLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: kPrimaryKey,
                                  ),
                                )
                              : CustomButtonLarge(
                                  color: kPrimaryKey,
                                  function: () {
                                    if (RegistrationCubit.get(context)!
                                        .formKey
                                        .currentState!
                                        .validate()) {
                                      RegistrationCubit.get(context)!.signUp();
                                    }
                                  },
                                  text: AppLocalizations.of(context)!.signUp,
                                  textColor: Colors.white,
                                ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.agreeTerms,
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
                            height: 40.h,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                customGoAndDeleteNavigate(
                                    context: context, path: AppRouter.kLogin);
                              },
                              child: Text(
                                  AppLocalizations.of(context)!.haveAccount,
                                  style: Styles.textStyle12Orange),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
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
      ),
    );
  }
}
