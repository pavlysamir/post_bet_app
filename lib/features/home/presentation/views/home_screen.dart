import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/styles.dart';
import 'package:post_bet/core/utils/widgets/custom_button_large_dart';
import 'package:post_bet/features/home/presentation/views/widgets/Custom_AppBar.dart';
import 'package:post_bet/features/home/presentation/views/widgets/custom_description_post_field.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  var formKey = GlobalKey<FormState>();
  TextEditingController addPostController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHomeAppBar(
                name: 'Bavly sa',
                image: 'd',
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Create a post',
                  style: Styles.textStyle24BoldBlack,
                ),
              ),
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
                    hintText: 'Type anything here ',
                    textInputType: TextInputType.text),
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomButtonLarge(
                    text: 'Share',
                    color: kPrimaryKey,
                    textColor: Colors.white,
                    function: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
