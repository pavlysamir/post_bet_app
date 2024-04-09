import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/functions/snacck_bar.dart';
import 'package:post_bet/core/functions/validation_handling.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/widgets/custom_button_large_dart';
import 'package:post_bet/core/utils/widgets/custom_form_field.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  IconData iconData = Icons.visibility_off;
  bool ifPasswordVisible = true;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                  style: Styles.textStyle32Orange,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text('Create an account to start using postbet',
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
                    validationMassage: conditionOfValidationName),
                SizedBox(height: 30.h),
                Text(
                  'Name',
                  style: Styles.textStyle14Black,
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
                    validationMassage: conditionOfValidationEmail),
                SizedBox(height: 30.h),
                Text(
                  'Password',
                  style: Styles.textStyle14Black,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomFormField(
                    isEyeTrue: true,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: kPrimaryKey,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.visibility_off,
                      ),
                    ),
                    textInputType: TextInputType.visiblePassword,
                    hintText: '*************',
                    controller: passwordController,
                    validationMassage: conditionOfValidationPhone),
                SizedBox(height: 30.h),
                Text(
                  'Confirm password',
                  style: Styles.textStyle14Black,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomFormField(
                    isEyeTrue: true,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: kPrimaryKey,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.visibility_off,
                      ),
                    ),
                    textInputType: TextInputType.phone,
                    hintText: '*************',
                    controller: confirmPasswordController,
                    validationMassage: conditionOfValidationPhone),
                SizedBox(height: 30.h),
                CustomButtonLarge(
                  color: kPrimaryKey,
                  function: () {
                    if (formKey.currentState!.validate()) {
                      showSnackBar(
                          color: kPrimaryKey,
                          message: 'done',
                          context: context);
                    }
                    ;
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
                          context: context, path: AppRouter.kLoginView);
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
  }
}
