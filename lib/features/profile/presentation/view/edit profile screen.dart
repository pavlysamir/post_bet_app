import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/functions/validation_handling.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:post_bet/core/utils/widgets/Custom_AppBar_with_title.dart';
import 'package:post_bet/core/utils/widgets/custom_button_large.dart';
import 'package:post_bet/core/utils/widgets/custom_form_field.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import 'package:post_bet/core/utils/widgets/custom_line_seperator.dart';
import 'package:post_bet/core/utils/widgets/pop_up_dialog.dart';
import 'package:post_bet/features/profile/presentation/manager/edit%20profile%20cubit.dart';
import 'package:post_bet/features/profile/presentation/manager/edit%20profile%20state.dart';
import 'package:post_bet/features/profile/presentation/view/widgets/profile%20photo%20widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is UpdateUserDataSuccess) {
          showDialog(
            context: context,
            builder: (BuildContext context) => PopUpDialogOneButton(
              context: context,
              function: () {
                customGoAndDeleteNavigate(
                    context: context, path: AppRouter.kHomeLayOut);
                Navigator.pop(context);
              },
              title: 'Saved',
              subTitle: '',
              colorButton1: kPrimaryKey,
              textColortcolor1: Colors.white,
              textbtn: 'Back to home',
            ),
          );
        } else if (state is UpdateUserDataFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        EditProfileCubit editProfileCubit = EditProfileCubit.get(context);
        editProfileCubit.emailController.text =
            getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.email);

        editProfileCubit.nameController.text =
            getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.name);
        return Scaffold(
            appBar: CustomAppbareWithTitle(
                title: AppLocalizations.of(context)!.editProfile),
            bottomNavigationBar: BottomAppBar(
              height: 70.h,
              elevation: 0,
              child: state is UpdateUserDataLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: kPrimaryKey,
                    ))
                  : CustomButtonLarge(
                      color: kPrimaryKey,
                      function: () {
                        if (editProfileCubit.formKey.currentState!.validate()) {
                          EditProfileCubit.get(context).updateUserData();
                          // customJustGoNavigate(
                          //     context: context, path: AppRouter.kVerifyEmail);
                        }
                      },
                      text: AppLocalizations.of(context)!.ubdate,
                      textColor: Colors.white,
                    ),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Form(
                key: editProfileCubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomLineSeperator(),
                    SizedBox(height: 20.h),
                    //Profile photo
                    ProfilePhotoWidget(
                      editProfileCubit: editProfileCubit,
                    ),
                    SizedBox(height: 20.h),

                    CustomFormField(
                        readOnly: true,
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: kPrimaryKey,
                        ),
                        textInputType: TextInputType.emailAddress,
                        hintText:
                            '${getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.email)}',
                        controller: editProfileCubit.emailController,
                        validationMassage: conditionOfValidationEmail),
                    SizedBox(height: 30.h),

                    CustomFormField(
                        prefixIcon: const Icon(
                          Icons.account_circle_rounded,
                          color: kPrimaryKey,
                        ),
                        textInputType: TextInputType.text,
                        hintText:
                            '${getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.name)}',
                        controller: editProfileCubit.nameController,
                        validationMassage: conditionOfValidationName),
                    SizedBox(height: 30.h),

                    SizedBox(
                      height: 30.h,
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
