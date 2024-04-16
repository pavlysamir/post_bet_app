import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/widgets/Custom_AppBar.dart';
import 'package:post_bet/core/utils/widgets/custom_line_seperator.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/features/home/presentation/views/widgets/custom_description_post_field.dart';
import 'package:post_bet/features/home/presentation/views/widgets/custom_history_posts_list_view.dart';
import 'package:post_bet/generated/l10n.dart';

import '../../../../core/utils/widgets/custom_button_large.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  var formKey = GlobalKey<FormState>();
  TextEditingController addPostController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SliverToBoxAdapter(
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(
                  name: 'Bavly sa',
                  image: 'd',
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomTitleText(text: S.of(context).editProfile),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomDescriptionPostField(
                      // prefexIcon: Image.asset(
                      //   AssetsData.penIcon,
                      // ),
                      controller: addPostController,
                      validationMassage: (value) {
                        if (value.isEmpty) {
                          return 'please write anything';
                        }
                      },
                      hintText: S.of(context).typeAnyThing,
                      textInputType: TextInputType.text),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 44),
                    child: CustomButtonLarge(
                        text: S.of(context).share,
                        color: kPrimaryKey,
                        textColor: Colors.white,
                        function: () {})),
                SizedBox(
                  height: 34.h,
                ),
                const CustomLineSeperator(),
                SizedBox(
                  height: 34.h,
                ),
                CustomTitleText(text: S.of(context).history),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      ),
      const SliverToBoxAdapter(
        child: CustomHistoryPostsListView(),
      )
    ]));
  }
}
