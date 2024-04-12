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
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    IconData iconData = Icons.visibility_off;
    bool ifPasswordVisible = true;
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginIsPasswordVisibleEye) {
            ifPasswordVisible = !ifPasswordVisible;
            iconData =
                ifPasswordVisible ? Icons.visibility_off : Icons.remove_red_eye;
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: Form(
            key: formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: Styles.textStyle32Orange,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text('Welcome back to postbet',
                          style: Styles.textStyle14Grey),
                      SizedBox(height: 30.h),
                      Text(
                        'Email',
                        style: Styles.textStyle14Black,
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
                          validationMassage: (value) {
                            if (value.isEmpty) {
                              return 'please enter your email';
                            }
                          }),
                      SizedBox(height: 30.h),
                      Text(
                        'Password',
                        style: Styles.textStyle14Black,
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
                            LoginCubit.get(context)!.isVisiblePasswordEye();
                          },
                          icon: Icon(iconData),
                        ),
                        textInputType: TextInputType.visiblePassword,
                        hintText: '*************',
                        controller: passwordController,
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
                      CustomButtonLarge(
                          text: 'Login',
                          color: kPrimaryKey,
                          textColor: Colors.white,
                          function: () {
                            if (formKey.currentState!.validate()) {
                              customGoAndDeleteNavigate(
                                  context: context,
                                  path: AppRouter.kHomeLayOut);
                            }
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            customGoAndDeleteNavigate(
                                context: context,
                                path: AppRouter.kRegistretion);
                          },
                          child: Text('Don’t have account ? register now',
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
      ),
    );
  }
}
