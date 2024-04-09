// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import '../../../constants.dart';
// import '../../../core/assets/Assets.dart';
// import '../../../core/utils/app_router.dart';
// import '../../../core/utils/shared_preferences_cash_helper.dart';
// import '../../../core/utils/styles.dart';
// import '../data/models/onBoeding_model.dart';
// import 'on_boarding_item.dart';

// class OnBoardingScreen extends StatefulWidget {
//   OnBoardingScreen({Key? key}) : super(key: key);
//   bool isLast = false;
//   @override
//   State<OnBoardingScreen> createState() => _OnBoardingScreenState();
// }

// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var BoardController = PageController();

//     List<OnBoardingModel> modelBoarding = [
//       OnBoardingModel(
//           image: AssetsData.emailIcon, title: 'dddd', messege: 'dddd'),
//       OnBoardingModel(
//           image: AssetsData.emailIcon, title: 'ddd', messege: 'dddd'),
//       OnBoardingModel(
//           image: AssetsData.emailIcon, title: 'sssss', messege: 'sss'),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: TextButton(
//           onPressed: () {
//             submit();
//           },
//           child: Text('Skip', style: Styles.textStyle14),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(30.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: PageView.builder(
//                 itemBuilder: (context, index) =>
//                     BuildBoardingItem(model: modelBoarding[index]),
//                 itemCount: modelBoarding.length,
//                 physics: const BouncingScrollPhysics(),
//                 controller: BoardController,
//                 onPageChanged: (int index) {
//                   if (index == modelBoarding.length - 1) {
//                     setState(() {
//                       print('last');
//                       widget.isLast = true;
//                     });
//                   } else {
//                     setState(() {
//                       print('not last');
//                       widget.isLast = false;
//                     });
//                   }
//                 },
//               ),
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             Row(
//               children: [
//                 SmoothPageIndicator(
//                   controller: BoardController,
//                   count: modelBoarding.length,
//                   effect: const ExpandingDotsEffect(
//                       activeDotColor: kPrimaryKey,
//                       dotColor: Colors.grey,
//                       dotHeight: 10,
//                       expansionFactor: 4,
//                       dotWidth: 10,
//                       spacing: 5),
//                 ),
//                 const Spacer(),
//                 TextButton(
//                     onPressed: () {
//                       if (widget.isLast == true) {
//                         submit();
//                       } else {
//                         BoardController.nextPage(
//                             duration: const Duration(milliseconds: 750),
//                             curve: Curves.fastLinearToSlowEaseIn);
//                       }
//                     },
//                     child: Text(
//                       'next',
//                       style: Styles.textStyle24,
//                     )),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   void submit() {
//     getIt
//         .get<CashHelperSharedPreferences>()
//         .saveData(key: 'onBoarding', value: true)
//         .then((value) {
//       getIt.get<CashHelperSharedPreferences>().getData(key: 'uId') != null
//           ? customGoNavigate(context: context, path: AppRouter.kHomeView)
//           : customGoNavigate(context: context, path: AppRouter.kLoginView);
//     });
//   }
// }
