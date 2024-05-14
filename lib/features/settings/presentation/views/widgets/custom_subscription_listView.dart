import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/features/settings/data/models/plane_model.dart';
import 'package:post_bet/features/settings/presentation/manager/settings_cubit/cubit/settings_cubit.dart';
import 'package:post_bet/features/settings/presentation/views/widgets/subscription_plan_container.dart';

class CustomListViewSubscriptionPlan extends StatelessWidget {
  const CustomListViewSubscriptionPlan({
    super.key,
    required this.count,
    required this.planModel,
  });
  final int count;
  final List<PlanModel> planModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is SubscraptionSuccess) {
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return WebViewPaynet(
          //     uri: SettingsCubit.get(context).subscriptionModel!.transactionUrl,
          //   );
          // }));
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('successfuly subscraption'),
          ));
        } else if (state is SubscraptionFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(height: 25.h);
            },
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: count,
            itemBuilder: (context, index) {
              return SubscriptionPlansCntainer(
                function: () async {
                  planModel[index].price == 0
                      ? null
                      : await SettingsCubit.get(context).subscription(
                          planId: '${planModel[index].id}', promoCode: '');
                },
                price: "${planModel[index].price}\$",
                countPosts:
                    'number of posts : ${planModel[index].numberOfPosts}',
                //description: '.${S.of(context).shareAllPlatform}',
                typePlan: planModel[index].name,
                platForms:
                    'FaceBook : ${planModel[index].facebook} , Twitter : ${planModel[index].twitter} , Instagram : ${planModel[index].instagram} , TikTok : ${planModel[index].tiktok} , pinterest : ${planModel[index].pinterest} , linkedin : ${planModel[index].linkedin} , reddit : ${planModel[index].reddit} ',
              );
            });
      },
    );
  }
}
