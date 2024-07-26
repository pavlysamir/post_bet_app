import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/widgets/Custom_AppBar.dart';
import 'package:post_bet/features/home/data/post_repo.dart';
import 'package:post_bet/features/home/presentation/manager/add_post_cubit/cubit/add_post_cubit.dart';
import 'package:post_bet/features/home/presentation/views/widgets/photo_widget.dart';
import 'package:post_bet/features/seach_photo/presentation/serach_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
//  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostCubit(getIt.get<PostReposatory>()),
      child: BlocConsumer<AddPostCubit, AddPostState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                SliverToBoxAdapter(
                  child: SafeArea(
                    child: Form(
                      // key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomAppBar(
                            image: 'd',
                          ),
                          SizedBox(
                            height: 21.h,
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const SearchScreen();
                                }));
                              },
                              child: Container(
                                height: 60.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: kPrimaryKey,
                                    )),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 50.w,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.cardNumber,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    const Icon(
                                      Icons.search_rounded,
                                      color: kPrimaryKey,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          // SearchBarWidget(
                          //   onChanged: (p0) {},
                          // ),
                          // SizedBox(
                          //   height: 40.h,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                // const SliverToBoxAdapter(
                //   child: CustomImgTempleteListview(),
                // ),

                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      AppLocalizations.of(context)!.paymentAmount,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  sliver: PhotosWidget(),
                ),
              ]));
        },
      ),
    );
  }
}
