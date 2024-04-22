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
import '../../../../../generated/l10n.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => EditProfileCubit(),
        child: BlocConsumer<EditProfileCubit, EditProfileState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            EditProfileCubit editProfileCubit = EditProfileCubit.get(context);
            return Scaffold(
                appBar:
                    CustomAppbareWithTitle(title: S.of(context).editProfile),
                bottomNavigationBar: BottomAppBar(
                  height: 70.h,
                  elevation: 0,
                  child: CustomButtonLarge(
                    color: kPrimaryKey,
                    function: () {
                      if (editProfileCubit.formKey.currentState!.validate()) {
                        customJustGoNavigate(
                            context: context, path: AppRouter.kVerifyEmail);
                      }
                    },
                    text: S.of(context).ubdate,
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
                          S.of(context).loginEmail,
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
                            hintText: S.of(context).loginEmail,
                            controller: editProfileCubit.emailController,
                            validationMassage: conditionOfValidationEmail),
                        SizedBox(height: 30.h),
                        Text(
                          S.of(context).name,
                          style: Theme.of(context).textTheme.titleLarge,
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
                            hintText: S.of(context).name,
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
        ));
  }
}
