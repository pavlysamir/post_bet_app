import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/features/settings/presentation/views/widgets/custom_cobon_item.dart';

class CobonsView extends StatelessWidget {
  const CobonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            const CustomTitleText(text: 'Cobons'),
            SizedBox(
              height: 20.h,
            ),
            const CobonItem(
              cobonCode: '01222',
              cobonTitle:
                  'Free package It is a free package that includes only 10 monthly kisses Instagram + Facebook',
            ),
          ],
        ),
      ),
    ));
  }
}
