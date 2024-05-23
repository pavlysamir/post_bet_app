import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/functions/validation_handling.dart';
import 'package:post_bet/core/utils/widgets/Custom_AppBar_with_title.dart';
import 'package:post_bet/core/utils/widgets/custom_button_large.dart';
import 'package:post_bet/core/utils/widgets/custom_form_field.dart';
import 'package:post_bet/core/utils/widgets/custom_line_seperator.dart';
import 'package:post_bet/features/settings/presentation/manager/settings_cubit/cubit/settings_cubit.dart';
import 'package:post_bet/generated/l10n.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbareWithTitle(title: S.of(context).changePassword),
      bottomNavigationBar: BottomAppBar(
        height: 70.h,
        elevation: 0,
        child: CustomButtonLarge(
          color: kPrimaryKey,
          function: () {
            if (SettingsCubit.get(context).formKey.currentState!.validate()) {
              SettingsCubit.get(context).changePassword();
              // customJustGoNavigate(
              //     context: context, path: AppRouter.kVerifyEmail);
            }
          },
          text: S.of(context).ubdate,
          textColor: Colors.white,
        ),
      ),
      body: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccess) {
            SettingsCubit.get(context).confirmPasswordController.clear();
            SettingsCubit.get(context).newPasswordController.clear();
            SettingsCubit.get(context).currentPasswordController.clear();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("success"),
              ),
            );
          } else if (state is ChangePasswordFailure) {
            SettingsCubit.get(context).confirmPasswordController.clear();
            SettingsCubit.get(context).newPasswordController.clear();

            SettingsCubit.get(context).currentPasswordController.clear();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Try later"),
              ),
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: SettingsCubit.get(context).isLoading,
            progressIndicator:
                const CircularProgressIndicator(color: kPrimaryKey),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Form(
                key: SettingsCubit.get(context).formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomLineSeperator(),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      S.of(context).currentPassword,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomFormField(
                        isEyeTrue:
                            SettingsCubit.get(context).isCurrentPasswordVisible,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: kPrimaryKey,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            SettingsCubit.get(context)
                                .changeCurrentPasswordVisibility();
                          },
                          icon: Icon(!SettingsCubit.get(context)
                                  .isCurrentPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        textInputType: TextInputType.text,
                        hintText: '*************',
                        controller: SettingsCubit.get(context)
                            .currentPasswordController,
                        validationMassage: conditionOfValidationName),
                    SizedBox(height: 30.h),
                    Text(S.of(context).newPassword,
                        style: Theme.of(context).textTheme.titleLarge),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomFormField(
                        isEyeTrue:
                            SettingsCubit.get(context).isNewPasswordVisible,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: kPrimaryKey,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            SettingsCubit.get(context)
                                .changeNewPasswordVisibility();
                          },
                          icon: Icon(
                              !SettingsCubit.get(context).isNewPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                        ),
                        textInputType: TextInputType.visiblePassword,
                        hintText: '*************',
                        controller:
                            SettingsCubit.get(context).newPasswordController,
                        validationMassage: conditionOfValidationPassWord),
                    SizedBox(height: 30.h),
                    Text(
                      S.of(context).confirmPassword,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomFormField(
                      isEyeTrue:
                          SettingsCubit.get(context).isConfirmPasswordVisible,
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: kPrimaryKey,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          SettingsCubit.get(context)
                              .changeConfirmPasswordVisibility();
                        },
                        icon: Icon(
                            !SettingsCubit.get(context).isConfirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                      ),
                      textInputType: TextInputType.visiblePassword,
                      hintText: '*************',
                      controller:
                          SettingsCubit.get(context).confirmPasswordController,
                      validationMassage: (value) {
                        if (value ==
                            SettingsCubit.get(context)
                                .newPasswordController
                                .text) {
                          return null;
                        } else {
                          return 'does\'t match ';
                        }
                      },
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
