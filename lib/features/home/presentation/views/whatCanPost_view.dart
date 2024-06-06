import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/generated/l10n.dart';

class WhatCanPostView extends StatelessWidget {
  WhatCanPostView({super.key});
  final List<String> platformNames = [
    'Instagram',
    'Facebook',
    'Twitter',
    'Linkedin',
    'Reddit',
    'Tiktok',
    'Pinterest',
    'Telegram',
    'Youtube',
    'GoogleBusiness',
  ];
  final List<String> platformIcons = [
    AssetsData.instagramIcon,
    AssetsData.faceBookIcon,
    AssetsData.xIcon,
    AssetsData.linkedln,
    AssetsData.reddit,
    AssetsData.tiktok,
    AssetsData.pinterest,
    AssetsData.telegram,
    AssetsData.youtube,
    AssetsData.googleBusiness,
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> platformsDetails = [
      S.of(context).detailsInstagram,
      S.of(context).detailsFaceBook,
      S.of(context).detailsX,
      S.of(context).detailsLinkedIn,
      S.of(context).detailsReddit,
      S.of(context).detailsTiktok,
      S.of(context).detailsPintrest,
      S.of(context).detailsTelegrame,
      S.of(context).detailsYoutube,
      S.of(context).detailsGoogle,
    ];
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: kPrimaryKey),
          ),
          title: CustomTitleText(text: S.of(context).whatUCanPost),
        ),
        body: SafeArea(
            child: ListView.builder(
          itemCount: platformNames.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: IntrinsicHeight(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                platformIcons[index],
                                height: 40.h,
                                width: 40.w,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                platformNames[index],
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const Spacer(),
                              Text(
                                platformsDetails[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        )));
  }
}
