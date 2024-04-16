import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/core/functions/validation_handling.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/widgets/Custom_AppBar_with_title.dart';
import 'package:post_bet/core/utils/widgets/custom_button_large.dart';
import 'package:post_bet/core/utils/widgets/custom_form_field.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import 'package:post_bet/core/utils/widgets/custom_line_seperator.dart';
import 'package:post_bet/features/profile/presentation/manager/edit%20profile%20cubit.dart';
import 'package:post_bet/features/profile/presentation/manager/edit%20profile%20state.dart';
import 'package:post_bet/features/profile/presentation/view/widgets/profile%20photo%20widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbareWithTitle(title: 'Edit Profile'),
        body: BlocProvider<EditProfileCubit>(
            create: (context) => EditProfileCubit(),
            child: BlocConsumer<EditProfileCubit, EditProfileState>(
              listener: (context, state) {},
              builder: (context, state) {
                EditProfileCubit editProfileCubit =
                    EditProfileCubit.get(context);
                return SingleChildScrollView(
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
                        //edit name
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('John Smith',
                                style:
                                    Theme.of(context).textTheme.displaySmall),
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset(AssetsData.penIcon)),
                          ],
                        ),
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
                            controller: editProfileCubit.emailController,
                            validationMassage: conditionOfValidationEmail),
                        SizedBox(height: 30.h),
                        Text(
                          'Current password',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomFormField(
                            isEyeTrue:
                                editProfileCubit.isCurrentPasswordVisible,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: kPrimaryKey,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                editProfileCubit
                                    .changeCurrentPasswordVisibility();
                              },
                              icon: Icon(
                                  !editProfileCubit.isCurrentPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                            ),
                            textInputType: TextInputType.text,
                            hintText: '*************',
                            controller:
                                editProfileCubit.currentPasswordController,
                            validationMassage: conditionOfValidationName),
                        SizedBox(height: 30.h),
                        Text('New password',
                            style: Theme.of(context).textTheme.titleLarge),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomFormField(
                            isEyeTrue: editProfileCubit.isNewPasswordVisible,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: kPrimaryKey,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                editProfileCubit.changeNewPasswordVisibility();
                              },
                              icon: Icon(!editProfileCubit.isNewPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            textInputType: TextInputType.visiblePassword,
                            hintText: '*************',
                            controller: editProfileCubit.newPasswordController,
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
                          isEyeTrue: editProfileCubit.isConfirmPasswordVisible,
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: kPrimaryKey,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              editProfileCubit
                                  .changeConfirmPasswordVisibility();
                            },
                            icon: Icon(
                                !editProfileCubit.isConfirmPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                          ),
                          textInputType: TextInputType.visiblePassword,
                          hintText: '*************',
                          controller:
                              editProfileCubit.confirmPasswordController,
                          validationMassage: (value) {
                            if (value ==
                                editProfileCubit.newPasswordController.text) {
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
                            if (editProfileCubit.formKey.currentState!
                                .validate()) {
                              customJustGoNavigate(
                                  context: context,
                                  path: AppRouter.kVerifyEmail);
                            }
                          },
                          text: 'Update',
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: 30.h,
                        )
                      ],
                    ),
                  ),
                );
              },
            )));
  }
}
