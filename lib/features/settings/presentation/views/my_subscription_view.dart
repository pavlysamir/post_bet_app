import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/features/settings/presentation/manager/settings_cubit/cubit/settings_cubit.dart';
import 'package:post_bet/features/settings/presentation/views/widgets/my_subscription_listView.dart';
import 'package:post_bet/generated/l10n.dart';

class MySubscriptionView extends StatelessWidget {
  const MySubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) async {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios, color: kPrimaryKey),
            ),
            title: CustomTitleText(text: S.of(context).subscribe),
          ),
          body: state is MySubscraptionLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: kPrimaryKey,
                ))
              : SettingsCubit.get(context).mySubscriptionList.isEmpty
                  ? Center(child: Text(S.of(context).noSubscriptions))
                  : state is MySubscraptionSuccess
                      ? SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 40.h),
                              CustomTitleText(
                                  text: S.of(context).subscribePlan),
                              SizedBox(height: 40.h),
                              CustomListViewMySubscriptionPlan(
                                count: SettingsCubit.get(context)
                                    .mySubscriptionList
                                    .length,
                                myListSubscrabtiopn: SettingsCubit.get(context)
                                    .mySubscriptionList,
                              ),
                              SizedBox(
                                height: 25.h,
                              )
                            ],
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                          color: kPrimaryKey,
                        )),
        );
      },
    );
  }
}
