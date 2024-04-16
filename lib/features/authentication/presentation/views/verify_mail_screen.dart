import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:post_bet/core/utils/widgets/custom_button_large.dart';
import 'package:post_bet/core/utils/widgets/custom_form_field.dart';
import 'package:post_bet/generated/l10n.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../constants.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  State<VerifyEmailScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<VerifyEmailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
        body: Form(
      key: formKey,
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  S.of(context).verifyEmail,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: kPrimaryKey),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  S.of(context).enterCode,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 30.h),
                Text(
                  S.of(context).code,
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
                    hintText: 'xxxxxxx',
                    controller: emailController,
                    validationMassage: (value) {
                      if (value.isEmpty) {
                        return 'please enter your code';
                      }
                    }),
                SizedBox(height: 36.h),
                CustomButtonLarge(
                    text: S.of(context).submet,
                    color: kPrimaryKey,
                    textColor: Colors.white,
                    function: () {
                      if (formKey.currentState!.validate()) {}
                    }),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
