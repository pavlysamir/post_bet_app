import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/widgets/custom_button_small.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../constants.dart';
import '../../../core/assets/Assets.dart';
import '../../../core/utils/shared_preferences_cash_helper.dart';
import '../../../core/utils/styles.dart';
import '../data/models/onBoeding_model.dart';
import 'on_boarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  bool isLast = false;
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    var BoardController = PageController();

    List<OnBoardingModel> modelBoarding = [
      OnBoardingModel(
          image: AssetsData.onBoarding1,
          title: AppLocalizations.of(context)!.onBoardingSlider1,
          messege: AppLocalizations.of(context)!.onBoardingSlider1subTitle1),
      OnBoardingModel(
          image: AssetsData.onBoarding2,
          title: AppLocalizations.of(context)!.onBoardingSlider2,
          messege: AppLocalizations.of(context)!.onBoardingSlider2subTitle1),
      OnBoardingModel(
          image: AssetsData.onBoarding3,
          title: AppLocalizations.of(context)!.onBoardingSlider3,
          messege: AppLocalizations.of(context)!.onBoardingSlider3subTitle1),
      OnBoardingModel(
          image: AssetsData.onBoarding4,
          title: AppLocalizations.of(context)!.onBoardingSlider4,
          messege: AppLocalizations.of(context)!.onBoardingSlider4subTitle1),
    ];

    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          onPressed: () {
            submit();
          },
          child: Text(AppLocalizations.of(context)!.skip,
              style: Styles.textStyle14Grey),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  Image.asset(AssetsData.newDesignLogoName),
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) =>
                    BuildBoardingItem(model: modelBoarding[index]),
                itemCount: modelBoarding.length,
                physics: const BouncingScrollPhysics(),
                controller: BoardController,
                onPageChanged: (int index) {
                  if (index == modelBoarding.length - 1) {
                    setState(() {
                      print('last');
                      widget.isLast = true;
                    });
                  } else {
                    setState(() {
                      if (kDebugMode) {
                        print('not last');
                      }
                      widget.isLast = false;
                    });
                  }
                },
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: BoardController,
                  count: modelBoarding.length,
                  effect: ExpandingDotsEffect(
                      activeDotColor: kPrimaryKey,
                      dotColor: Colors.grey,
                      dotHeight: 6.h,
                      expansionFactor: 3,
                      dotWidth: 10,
                      spacing: 5),
                ),
                const Spacer(),
                CustomButtonSmall(
                    width: 100,
                    function: () {
                      if (widget.isLast == true) {
                        submit();
                      } else {
                        BoardController.nextPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    text: AppLocalizations.of(context)!.next,
                    borderColor: kPrimaryKey)
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  void submit() {
    getIt
        .get<CashHelperSharedPreferences>()
        .saveData(key: 'onBoarding', value: true)
        .then((value) {
      customGoAndDeleteNavigate(context: context, path: AppRouter.kWelcomeView);
    });
  }
}
