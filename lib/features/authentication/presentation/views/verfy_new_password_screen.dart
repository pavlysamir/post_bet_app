import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/widgets/custom_button_large.dart';
import 'package:post_bet/core/utils/widgets/custom_form_field.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import 'package:post_bet/features/authentication/data/repo/auth_repo.dart';
import 'package:post_bet/features/authentication/presentation/manager/login_cubit/login_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../constants.dart';

class VerifyNewPasswordEmailScreen extends StatefulWidget {
  const VerifyNewPasswordEmailScreen({Key? key}) : super(key: key);

  @override
  State<VerifyNewPasswordEmailScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<VerifyNewPasswordEmailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<AuthRepository>()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) async {
          if (state is VerifyForgetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("success"),
            ));
            customGoAndDeleteNavigate(
                context: context, path: AppRouter.kNewChangePassword);
          } else if (state is VerifyForgetPasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errMessage),
            ));
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: Form(
            key: LoginCubit.get(context)!.formVerifyForgetOtpKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.verifyEmail,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: kPrimaryKey),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      AppLocalizations.of(context)!.enterCode,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      AppLocalizations.of(context)!.code,
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
                        controller: LoginCubit.get(context)!
                            .verfyNewPasswordOtpController,
                        validationMassage: (value) {
                          if (value.isEmpty) {
                            return 'please enter your code';
                          }
                        }),
                    SizedBox(height: 36.h),
                    state is VerifyForgetPasswordLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: kPrimaryKey,
                            ),
                          )
                        : CustomButtonLarge(
                            text: AppLocalizations.of(context)!.submet,
                            color: kPrimaryKey,
                            textColor: Colors.white,
                            function: () {
                              if (LoginCubit.get(context)!
                                  .formVerifyForgetOtpKey
                                  .currentState!
                                  .validate()) {
                                LoginCubit.get(context)!.verfyNewPasswordOtp();
                              }
                            })
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
