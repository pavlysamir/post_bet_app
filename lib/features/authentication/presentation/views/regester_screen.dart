import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:post_bet/core/functions/validation_handling.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/widgets/custom_button_large.dart';
import 'package:post_bet/core/utils/widgets/custom_form_field.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import 'package:post_bet/features/authentication/presentation/manager/register_cubit/registration_cubit.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/utils/styles.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  IconData iconDataPassword = Icons.visibility_off;

  IconData iconDataConfirmPassword = Icons.visibility_off;

  bool ifPasswordVisible = true;

  bool ifConfirmPasswordVisible = true;

  var formKey = GlobalKey<FormState>();

  // Future<void> preventScreenshot() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationCubit(),
      child: BlocConsumer<RegistrationCubit, RegistrationState>(
        listener: (context, state) {
          if (state is RegisterIsPasswordVisibleEye) {
            ifPasswordVisible = !ifPasswordVisible;
            iconDataPassword =
                ifPasswordVisible ? Icons.visibility_off : Icons.remove_red_eye;
          } else if (state is RegisterIsConfirmPasswordVisibleEye) {
            ifConfirmPasswordVisible = !ifConfirmPasswordVisible;
            iconDataConfirmPassword = ifConfirmPasswordVisible
                ? Icons.visibility_off
                : Icons.remove_red_eye;
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: Form(
            key: formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(44.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: kPrimaryKey),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text('Create an account to start using postbet',
                          style: Styles.textStyle14Grey),
                      SizedBox(height: 30.h),
                      Text(
                        'Email',
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
                          hintText: 'Email',
                          controller: emailController,
                          validationMassage: conditionOfValidationEmail),
                      SizedBox(height: 30.h),
                      Text(
                        'Name',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomFormField(
                          prefixIcon: const Icon(
                            Icons.account_circle_rounded,
                            color: kPrimaryKey,
                          ),
                          textInputType: TextInputType.text,
                          hintText: 'Name',
                          controller: nameController,
                          validationMassage: conditionOfValidationName),
                      SizedBox(height: 30.h),
                      Text(
                        'Password',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomFormField(
                          isEyeTrue: ifPasswordVisible,
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: kPrimaryKey,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              RegistrationCubit.get(context)!
                                  .isVisiblePasswordEye();
                            },
                            icon: Icon(iconDataPassword),
                          ),
                          textInputType: TextInputType.visiblePassword,
                          hintText: '*************',
                          controller: passwordController,
                          validationMassage: conditionOfValidationPassWord),
                      SizedBox(height: 30.h),
                      Text(
                        'Confirm password',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomFormField(
                        isEyeTrue: ifConfirmPasswordVisible,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: kPrimaryKey,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            RegistrationCubit.get(context)!
                                .isVisibleConformPasswordEye();
                          },
                          icon: Icon(iconDataConfirmPassword),
                        ),
                        textInputType: TextInputType.visiblePassword,
                        hintText: '*************',
                        controller: confirmPasswordController,
                        validationMassage: (value) {
                          if (value == passwordController.text) {
                            return null;
                          } else {
                            return 'does\'t match ';
                          }
                        },
                      ),
                      SizedBox(height: 30.h),
                      CustomButtonLarge(
                        color: kPrimaryKey,
                        function: () {
                          if (formKey.currentState!.validate()) {
                            customJustGoNavigate(
                                context: context, path: AppRouter.kVerifyEmail);
                          }
                        },
                        text: 'Sign Up',
                        textColor: Colors.white,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            customGoAndDeleteNavigate(
                                context: context, path: AppRouter.kLogin);
                          },
                          child: Text('Already have an account',
                              style: Styles.textStyle12Orange),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
