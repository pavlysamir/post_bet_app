import 'package:flutter/material.dart';
import 'package:post_bet/core/functions/validation_handling.dart';
import 'package:post_bet/core/utils/widgets/custom_form_field.dart';
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
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Email',
                  style: Styles.textStyle14Black,
                ),
                const SizedBox(
                  height: 10,
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
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Name',
                  style: Styles.textStyle14Black,
                ),
                const SizedBox(
                  height: 10,
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
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Password',
                  style: Styles.textStyle14Black,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormField(
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

                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Confirm password',
                  style: Styles.textStyle14Black,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormField(
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

                const SizedBox(
                  height: 30,
                ),

                // ConditionalBuilder(
                //   condition: state is! RegisterCreateUserLoadingState,
                //   builder: (context) => SizedBox(
                //     width: MediaQuery.of(context).size.width * 0.35,
                //     height: MediaQuery.of(context).size.height * 0.04,
                //     child: CustomButton(
                //       color: kPrimaryKey,
                //       text: 'Sign Up',
                //       textColor: Colors.white,
                //       function: () {
                //         if (formKey.currentState!.validate()) {
                //           // GoRouter.of(context).go(AppRouter.kHomeView);
                //           RegistrationCubit.get(context)!.userRegister(
                //             name: nameController.text,
                //             email: emailController.text,
                //             password: passwordController.text,
                //             phone: phoneController.text,
                //           );
                //         }
                //       },
                //     ),
                //   ),
                //   fallback: (context) => const Center(
                //     child: CircularProgressIndicator(),
                //   ),
                // ),

                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Terms of Service',
                        style: Styles.textStyle12.copyWith(
                          color: kPrimaryKey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const Text('By login you agree to our'),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
