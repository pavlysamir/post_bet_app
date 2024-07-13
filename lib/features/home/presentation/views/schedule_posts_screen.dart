import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/widgets/custom_button_small.dart';
import 'package:post_bet/core/utils/widgets/custom_form_field.dart';
import 'package:post_bet/features/home/presentation/manager/add_post_cubit/cubit/add_post_cubit.dart';

class SchedulePostsScreen extends StatelessWidget {
  const SchedulePostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPostCubit, AddPostState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.home),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: AddPostCubit.get(context).formSchadulaKey,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.history,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 20.h),
                      CustomFormField(
                          textInputType: TextInputType.emailAddress,
                          hintText: '12/12/12',
                          controller: AddPostCubit.get(context)
                              .addSchadulaPostController,
                          validationMassage: (value) {
                            if (value.isEmpty) {
                              return AppLocalizations.of(context)!.enterCode;
                            }
                          }),
                      SizedBox(height: 20.h),
                      Text(
                        AppLocalizations.of(context)!.cvv,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 20.h),
                      CustomFormField(
                          textInputType: TextInputType.emailAddress,
                          hintText: '-- : --',
                          controller: AddPostCubit.get(context)
                              .addSchadulaPostController,
                          validationMassage: (value) {
                            if (value.isEmpty) {
                              return AppLocalizations.of(context)!.enterCode;
                            }
                          }),
                      SizedBox(height: 20.h),
                      Center(
                        child: CustomButtonSmall(
                          text: AppLocalizations.of(context)!.zip,
                          borderColor: kPrimaryKey,
                          function: () {},
                          color: kPrimaryKey,
                          textColortcolor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        AppLocalizations.of(context)!.pay,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
