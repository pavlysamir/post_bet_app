import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/core/functions/validation_handling.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/styles.dart';
import 'package:post_bet/core/utils/widgets/Custom_AppBar_with_title.dart';
import 'package:post_bet/core/utils/widgets/custom_button_large.dart';
import 'package:post_bet/core/utils/widgets/custom_form_field.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import 'package:post_bet/core/utils/widgets/custom_line_seperator.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/features/authentication/presentation/manager/register_cubit/registration_cubit.dart';
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
                        const ProfilePhotoWidget(),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('John Smith', style: Styles.textStyle27W600),
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset(AssetsData.penIcon)),
                          ],
                        ),
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
                            controller: editProfileCubit.emailController,
                            validationMassage: conditionOfValidationEmail),
                        SizedBox(height: 30.h),
                        Text(
                          'Current password',
                          style: Styles.textStyle14Black,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomFormField(
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: kPrimaryKey,
                            ),
                            textInputType: TextInputType.text,
                            hintText: '*************',
                            controller:
                                editProfileCubit.currentPasswordController,
                            validationMassage: conditionOfValidationName),
                        SizedBox(height: 30.h),
                        Text(
                          'New password',
                          style: Styles.textStyle14Black,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomFormField(
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: kPrimaryKey,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.visibility_off),
                            ),
                            textInputType: TextInputType.visiblePassword,
                            hintText: '*************',
                            controller: editProfileCubit.newPasswordController,
                            validationMassage: conditionOfValidationPassWord),
                        SizedBox(height: 30.h),
                        Text(
                          'Confirm password',
                          style: Styles.textStyle14Black,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomFormField(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: kPrimaryKey,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              RegistrationCubit.get(context)!
                                  .isVisibleConformPasswordEye();
                            },
                            icon: const Icon(Icons.visibility_off),
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
                      ],
                    ),
                  ),
                );
              },
            )));
  }
}
