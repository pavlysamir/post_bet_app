import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/widgets/Custom_AppBar_with_title.dart';
import 'package:post_bet/core/utils/widgets/custom_button_large.dart';
import 'package:post_bet/core/utils/widgets/custom_form_field.dart';
import 'package:post_bet/features/settings/presentation/manager/settings_cubit/cubit/settings_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class EnterPromoView extends StatefulWidget {
  const EnterPromoView({
    super.key,
    required this.planeId,
  });
  final String planeId;

  @override
  State<EnterPromoView> createState() => _EnterPromoViewState();
}

class _EnterPromoViewState extends State<EnterPromoView> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SettingsCubit.get(context).promocodeController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    String btnTxt = AppLocalizations.of(context)!.submet;
    return Scaffold(
        appBar: CustomAppbareWithTitle(
            title: AppLocalizations.of(context)!.enterPromo),
        body: BlocConsumer<SettingsCubit, SettingsState>(
            listener: (context, state) async {
          if (state is GetPromocodesFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Failure"),
              ),
            );
          } else if (state is GetPromocodesDetailsSuccess) {
            //SettingsCubit.get(context).promocodeController.text == '';
          } else if (state is SubscraptionSuccess) {
            launchUrl(
                Uri.parse(
                  SettingsCubit.get(context).subscriptionModel!.transactionUrl,
                ),
                mode: LaunchMode.externalApplication);
            await SettingsCubit.get(context).mySubscription();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('successfuly subscraption'),
            ));
          } else if (state is MySubscraptionSuccess) {
            SettingsCubit.get(context).getPlans();
          } else if (state is SubscraptionFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
              ),
            );
          }
        }, builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: SettingsCubit.get(context).formKeyPromoCode,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    AppLocalizations.of(context)!.enterPromo,
                    style: Theme.of(context).textTheme.displayLarge,
                  )),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomFormField(
                      hintText: '****',
                      controller:
                          SettingsCubit.get(context).promocodeController,
                      validationMassage: (value) {
                        if (value.isEmpty) {
                          return 'please enter new promo code';
                        }
                      },
                      textInputType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  state is GetPromocodesDetailsSuccess
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      //offset: const Offset(0, 2), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        'Plan Price : ${SettingsCubit.get(context).myPromoCodeDetails!.planPrice}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Text(
                                        'Discount : ${SettingsCubit.get(context).myPromoCodeDetails!.discount}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Text(
                                        'Price after discount : ${SettingsCubit.get(context).myPromoCodeDetails!.priceAfterDiscount}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.symmetric(
                                      //       horizontal: 20),
                                      //   child: CustomButtonLarge(
                                      //       text:AppLocalizations.of(context)!.doneSubscribe,
                                      //       color: kPrimaryKey,
                                      //       textColor: Colors.white,
                                      //       function: () async {
                                      //         if (SettingsCubit.get(context)
                                      //             .formKeyPromoCode
                                      //             .currentState!
                                      //             .validate()) {
                                      //           await SettingsCubit.get(context)
                                      //               .subscription(
                                      //                   planId: planeId,
                                      //                   promoCode: SettingsCubit
                                      //                           .get(context)
                                      //                       .promocodeController
                                      //                       .text);
                                      //         }
                                      //       }),
                                      // ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                    ])),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: 30.h,
                  ),
                  state is GetPromocodesDetailsLoading ||
                          state is SubscraptionLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: kPrimaryKey,
                          ),
                        )
                      : state is GetPromocodesDetailsSuccess
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: CustomButtonLarge(
                                  text: AppLocalizations.of(context)!
                                      .doneSubscribe,
                                  color: kPrimaryKey,
                                  textColor: Colors.white,
                                  function: () async {
                                    if (SettingsCubit.get(context)
                                        .formKeyPromoCode
                                        .currentState!
                                        .validate()) {
                                      if (SettingsCubit.get(context)
                                          .formKeyPromoCode
                                          .currentState!
                                          .validate()) {
                                        await SettingsCubit.get(context)
                                            .subscription(
                                                planId: widget.planeId,
                                                promoCode:
                                                    SettingsCubit.get(context)
                                                        .promocodeController
                                                        .text);
                                      }
                                    }
                                  }),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: CustomButtonLarge(
                                  text: AppLocalizations.of(context)!.submet,
                                  color: kPrimaryKey,
                                  textColor: Colors.white,
                                  function: () {
                                    if (SettingsCubit.get(context)
                                        .formKeyPromoCode
                                        .currentState!
                                        .validate()) {
                                      SettingsCubit.get(context)
                                          .getPromoCodeDetails(
                                              id: SettingsCubit.get(context)
                                                  .promocodeController
                                                  .text,
                                              planeId: widget.planeId);
                                    }
                                  }),
                            ),
                ],
              ),
            ),
          );
        }));
  }
}
