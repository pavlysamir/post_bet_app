import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/core/utils/styles.dart';
import 'package:post_bet/core/utils/widgets/custom_button_large.dart';
import 'package:post_bet/core/utils/widgets/custom_form_field.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/generated/l10n.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key, required this.text, required this.price});
  final String text;
  final String price;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameCardController = TextEditingController();
    TextEditingController numbaerCardController = TextEditingController();
    TextEditingController expireDateController = TextEditingController();
    TextEditingController cvvController = TextEditingController();
    TextEditingController zipController = TextEditingController();

    var formKey = GlobalKey<FormState>();
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
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              CustomTitleText(text: text),
              SizedBox(height: 40.h),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AssetsData.visa,
                ),
              ),
              SizedBox(height: 40.h),
              CustomTitleText(text: S.of(context).paymentAmount),
              SizedBox(height: 12.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  price,
                  style: Styles.textStyle48Orange,
                ),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: Text(
                  S.of(context).nameCard,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: CustomFormField(
                    textInputType: TextInputType.emailAddress,
                    hintText: S.of(context).name,
                    controller: nameCardController,
                    validationMassage: (value) {
                      if (value.isEmpty) {
                        return S.of(context).nameCard;
                      }
                    }),
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: Text(
                  S.of(context).cardNumber,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: CustomFormField(
                    textInputType: TextInputType.emailAddress,
                    hintText: 'xxxx-xxxx-xxxx-xxxx',
                    controller: numbaerCardController,
                    validationMassage: (value) {
                      if (value.isEmpty) {
                        return S.of(context).nameCard;
                      }
                    }),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          S.of(context).expireData,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          width: 100,
                          child: CustomFormField(
                              textInputType: TextInputType.emailAddress,
                              hintText: 'MM/VV',
                              controller: expireDateController,
                              validationMassage: (value) {
                                if (value.isEmpty) {
                                  return 'add date';
                                }
                              }),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          S.of(context).cvv,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          width: 100,
                          child: CustomFormField(
                              textInputType: TextInputType.emailAddress,
                              hintText: '*****',
                              controller: cvvController,
                              validationMassage: (value) {
                                if (value.isEmpty) {
                                  return 'add cvv';
                                }
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: Text(
                  S.of(context).zip,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: CustomFormField(
                    textInputType: TextInputType.emailAddress,
                    hintText: 'xxxx',
                    controller: zipController,
                    validationMassage: (value) {
                      if (value.isEmpty) {
                        return S.of(context).nameCard;
                      }
                    }),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: CustomButtonLarge(
                    text: S.of(context).pay,
                    color: kPrimaryKey,
                    textColor: Colors.white,
                    function: () {
                      if (formKey.currentState!.validate()) {
                        if (kDebugMode) {
                          print('kooko');
                        }
                      }
                    }),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
