import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/features/settings/presentation/views/widgets/custom_cobon_item.dart';

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
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const CustomTitleText(text: 'Cobons'),
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
                  const CobonItem(
                    color: Colors.grey,
                    cobonCode: '01222',
                    cobonTitle:
                        'Free package It is a free package that includes only 10 monthly kisses Instagram + Facebook',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CobonItem(
                    color: Colors.grey.shade300,
                    cobonCode: '01222',
                    cobonTitle:
                        'Free package It is a free package that includes only 10 monthly kisses Instagram + Facebook',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CobonItem(
                    color: Colors.brown.shade300,
                    cobonCode: '01222',
                    cobonTitle:
                        'Free package It is a free package that includes only 10 monthly kisses Instagram + Facebook',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const CobonItem(
                    color: Colors.amber,
                    cobonCode: '01222',
                    cobonTitle:
                        'Free package It is a free package that includes only 10 monthly kisses Instagram + Facebook',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CobonItem(
                    color: Colors.blue.shade100,
                    cobonCode: '01222',
                    cobonTitle:
                        'Free package It is a free package that includes only 10 monthly kisses Instagram + Facebook',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
