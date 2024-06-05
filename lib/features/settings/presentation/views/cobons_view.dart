import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/features/settings/presentation/manager/settings_cubit/cubit/settings_cubit.dart';
import 'package:post_bet/features/settings/presentation/views/widgets/custom_cobon_item.dart';
import 'package:post_bet/generated/l10n.dart';

class CobonsView extends StatelessWidget {
  const CobonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, color: kPrimaryKey),
              ),
              title: CustomTitleText(text: S.of(context).cobons),
            ),
            body: state is GetPromocodesSuccess
                ? SafeArea(
                    child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: ListView.separated(
                          clipBehavior: Clip.none,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 16.h);
                          },
                          itemCount:
                              SettingsCubit.get(context).promoCode.length,
                          itemBuilder: (context, index) {
                            return CobonItem(
                              packageType:
                                  '${SettingsCubit.get(context).promoCode[index].percentage}% ${S.of(context).discount}',
                              color: Colors.grey,
                              cobonCode: SettingsCubit.get(context)
                                  .promoCode[index]
                                  .promoCode,
                              cobonTitle: SettingsCubit.get(context)
                                  .promoCode[index]
                                  .expirationDate,
                            );
                          },
                        )),
                  )
                : const Center(
                    child: CircularProgressIndicator(color: kPrimaryKey),
                  ));
      },
    );
  }
}
