import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

class AddNewPasswordScreen extends StatefulWidget {
  const AddNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<AddNewPasswordScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<AddNewPasswordScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  Widget build(BuildContext context) {
    var formForgetKey = GlobalKey<FormState>();

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is NewForgetPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Success"),
            ),
          );
          customGoAndDeleteNavigate(context: context, path: AppRouter.kLogin);
        } else if (state is NewForgetPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Failure"),
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Form(
          key: formForgetKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).newPassword,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: kPrimaryKey),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(S.of(context).enterNewPassword,
                        style: Styles.textStyle14Grey),
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
                      controller:
                          LoginCubit.get(context)!.newPasswordController,
                      validationMassage: (value) {
                        if (value.isEmpty) {
                          return 'please enter new your password';
                        }
                      },
                    ),
                    SizedBox(height: 36.h),
                    state is NewForgetPasswordLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: kPrimaryKey,
                          ))
                        : CustomButtonLarge(
                            text: S.of(context).resetPassword,
                            color: kPrimaryKey,
                            textColor: Colors.white,
                            function: () {
                              if (formForgetKey.currentState!.validate()) {
                                LoginCubit.get(context)!.changeForgetPassword();
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
