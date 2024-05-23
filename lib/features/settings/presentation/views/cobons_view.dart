import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/features/settings/presentation/views/widgets/custom_cobon_item.dart';
import 'package:post_bet/generated/l10n.dart';

class CobonsView extends StatelessWidget {
  const CobonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: kPrimaryKey),
          ),
          title: CustomTitleText(text: S.of(context).Cobons),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  CobonItem(
                    packageType: S.of(context).discount15,
                    color: Colors.grey,
                    cobonCode: '01222',
                    cobonTitle: S.of(context).contentDiscount,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
